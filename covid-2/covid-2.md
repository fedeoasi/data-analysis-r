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
title: 'COVID-19: Growth Rates and Flattening the Curve'
---

Introduction
------------

This blog post is a follow up to [COVID-19: United States and
Italy](/2020/04/05/covid-1.html). This page contains an update using
data as of April 13th as well as a refined methodology.

Countries like Italy and the United States that have been hit hard by
the virus have been working on ["flattening the
curve"](https://en.wikipedia.org/wiki/Flatten_the_curve), which means
slowing down the growth of new cases (and deaths as a consequence) so
that the health care system does not get overwhelmed. We will look at
curves and growth rates and see that they are indeed slowing down.

Dataset
-------

-   For the United States, the data used is from the [COVID Tracking
    Project](https://covidtracking.com/), which aggregates data from
    state and local governments
-   For Italy, the data is provided by the Civil Protection Department
    on a [Github repository](https://github.com/pcm-dpc/COVID-19)

Both datasets provide time series data about the number of cases,
deaths, people being tested, and much more.

Methodology
-----------

In the prior post the growth rate was shown of people who tested
positive and deaths as of April 4th. In this post we are going to use
the same type of data but updated as of April 13th, and do the
following:

-   Refine the model used for the regression using a [sigmoid
    function](https://en.wikipedia.org/wiki/Sigmoid_function) instead of
    a simple exponential function
-   Look at how the growth rate (computed using the simple exponential)
    is changing over time

Growth Curves
-------------

In the prior post we saw that a simple exponential curve was already not
a good fit for Italy and for New York State. This because the growth
curve had already been flattened in those places. A week later this is
true also for the United States at large.

Below is the fitting of a simple exponential function for the United
States, which does not fit well any longer.

![](/assets/covid-2/unnamed-chunk-2-1.png)

A sigmoid function is a better fit for the US data:

![](/assets/covid-2/unnamed-chunk-3-1.png)

We can also try and predict the totals using learned sigmoid function.
The expected total is reported in the graph titles. The sigmoid used in
this post is very simple and encodes some assumptions that may not be
true (for example that the exponential growth at the beginning and
flattening at the end have similar shapes). A better model for
predictions that is being cited a lot is the [IHME
model](https://covid19.healthdata.org/united-states-of-america).

The simple sigmoid prediction gives a similar number to the IMHE model
for deaths in Italy (21,613 vs 21,130), but a vastly different number
for the United States (32,538 vs 68,841). Even in the IMHE model, the
margin of error is very large so we should not rely on those predictions
too much. They should though get more accurate over time as we can
update parameters or refine models as new data comes in.

![](/assets/covid-2/unnamed-chunk-4-1.png)

Growth Over Time
----------------

Another piece of data worth following is how the estimated growth rate
changes over time. The following graphs show the evolution of the growth
rates for positive and deaths. To compute the growth rates for a date,
we take all the data on or before that date and estimate the growth rate
by fitting an exponential curve.

The growth of new cases and deaths has been recently decreasing in both
the United States and Italy, which is good news. Deaths seem to follow
new cases (positive) with a lag, especially in this late stage of
decrease in both.

![](/assets/covid-2/unnamed-chunk-6-1.png)

![](/assets/covid-2/unnamed-chunk-7-1.png)

Individual US States
--------------------

This section shows growth rates for individual US states. I did not have
time to do an in depth analysis of the single US states, but I am adding
the graphs and data here for readers that might be interested in doing
their own assessment. Let me know in the comments if you would like to
see the graphs for any particular states.

<!--html_preserve-->
<div id="htmlwidget_container">

<div id="htmlwidget-d906d4d18175735c21c3" class="datatables html-widget"
style="width:100%;height:500px;">

</div>

</div>

<script type="application/json" data-for="htmlwidget-d906d4d18175735c21c3">{"x":{"filter":"none","extensions":["FixedColumns","FixedHeader"],"data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55"],["MD","MA","PA","CT","MO","RI","NC","IL","NJ","WV","KS","NH","IN","MI","DC","MN","NY","KY","WI","VA","HI","TX","NM","CO","PR","NV","FL","MS","AL","IA","OH","TN","NE","AZ","DE","CA","ID","OK","GA","SC","LA","UT","ND","ME","SD","AR","OR","AK","GU","MP","WA","VT","MT","VI","WY"],[1.1949,1.1777,1.1759,1.1739,1.1723,1.1708,1.1637,1.1602,1.1599,1.1582,1.1565,1.1563,1.156,1.1491,1.1482,1.1482,1.1478,1.1471,1.1469,1.1462,1.1449,1.1429,1.1423,1.1407,1.1404,1.1401,1.1395,1.1376,1.1361,1.1354,1.1348,1.1339,1.1296,1.129,1.1283,1.1266,1.1264,1.1255,1.1214,1.1195,1.1188,1.1171,1.1164,1.1123,1.1081,1.1062,1.1015,1.0915,1.077,1.0746,1.0705,1.069,1.0512,0,0],[1.1395,1.1213,1.131,1.1287,1.1093,1.1561,1.0996,1.1151,1.1128,1.1038,1.1108,1.093,1.1186,1.07,1.1163,1.0877,1.0952,1.1221,1.0858,1.1283,1.0603,1.1241,1.1233,1.0996,1.1171,1.0988,1.1102,1.1006,1.1087,1.1066,1.1025,1.085,1.1224,1.0971,1.1335,1.1043,1.0873,1.1074,1.1139,1.1058,1.1117,1.0884,1.0757,1.065,1.1713,1.0792,1.0847,1.0749,1.0654,1.0403,1.0725,1.0894,1.0613,1.0291,0],[262,844,524,602,114,73,86,794,2443,9,62,23,350,1602,53,70,10056,97,154,149,9,287,26,304,45,114,483,98,99,43,274,109,17,122,35,687,27,99,464,82,884,18,8,19,6,30,53,8,5,2,508,28,7,1,1],[8936,26867,24199,13381,4388,2976,4816,22025,64584,626,1376,985,8236,25635,1955,1650,195031,1963,3428,5747,499,13906,1245,7684,903,2971,20601,2942,3734,1710,6975,5610,814,3702,1625,22348,1426,2069,13315,3319,21016,2363,331,698,868,1410,1584,277,135,11,10411,748,394,51,275],[51751,122049,129792,44309,45428,20661,63388,105768,129469,16655,13864,11332,44539,82644,10934,38427,478357,25866,40470,41874,18844,133226,30515,37534,8151,25464,197996,30984,29182,18696,65112,76195,10972,43347,11820,204082,14881,22859,57021,31425,108091,45787,10781,12306,9002,20804,31121,8038,905,47,93802,10366,9098,375,5964]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>State<\/th>\n      <th>Death Growth<\/th>\n      <th>Positive Growth<\/th>\n      <th>Deaths<\/th>\n      <th>Positive<\/th>\n      <th>Tested<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"scrollX":true,"paging":true,"fixedHeader":true,"sorting":true,"columnDefs":[{"className":"dt-right","targets":[2,3,4,5,6]},{"orderable":false,"targets":0}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
<script type="application/htmlwidget-sizing" data-for="htmlwidget-d906d4d18175735c21c3">{"viewer":{"width":"100%","height":350,"padding":15,"fill":false},"browser":{"width":"100%","height":500,"padding":40,"fill":false}}</script>
<!--/html_preserve-->
<br><br><br><br> Below are the side by side graphs for some selected
states.

### New York

![](/assets/covid-2/unnamed-chunk-9-1.png)![](/assets/covid-2/unnamed-chunk-9-2.png)

### California

![](/assets/covid-2/unnamed-chunk-10-1.png)![](/assets/covid-2/unnamed-chunk-10-2.png)

### Illinois

![](/assets/covid-2/unnamed-chunk-11-1.png)![](/assets/covid-2/unnamed-chunk-11-2.png)

Conclusion
----------

We are seeing some encouraging signs that we are past the phase of
exponential growth. The sigmoid allowed some nice curve fitting, but we
may need refine that further to match reality better in the last phase.

Please leave some comments below with suggestions or things I might have
missed.
