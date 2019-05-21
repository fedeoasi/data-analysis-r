import sbt._

object Dependencies {
  lazy val airframeLog = "org.wvlet.airframe" %% "airframe-log" % "0.52"
  lazy val arm = "com.jsuereth" %% "scala-arm" % "2.0"

  lazy val scalaTest = "org.scalatest" %% "scalatest" % "3.0.3" % Test
  lazy val commonsIo = "commons-io" % "commons-io" % "2.4"
  lazy val scalaCsv = "com.github.tototoshi" %% "scala-csv" % "1.3.5"
  lazy val scopt = "com.github.scopt" %% "scopt" % "3.7.0"
  lazy val json4sNative = "org.json4s" %% "json4s-native" % "3.6.5"
  lazy val scalaTestPlay = "org.scalatestplus.play" %% "scalatestplus-play" % "4.0.2" % Test
  lazy val webJarsBootstrap = "org.webjars" % "bootstrap" % "4.3.1"

}
