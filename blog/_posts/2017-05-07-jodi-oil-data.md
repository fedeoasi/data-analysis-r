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

Dataset
=======

<!-- In this write up, we are going to explore data provided by the Joint Organisations Data Initiative (JODI), an international organization that provides open data about oil and natural gas. The first data gathering exercise was launched in 2001 and many countries participated adding up to an estimated coverage of about 90% world supply. -->
The dataset used is the World Primary dataset, which can be downloaded
from the [Data
Downloads](https://www.jodidata.org/oil/database/data-downloads.aspx)
page on the JODI website. The dataset contains data about Crude Oil,
Natural Gas Liquids (NGL), and other primary sources (Other). The World
Secondary dataset contains data about secondary products such as
Gas/Diesel oil, Fuel oil, etc.

Disclaimer: I am not an energy expert. Most of what I know comes from
reading [The
Quest](https://www.amazon.com/Quest-Energy-Security-Remaking-Modern/dp/0143121944)
by Daniel Yergin, a book that I highly recommend to anybody who is
interested in the history of different energy sources and the
geopolitical implications of energy.

``` {.r}
#The analysis that follows was performed using R with the following libraries:
library(knitr)
library(dplyr)
library(ggplot2)
```

The variables we are going to use are: country, date (year), quantity
(in Thousands of Barrels Per Day), product, flow (Production, Imports,
and Exports). As a preprocessing step, data about the current year
(2017) was removed because it is (understandably) incomplete. Also, our
generated graphs only show the last ten years so that they can fit
nicely on the screen.

Products
--------

One of the data fields is Product, which is divided in Crude Oil,
Natural Gas Liquids (not to be confused with Natural Gas), Other Crude,
and Total Crude, which acts as the sum of the prior three. For some
reason Total Crude is missing from some years.

We are going to be using Crude Oil as a proxy for the total production.
As the graph below shows this is a reasonable assumption since most of
the production is crude oil, and it roughly follows the same pattern. In
addition, we found that the reporting for Crude Oil has less missing
entries (NA values) than Total Crude.

![](/assets/jodi-oil/unnamed-chunk-2-1.png)

World Production
----------------

In this section we are going to first look at the world prodution and
then drill down at the country level. The goal is to give a good idea on
who the top producers are and what were the recent changes and trends.

The world production has mostly gone up in the past 10 years, with the
exception of the Great Recession of 2008, which lowered production by
first lowering demand. It was mostly flat between 2009 and 2011, and it
picked up nicely afterwards.

![](/assets/jodi-oil/unnamed-chunk-3-1.png)

### Top Producers

Three countries are definitely the top producers: Saudi Arabia, Russia,
and the United States. To compete in the top three, a country has to be
able to produce around 10 million barrels per day.

Iraq, China, and Iran complete the top 5 across the last four years.
Their output ranges between 3 and 5 million barrels per day.

Recent four year trends that can be seen in the production table:
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
  Country        2016    2015    2014    2013
  ----------- ------- ------- ------- -------
  SARABIA       10489   10193    9713    9637
  RUSSIA        10378   10111   10088   10047
  USA            8901    9415    8764    7468
  IRAQ           4661    3504    3110    2978
  CHINA          4003    4289    4200    4175
  IRAN           3661    3152    3117    3576
  CANADA         3110    2849    2779    2504
  KUWAIT         2712    2640    2869    2922
  BRAZIL         2522    2443    2260    2029
  UAE            2466    3224    3037    3048
  VENEZOPEC      2386    2656    2683    2787
  MEXICO         2162    2270    2434    2531
  NIGERIA        1827    2135    2189    2219
  ANGOLALL       1713    1762    1651    1702
  NORWAY         1643    1593    1563    1526

  : Top 15 Crude Oil Producers (Thousands of Barrels Per Day (kbd))

If we only look at the three major producers, we can see that the United
States has recovered a lot of ground in the last few years:

![](/assets/jodi-oil/unnamed-chunk-5-1.png)

Individual Countries
====================

Production, Imports, and Exports
--------------------------------

### Saudi Arabia

Saudi Arabia is the world top producer.

![](/assets/jodi-oil/unnamed-chunk-7-1.png)

### Russia

    ## Warning: Removed 8 rows containing missing values (geom_bar).

![](/assets/jodi-oil/unnamed-chunk-8-1.png)

### United States

The United States has seen a boom in oil production after 2010, which is
commonly attributed to the technological advances in horizontal drilling
and hydraulic fracturing. The graph also shows declining imports and
rising exports, although they are still very small when compared to
production and imports.

![](/assets/jodi-oil/unnamed-chunk-9-1.png)

### Iraq

![](/assets/jodi-oil/unnamed-chunk-10-1.png)

### Brazil

![](/assets/jodi-oil/unnamed-chunk-11-1.png)

### Venezuela

![](/assets/jodi-oil/unnamed-chunk-12-1.png)

### Nigeria

    ## Warning: Removed 2 rows containing missing values (geom_bar).

![](/assets/jodi-oil/unnamed-chunk-13-1.png)
