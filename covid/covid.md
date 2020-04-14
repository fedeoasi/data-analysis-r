---
always_allow_html: True
layout: post
output:
  md_document:
    pandoc_args:
    - '-s'
    - '-t'
    - markdown
tags:
- covid
title: 'COVID-19: United States and Italy'
---

Introduction
------------

This blog post is about evaluating the growth rate of the spread of
COVID-19 in the United States and Italy.

The virus has already inflicted a lot of suffering to many people around
the world, the hope is that analyses of past and present behavior will
help us be better prepared in the future.

Dataset
-------

-   For the United States, the data used is from the [COVID Tracking
    Project](https://covidtracking.com/), which aggregates data from
    state and local governments
-   For Italy, the data is provided by the Civil Protection Department
    on a [Github repository](https://github.com/pcm-dpc/COVID-19)

Both datasets provide time series data about the number of cases,
deaths, people being tested, and more.

What we are going to use in this analysis is the number of people who
tested positive, and the number of deaths. The former gives an idea of
what to expect in the future, but seems highly dependent on how much
testing is performed. The latter is more realistic (assuming that most
covid deaths are reported) but lags in showing the effects of measures
such as lockdowns and social distancing.

Methodology
-----------

Most of the growth curves are simple
[exponential](https://en.wikipedia.org/wiki/Exponential_function)
curves. Here we estimate the parameters of an exponential function, and
show the growth rate. A growth rate of 1.30 means 30% day to day growth.

Most graphs shown in the rest of this post show the side by side
comparison of positive over time, and deaths over time.

United States and Italy
-----------------------

![](/assets/covid/unnamed-chunk-2-1.png)

The United States is currently experiencing 17.3% daily growth in the
number of positive cases, and about 24% growth in the number of deaths.
The inferred exponential function is a good fit, especially for the
graph about deaths.

If we look at the graph below for Italy, the exponential function is no
longer a good fit for either positive or deaths, because it appears to
have flattened. A
[sigmoid](https://en.wikipedia.org/wiki/Sigmoid_function) function would
fit better, but that will be left for a later improvement to the
methodology.

![](/assets/covid/unnamed-chunk-3-1.png)

To really compare the United States with Italy, we need to look at the
period for Italy that has experienced exponential growth. In the next
graph we only kept the dates on or before March 17th.

Until then, the daily growth in the number of cases was almost 19% and
for deaths it was 24%. These numbers are remarkably similar to what the
United States is experiencing at this time.

![](/assets/covid/unnamed-chunk-4-1.png)

If we drill down to one of the most hit regions of Italy (Lombardia, the
region where Milan is), we surprisingly find slightly lower numbers.

![](/assets/covid/unnamed-chunk-5-1.png)

US State-by-State Analysis
--------------------------

The following table shows the growth rates for the US broken up by
state. Death Growth and Positive Growth are the same rates as computed
in the prior section. We are also showing the total numbers of deaths,
positive, and tested to help contextualize the growth (e.g., 40% growth
when the number of cases is very low could be just caused by reporting
and is unlikely to be sustained in the future).

<!--html_preserve-->
<div id="htmlwidget_container">

<div id="htmlwidget-0acbb9b4a24f2a854007" class="datatables html-widget"
style="width:100%;height:500px;">

</div>

</div>

<script type="application/json" data-for="htmlwidget-0acbb9b4a24f2a854007">{"x":{"filter":"none","extensions":["FixedColumns","FixedHeader"],"data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53"],["HI","AL","NC","NJ","NM","MD","KY","CT","MA","TN","IL","NY","RI","MI","WI","ME","PA","PR","IN","NV","FL","DC","MN","TX","OH","IA","KS","AZ","CO","NH","OK","MS","NE","DE","LA","UT","SC","VA","GA","GU","WV","CA","AR","MO","MT","AK","ID","OR","ND","VT","WA","SD","MP"],[1.5514,1.3459,1.3165,1.315,1.3036,1.2964,1.2799,1.2768,1.2757,1.2735,1.2668,1.2617,1.2617,1.2592,1.2555,1.2496,1.2464,1.2419,1.2418,1.2385,1.238,1.2378,1.2358,1.2336,1.2312,1.2228,1.2226,1.2184,1.2179,1.212,1.2113,1.2074,1.2026,1.2013,1.1983,1.1961,1.1899,1.1897,1.1848,1.1844,1.1819,1.1774,1.1741,1.1528,1.15,1.1456,1.1303,1.1252,1.1248,1.1145,1.0903,1.0574,0],[1.142,1.1294,1.1503,1.2006,1.1565,1.1972,1.1761,1.202,1.1892,1.1456,1.1773,1.1521,1.1546,1.0929,1.1364,1.1189,1.2197,1.2256,1.2081,1.1713,1.1922,1.1738,1.115,1.1958,1.1727,1.1582,1.177,1.1558,1.1612,1.1595,1.2009,1.1443,1.1817,1.1639,1.2279,1.1439,1.1814,1.1963,1.1774,1.0939,1.1555,1.1648,1.0968,1.1971,1.0996,1.1171,1.2524,1.1408,1.1168,1.1425,1.1091,1.1831,0],[3,43,24,846,10,53,37,165,216,43,243,3565,17,540,56,10,136,18,116,46,191,21,24,105,102,14,21,52,111,7,42,35,6,14,409,8,40,52,201,4,2,276,14,24,5,5,10,26,3,20,345,2,1],[319,1580,2402,34124,495,3125,831,5276,11736,3321,10357,113704,806,16395,2112,456,10017,452,3953,1742,11111,902,865,6110,3739,786,698,2019,4173,540,1159,1455,321,593,12496,1428,1917,2407,6160,93,282,12026,743,2291,265,171,1013,999,186,461,7934,212,8],[12278,10853,38773,75356,15632,25610,15572,22029,68800,41391,53581,283621,6390,53800,25971,6544,70030,4186,19800,16163,103348,6438,25423,63751,41871,10240,7578,27160,22071,7599,2521,6588,5389,6467,58498,28043,18314,21552,26294,565,7686,126700,10370,24905,6177,6040,8870,17534,6207,5844,83567,5225,33]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>State<\/th>\n      <th>Death Growth<\/th>\n      <th>Positive Growth<\/th>\n      <th>Deaths<\/th>\n      <th>Positive<\/th>\n      <th>Tested<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"scrollX":true,"paging":true,"fixedHeader":true,"sorting":true,"columnDefs":[{"className":"dt-right","targets":[2,3,4,5,6]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
<script type="application/htmlwidget-sizing" data-for="htmlwidget-0acbb9b4a24f2a854007">{"viewer":{"width":"100%","height":350,"padding":15,"fill":false},"browser":{"width":"100%","height":500,"padding":40,"fill":false}}</script>
<!--/html_preserve-->
<br><br><br><br> Below are the side by side graphs for some selected
states.

New York seems to have flattened the positive growth curve, but its
death growth is still exponential. It is the state that seems to be
closer to Italy in terms of timeline.

![](/assets/covid/unnamed-chunk-7-1.png)

California is still in the exponential growth phase, but its death
growth is a bit better than the national one.

![](/assets/covid/unnamed-chunk-8-1.png)

Illinois is also in the exponential growth phase. The growth is slowing
down on a daily basis, but the exponential function is still a very good
fit.

![](/assets/covid/unnamed-chunk-9-1.png)

Conclusion
----------

There is still a lot to do to make this analysis more informative, but
it was interesting to see how close to a simple exponential most of
these curves are. Hopefully the curves will flatten everywhere.

Next I'll be working on figuring out how these growth rates change over
time. Please leave some comments below with suggestions or things I
might have missed.
