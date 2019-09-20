---
layout: post
output:
  md_document:
    pandoc_args:
    - '-s'
    - '-t'
    - markdown
tags:
- chicago
- weather
title: 'Chicago Temperatures (Part 2)'
---

Introduction
------------

This blog post is about temperatures in Chicago. The main goal is to
analyze patterns about temperatures in different months and the duration
of Chicago winters.

Dataset
-------

The dataset was downloaded from the National Oceanic and Atmospheric
Administration's (NOAA) [Climate Data Online
portal](https://www.ncdc.noaa.gov/cdo-web/) and contains the
temperatures recorded at the Chicago Midway weather station.

A subset of this dataset is utilized in the official Chicago temperature
dataset ([Climate of
Chicago](https://en.wikipedia.org/wiki/Climate_of_Chicago)). It was
chosen for this analysis because of its completeness.

Month Analysis
--------------

This section is about characterizing temperatures over different months
in Chicago.

We want to get an idea of what the coldest and hottest months are and
also learn about the temperature variability.

The following graphs show the temperature ranges for every month. Here's
how to read the graph:
<ul>
<li>
The red and blue boxes contain data between the 25th and the 75th
percentile for maximum and minimum temperatures respectively
</li>
<li>
The horizontal lines inside those boxes represent the average
</li>
<li>
The vertical lines coming out of the boxes are the remaining
temperatures (before the 25th and after the 75th percentiles)
</li>
<li>
The black dots represent outliers
</li>
</ul>
![](/assets/chicago-temp-2/unnamed-chunk-3-1.png)

Here are some findings:
<ul>
<li>
January and February are the coldest months followed by December
</li>
<li>
In the past five years, January was slightly colder than February
</li>
<li>
The hottest months are the summer months June, July, and August
</li>
<li>
The cold months have the highest variability while the hottest months
have very little variability
</li>
</ul>
![](/assets/chicago-temp-2/unnamed-chunk-4-1.png)

Most findings still hold on the above graph generated using the all time
temperatures (since 1930) except that December is roughly as cold as
February.

Winter Boundaries
-----------------

This section is about evaluating the duration of winter in Chicago.

The data that follows was computed using the definition of winter that
follows:
<ul>
<li>
Start: First day after July 31st that is at or below freezing.
</li>
<li>
End: Last day on or before July 31st that is at or below freezing.
</li>
</ul>
The July 31st boundary was chosen to be safe since the temperature in
July or August was never below 43.

The following plot is a [quantile-quantile
plot](https://en.wikipedia.org/wiki/Q%E2%80%93Q_plot) that shows how the
distribution is normal because it is roughly linear.

![](/assets/chicago-temp-2/unnamed-chunk-7-1.png)

The duration of a Chicago winter follows a distribution that is roughly
normal with a mean of 175 and a standard deviation of 19. A typical
winter starts around October 27 and ends around April 19.

The following table shows the duration of winter along with winter
boundaries for the past five years.

Most Recent five years
<div markdown="0">

<table class="table">
<thead>
<tr>
<th style="text-align:left;">
Winter
</th>
<th style="text-align:left;">
Start of Winter
</th>
<th style="text-align:left;">
End of Winter
</th>
<th style="text-align:right;">
Duration
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
2017/2018
</td>
<td style="text-align:left;">
2017-11-08
</td>
<td style="text-align:left;">
2018-04-18
</td>
<td style="text-align:right;">
161
</td>
</tr>
<tr>
<td style="text-align:left;">
2016/2017
</td>
<td style="text-align:left;">
2016-11-19
</td>
<td style="text-align:left;">
2017-03-23
</td>
<td style="text-align:right;">
123
</td>
</tr>
<tr>
<td style="text-align:left;">
2015/2016
</td>
<td style="text-align:left;">
2015-11-14
</td>
<td style="text-align:left;">
2016-04-09
</td>
<td style="text-align:right;">
147
</td>
</tr>
<tr>
<td style="text-align:left;">
2014/2015
</td>
<td style="text-align:left;">
2014-11-02
</td>
<td style="text-align:left;">
2015-04-04
</td>
<td style="text-align:right;">
153
</td>
</tr>
<tr>
<td style="text-align:left;">
2013/2014
</td>
<td style="text-align:left;">
2013-10-22
</td>
<td style="text-align:left;">
2014-04-16
</td>
<td style="text-align:right;">
176
</td>
</tr>
</tbody>
</table>

</div>

Last years's winter was an exceptionally short one. Other than that
winters have been shorter than average but still within one standard
deviation from the mean.

<div markdown="0">

<table class="table">
<thead>
<tr>
<th style="text-align:left;">
Winter
</th>
<th style="text-align:left;">
Start of Winter
</th>
<th style="text-align:left;">
End of Winter
</th>
<th style="text-align:right;">
Duration
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
1942/1943
</td>
<td style="text-align:left;">
1942-09-25
</td>
<td style="text-align:left;">
1943-05-01
</td>
<td style="text-align:right;">
218
</td>
</tr>
<tr>
<td style="text-align:left;">
1980/1981
</td>
<td style="text-align:left;">
1980-10-05
</td>
<td style="text-align:left;">
1981-05-12
</td>
<td style="text-align:right;">
218
</td>
</tr>
<tr>
<td style="text-align:left;">
1979/1980
</td>
<td style="text-align:left;">
1979-10-14
</td>
<td style="text-align:left;">
1980-05-15
</td>
<td style="text-align:right;">
214
</td>
</tr>
</tbody>
</table>

</div>

The above table shows some of the toughest winters in Chicago. Some
other ones might have been tougher overall becuase of snowfall and
average/min temperatures. In any case, 218 days of winter means over 7
months of cold. Luckily we haven't seen that for a while.
