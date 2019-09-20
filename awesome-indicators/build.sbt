import Dependencies._

lazy val root = (project in file("."))
  .settings(
    inThisBuild(List(
      organization := "com.github.fedeoasi",
      scalaVersion := "2.11.12",
      version      := "0.1.0-SNAPSHOT"
    )),
    herokuAppName in Compile := "indycators",
    name := "Awesome Indicators",
    libraryDependencies ++= Seq(
      airframeLog, arm, webJarsBootstrap, commonsIo, guice, json4sNative, scalaCsv, scalaTest, scalaTestPlay, scopt)
  ).enablePlugins(PlayScala)
