package com.github.fedeoasi

import java.io.{FileInputStream, FileOutputStream}
import java.net.URL
import java.nio.file.{Path, Paths}

import org.json4s.{Formats, StreamInput}
import resource._

// TODO add custom serializer for URLs
case class Indicator(
  name: String, category: String, description: Option[String], link: URL, extraLink: Option[URL], tags: Seq[String])
case class SerializedIndicator(
  name: String, category: String, description: Option[String], link: String, extraLink: Option[String], tags:  Option[Seq[String]])
case class Indicators(indicators: Seq[SerializedIndicator])

object IndicatorReader {
  import org.json4s.native.Serialization._
  implicit val formats: Formats = org.json4s.DefaultFormats

  def readJson(file: Path): Seq[Indicator] = {
    read[Indicators](StreamInput(new FileInputStream(file.toFile))).indicators.map { i =>
      Indicator(i.name, i.category, i.description, new URL(i.link), i.extraLink.flatMap(toUrl), i.tags.getOrElse(Seq.empty))
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
           |[Link](${indicator.link})
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
    val indicators = IndicatorReader.readJson(Paths.get("public/indicators.json"))
    val markdown = MarkdownConverter.convert(indicators)
    println(markdown)
    managed(new FileOutputStream("../blog/indicators.md")).acquireAndGet(_.write(markdown.getBytes))
  }
}

