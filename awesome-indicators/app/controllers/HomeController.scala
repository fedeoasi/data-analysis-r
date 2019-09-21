package controllers

import com.github.fedeoasi.{IndicatorReader, IndicatorRepository}
import javax.inject._
import play.api.mvc._

/**
 * This controller creates an `Action` to handle HTTP requests to the
 * application's home page.
 */
@Singleton
class HomeController @Inject()(cc: ControllerComponents) extends AbstractController(cc) {
  val indicatorRepo = {
    val inputStream = getClass.getClassLoader.getResourceAsStream("public/indicators.json")
    val indicators = IndicatorReader.readJson(inputStream)
    new IndicatorRepository(indicators)
  }

  /**
   * Create an Action to render an HTML page.
   *
   * The configuration in the `routes` file means that this method
   * will be called when the application receives a `GET` request with
   * a path of `/`.
   */
  def index() = Action { implicit request: Request[AnyContent] =>
    Ok(views.html.index())
  }

  def indicator(id: Long) = Action { implicit request: Request[AnyContent] =>
    indicatorRepo.findById(id) match {
      case Some(indicator) => Ok(indicator.toString)
      case None => NotFound(s"Cannot find indicator with id $id")
    }
  }
}
