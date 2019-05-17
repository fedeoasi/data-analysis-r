package com.github.fedeoasi

import java.nio.file.Paths

class IndicatorRepository(indicators: Seq[Indicator]) {
  def all: Seq[Indicator] = indicators

  def findByCategory(category: String): Seq[Indicator] = {
    indicators.filter(_.category == category)
  }

  def findByTag(tag: String): Seq[Indicator] = {
    indicators.filter(_.tags.contains(tag))
  }
}

object IndicatorRepository {
  def main(args: Array[String]): Unit = {
    val indicators = IndicatorReader.readJson(Paths.get("indicators.json"))
    val repo = new IndicatorRepository(indicators)

    println(repo.findByCategory("Automotive").mkString("\n"))
  }
}