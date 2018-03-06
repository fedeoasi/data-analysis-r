---
layout: post
output:
  md_document:
    pandoc_args:
    - '-s'
    - '-t'
    - markdown
title: Trends in the JODI Dataset
---

Introduction
------------

In this write up, we are going to explore data provided by the Joint
Organisations Data Initiative (JODI), an international organization that
provides open data about oil and natural gas. JODI operated since its
launch in 2001 as a joint effort of many countries with an estimated
coverage of more than 90% of the world supply. The [Participating
Economies](https://www.jodidata.org/oil/participants/participating-economies.aspx)
page lists the countries providing data to JODI.

The dataset used is the World Primary dataset, which can be downloaded
from the [Data
Downloads](https://www.jodidata.org/oil/database/data-downloads.aspx)
page on the JODI website. The dataset contains data about Crude Oil,
Natural Gas Liquids (NGL), and other primary sources (Other). There is
also a World Secondary dataset which contains data about secondary
products such as Gas/Diesel oil, Fuel oil, etc.

Disclaimer: I am not an energy expert. Most of what I know comes from
reading [The
Quest](https://www.amazon.com/Quest-Energy-Security-Remaking-Modern/dp/0143121944)
by Daniel Yergin, a book that I highly recommend to anybody who is
interested in the history of all energy sources and the geopolitical
implications of energy.

Dataset
-------

The variables we are going to use are:
<ul>
<li>
Country
</li>
<li>
Date (year)
</li>
<li>
Quantity (in Thousands of Barrels Per Day)
</li>
<li>
Product
</li>
<li>
Flow (Production, Imports, and Exports)
</li>
</ul>
As a preprocessing step, data for the current year (2017) was removed
because we are comparing full years. Also, our graphs only show the last
ten years so that they can fit nicely on the screen.

### Products

One of the dimensions of the JODI data is Product. A description of the
values can be found on the [JODI
website](https://www.jodidata.org/oil/support/user-guide/data-available-in-the-jodi-oil-world-database.aspx).
Here are the product descriptions:

<ul>
<li>
Crude Oil: Including lease condensate - excluding NGL
</li>
<li>
Natural Gas Liquids: Liquid or liquefied hydrocarbons recovered from gas
separation plants and gas processing facilities
</li>
<li>
Other: Refinery feedstocks + additives/oxygenates + other hydrocarbons
</li>
<li>
Total: Sum of categories (1) to (3) Total = Crude oil + NGL + Other
</li>
</ul>
Ideally we would use Total to compare production but there are a lot of
missing datapoints (NA values) on anything that isn't crude oil. For
this reason the graphs in the rest of this document are using the Crude
Oil product. As the graph below shows this is a reasonable assumption
since most of the production is crude oil, and it roughly follows the
same pattern.

![](/assets/jodi-oil/unnamed-chunk-2-1.png)

World Production
----------------

In this section we are going to first look at the world prodution and
then drill down to the country level. The goal is to give an idea on who
the top producers are and look at the recent changes and trends.

The world production has gone up in the past 10 years, with the
exception of the Great Recession of 2008, which lowered demand and
production. It was mostly flat between 2009 and 2011 and it picked up
nicely afterwards.

![](/assets/jodi-oil/unnamed-chunk-3-1.png)

### Top Producers

Three countries are definitely the top producers: Saudi Arabia, Russia,
and the United States. To compete in the top three, a country has to be
able to produce around 10 million barrels per day.

Iraq, China, and Iran complete the top 5 across the last four years.
Their output ranges between 3 and 5 million barrels per day.

<table class="table">
<caption>
Top 15 Crude Oil Producers (Thousands of Barrels Per Day (kbd))
</caption>
<thead>
<tr>
<th style="text-align:left;">
Country
</th>
<th style="text-align:right;">
2016
</th>
<th style="text-align:right;">
2015
</th>
<th style="text-align:right;">
2014
</th>
<th style="text-align:right;">
2013
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
SARABIA
</td>
<td style="text-align:right;">
10489
</td>
<td style="text-align:right;">
10193
</td>
<td style="text-align:right;">
9713
</td>
<td style="text-align:right;">
9637
</td>
</tr>
<tr>
<td style="text-align:left;">
RUSSIA
</td>
<td style="text-align:right;">
10378
</td>
<td style="text-align:right;">
10111
</td>
<td style="text-align:right;">
10088
</td>
<td style="text-align:right;">
10047
</td>
</tr>
<tr>
<td style="text-align:left;">
USA
</td>
<td style="text-align:right;">
8901
</td>
<td style="text-align:right;">
9415
</td>
<td style="text-align:right;">
8764
</td>
<td style="text-align:right;">
7468
</td>
</tr>
<tr>
<td style="text-align:left;">
IRAQ
</td>
<td style="text-align:right;">
4661
</td>
<td style="text-align:right;">
3504
</td>
<td style="text-align:right;">
3110
</td>
<td style="text-align:right;">
2978
</td>
</tr>
<tr>
<td style="text-align:left;">
CHINA
</td>
<td style="text-align:right;">
4003
</td>
<td style="text-align:right;">
4289
</td>
<td style="text-align:right;">
4200
</td>
<td style="text-align:right;">
4175
</td>
</tr>
<tr>
<td style="text-align:left;">
IRAN
</td>
<td style="text-align:right;">
3661
</td>
<td style="text-align:right;">
3152
</td>
<td style="text-align:right;">
3117
</td>
<td style="text-align:right;">
3576
</td>
</tr>
<tr>
<td style="text-align:left;">
CANADA
</td>
<td style="text-align:right;">
3110
</td>
<td style="text-align:right;">
2849
</td>
<td style="text-align:right;">
2779
</td>
<td style="text-align:right;">
2504
</td>
</tr>
<tr>
<td style="text-align:left;">
KUWAIT
</td>
<td style="text-align:right;">
2712
</td>
<td style="text-align:right;">
2640
</td>
<td style="text-align:right;">
2869
</td>
<td style="text-align:right;">
2922
</td>
</tr>
<tr>
<td style="text-align:left;">
BRAZIL
</td>
<td style="text-align:right;">
2522
</td>
<td style="text-align:right;">
2443
</td>
<td style="text-align:right;">
2260
</td>
<td style="text-align:right;">
2029
</td>
</tr>
<tr>
<td style="text-align:left;">
UAE
</td>
<td style="text-align:right;">
2466
</td>
<td style="text-align:right;">
3224
</td>
<td style="text-align:right;">
3037
</td>
<td style="text-align:right;">
3048
</td>
</tr>
<tr>
<td style="text-align:left;">
VENEZOPEC
</td>
<td style="text-align:right;">
2386
</td>
<td style="text-align:right;">
2656
</td>
<td style="text-align:right;">
2683
</td>
<td style="text-align:right;">
2787
</td>
</tr>
<tr>
<td style="text-align:left;">
MEXICO
</td>
<td style="text-align:right;">
2162
</td>
<td style="text-align:right;">
2270
</td>
<td style="text-align:right;">
2434
</td>
<td style="text-align:right;">
2531
</td>
</tr>
<tr>
<td style="text-align:left;">
NIGERIA
</td>
<td style="text-align:right;">
1827
</td>
<td style="text-align:right;">
2135
</td>
<td style="text-align:right;">
2189
</td>
<td style="text-align:right;">
2219
</td>
</tr>
<tr>
<td style="text-align:left;">
ANGOLALL
</td>
<td style="text-align:right;">
1713
</td>
<td style="text-align:right;">
1762
</td>
<td style="text-align:right;">
1651
</td>
<td style="text-align:right;">
1702
</td>
</tr>
<tr>
<td style="text-align:left;">
NORWAY
</td>
<td style="text-align:right;">
1643
</td>
<td style="text-align:right;">
1593
</td>
<td style="text-align:right;">
1563
</td>
<td style="text-align:right;">
1526
</td>
</tr>
</tbody>
</table>
### Trends

Recent trends that can be seen in the production table:
<ul>
<li>
The United States has consistently increased production and is getting
close to the top 2 (Saudi Arabia and Russia)
</li>
<li>
Iraq has increased production by about 50%, becoming a solid number four
</li>
<li>
Venezuela's output has decreased by about 10%
</li>
<li>
Nigeria's output has decreased by almost 20%
</li>
</ul>
If we only look at the three major producers, we can see that the United
States has recovered a lot of ground in the last few years:

![](/assets/jodi-oil/unnamed-chunk-5-1.png)

Individual Countries
--------------------

### Saudi Arabia

Saudi Arabia is usually considered the world top producer, even though
Russia comes pretty close and actually produced more than Saudi Arabia
in some years. Because of its low consumption, mostly due to having a
small population (31.54 million as of 2015), Saudi Arabia exports most
(80%) of what it produces.

![](/assets/jodi-oil/unnamed-chunk-7-1.png)

### Russia

Russia produces as much as Saudi Arabia, and even more in some years.
Russia has a larger population (144.1 million as of 2015) and a bigger
consumption than Saudi Arabia. Russia is able to export about half of
what it produces.

![](/assets/jodi-oil/unnamed-chunk-8-1.png)

### United States

The production of the United States is close to the top 2, but it still
has to import a significant amount of oil. Its large population (321.4
million as of 2015) and high consumption per capita makes the U.S.
import the equivalent of one more top producer.

The graph shows a boom in oil production after 2010, which is commonly
attributed to the technological advances in horizontal drilling and
hydraulic fracturing. The graph also shows declining imports and rising
exports, although exports are still tiny when compared to production and
imports.

![](/assets/jodi-oil/unnamed-chunk-9-1.png)

### Iraq

Iraq is an [OPEC](http://www.opec.org/opec_web/en/) member and has
become the second OPEC producer after Saudi Arabia and the fourth in the
world. Iraq doubled its oil production in the past ten years.

![](/assets/jodi-oil/unnamed-chunk-10-1.png)

### Venezuela

Venezuela is another OPEC member. Its economy is highly dependent on oil
and is the classic example of a petro state. Its oil output has been
decreasing by about 20% in the past few years.

![](/assets/jodi-oil/unnamed-chunk-11-1.png)

### Nigeria

Nigeria is another petro-state. It exports most of what it produces. Its
output has also been decreasing in the past five years, but the ten year
graph shows a bit more ups and downs.

![](/assets/jodi-oil/unnamed-chunk-12-1.png)

### Brazil

Brazil has mostly increased production in the past 10 years. It exports
about a third of what it produces.

![](/assets/jodi-oil/unnamed-chunk-13-1.png)
