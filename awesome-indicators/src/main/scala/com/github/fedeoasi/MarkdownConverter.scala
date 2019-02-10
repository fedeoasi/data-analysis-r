package com.github.fedeoasi

import java.io.{FileOutputStream, PrintWriter}
import java.net.URL
import java.nio.file.{Path, Paths}

import com.github.tototoshi.csv._
import resource._

case class Indicator(name: String, category: String, link: URL, extraLink: Option[URL])

object IndicatorReader {
  private val Name = "Name"
  private val Category = "Category"
  private val Link = "Link"
  private val Extra = "Extra Link"

  def read(file: Path): Seq[Indicator] = {
    managed(CSVReader.open(file.toFile)).acquireAndGet { reader =>
      reader.allWithHeaders().map { entry =>
        Indicator(entry(Name), entry(Category), new URL(entry(Link)), toUrl(entry(Extra)))
      }
    }
  }

  def toUrl(s: String): Option[URL] = if (s.nonEmpty) Some(new URL(s)) else None
}

object MarkdownConverter {
  private val header =
    s"""---
       |layout: page
       |title: Indicators
       |permalink: /indicators/
       |---
       |
       |* Table of Contents
       |{:toc}
       |
       |""".stripMargin

  def convert(indicators: Seq[Indicator]): String = {
    val indicatorsByCategory = indicators.groupBy(_.category)
    header + indicators.map(_.category).distinct.map { category =>
      val indicatorsForCategory = indicatorsByCategory(category)

      val printedIndicators = indicatorsForCategory.map { indicator =>
        s"""### ${indicator.name}
           |
           |<${indicator.link}>
        """.stripMargin
      }.mkString("\n")

      s"""## $category
         |
         |$printedIndicators
       """.stripMargin
    }.mkString("\n")
  }
}

object Main {
  def main(args: Array[String]): Unit = {
    val indicators = IndicatorReader.read(Paths.get("indicators.csv"))
    val markdown = MarkdownConverter.convert(indicators)
    println(markdown)
    managed(new FileOutputStream("../blog/indicators.md")).acquireAndGet(_.write(markdown.getBytes))
  }
}
