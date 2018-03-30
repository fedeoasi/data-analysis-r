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
- transportation
title: 'CTA "L" Ridership Figures Analyzed'
---

Introduction
------------

The [Chicago Transit Authority](http://www.transitchicago.com/) (CTA)
provides open data about its public transportation system through its
[data portal](http://www.transitchicago.com/data/).

In this article we are going to look at the [ridership
data](https://data.cityofchicago.org/Transportation/CTA-Ridership-L-Station-Entries-Daily-Totals/5neh-572f)
for the CTA train system, also known as the [Chicago
"L"](https://en.wikipedia.org/wiki/Chicago_%22L%22).

Dataset
-------

The variables we are going to use are:
<ul>
<li>
Station: a CTA train station
</li>
<li>
Date
</li>
<li>
Day Type: Weekday, Saturday, or Sunday/Holiday
</li>
<li>
Rides: ride count for a station on a day
</li>
<li>
Line: lines serviced at a station (a station might service multiple
lines)
</li>
</ul>
As a preprocessing step, data for the current year (2017) was removed
because we are comparing full years with the exception of 2016 that
contains data to the end of November.

Ridership by Year
-----------------

The CTA has seen an increase in train ridership in the past few years.
Last year (2016) seems lower but we only have data up to November 2016,
so there is still room to get a new all time high.

In the last 10 years, ridership has increased by an impressive 26.69%,
which was calculated as the difference between the 2015 and 2006 three
year averages.

![](/assets/cta/ridership-by-year-graph-1.png)

Busiest Days
------------

In this section we are going look at the busiest days on the CTA. The
numbers are aggregated over all the CTA stations in a given day.

<div markdown="0">

<table class="table">
<caption>
Top 10 Days
</caption>
<thead>
<tr>
<th style="text-align:left;">
Date
</th>
<th style="text-align:left;">
Rides
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
11/04/2016
</td>
<td style="text-align:left;">
943,161
</td>
</tr>
<tr>
<td style="text-align:left;">
10/28/2016
</td>
<td style="text-align:left;">
758,658
</td>
</tr>
<tr>
<td style="text-align:left;">
07/03/2008
</td>
<td style="text-align:left;">
752,277
</td>
</tr>
<tr>
<td style="text-align:left;">
08/05/2011
</td>
<td style="text-align:left;">
750,364
</td>
</tr>
<tr>
<td style="text-align:left;">
06/18/2015
</td>
<td style="text-align:left;">
749,214
</td>
</tr>
<tr>
<td style="text-align:left;">
11/03/2016
</td>
<td style="text-align:left;">
733,259
</td>
</tr>
<tr>
<td style="text-align:left;">
10/21/2015
</td>
<td style="text-align:left;">
728,479
</td>
</tr>
<tr>
<td style="text-align:left;">
10/07/2016
</td>
<td style="text-align:left;">
724,867
</td>
</tr>
<tr>
<td style="text-align:left;">
10/20/2015
</td>
<td style="text-align:left;">
723,197
</td>
</tr>
<tr>
<td style="text-align:left;">
10/13/2015
</td>
<td style="text-align:left;">
721,509
</td>
</tr>
</tbody>
</table>

</div>

The busiest day ever is very recent (November 4th, 2016). It is the day
of the
[parade](https://en.wikipedia.org/wiki/Chicago_Cubs#2016:_World_Series_Champions)
for the [Chicago Cubs](https://en.wikipedia.org/wiki/Chicago_Cubs) World
Series win, the first since 1908.

The parade is an astonishing record considering that the rest of the top
10 was closely ranging between 721k and 759k. November 4th, 2016 added
about 200k (almost 30%) rides on top of that.

Other dates in the top 10 are game days for the Cubs: October 28th, 2016
(2nd busiest day) and October 7th, 2016 (8th busiest day).

The top three is completed by July 3rd, 2008, the day when Chicago used
to host its biggest fireworks show. Since 2010 that was discontinued and
the main attraction became the Navy Pier fireworks on the July 4th.

Busiest Station Days
--------------------

This section is about finding out the top number of rides in a single
station on a given day.

<div markdown="0">

<table class="table">
<caption>
Top 10 Daily Rides
</caption>
<thead>
<tr>
<th style="text-align:left;">
Date
</th>
<th style="text-align:left;">
Station
</th>
<th style="text-align:left;">
Lines
</th>
<th style="text-align:left;">
Rides
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
06/28/2015
</td>
<td style="text-align:left;">
Belmont-North Main
</td>
<td style="text-align:left;">
Red
</td>
<td style="text-align:left;">
36,323
</td>
</tr>
<tr>
<td style="text-align:left;">
06/24/2012
</td>
<td style="text-align:left;">
Belmont-North Main
</td>
<td style="text-align:left;">
Red
</td>
<td style="text-align:left;">
36,017
</td>
</tr>
<tr>
<td style="text-align:left;">
11/04/2016
</td>
<td style="text-align:left;">
Lake/State
</td>
<td style="text-align:left;">
Red
</td>
<td style="text-align:left;">
35,845
</td>
</tr>
<tr>
<td style="text-align:left;">
06/26/2011
</td>
<td style="text-align:left;">
Belmont-North Main
</td>
<td style="text-align:left;">
Red
</td>
<td style="text-align:left;">
33,795
</td>
</tr>
<tr>
<td style="text-align:left;">
10/29/2016
</td>
<td style="text-align:left;">
Addison-North Main
</td>
<td style="text-align:left;">
Red
</td>
<td style="text-align:left;">
33,615
</td>
</tr>
<tr>
<td style="text-align:left;">
06/30/2013
</td>
<td style="text-align:left;">
Belmont-North Main
</td>
<td style="text-align:left;">
Red
</td>
<td style="text-align:left;">
30,457
</td>
</tr>
<tr>
<td style="text-align:left;">
11/04/2016
</td>
<td style="text-align:left;">
Clark/Lake
</td>
<td style="text-align:left;">
Green Pink Orange
</td>
<td style="text-align:left;">
30,295
</td>
</tr>
<tr>
<td style="text-align:left;">
06/28/2009
</td>
<td style="text-align:left;">
Belmont-North Main
</td>
<td style="text-align:left;">
Red
</td>
<td style="text-align:left;">
29,457
</td>
</tr>
<tr>
<td style="text-align:left;">
06/27/2010
</td>
<td style="text-align:left;">
Belmont-North Main
</td>
<td style="text-align:left;">
Red
</td>
<td style="text-align:left;">
29,050
</td>
</tr>
<tr>
<td style="text-align:left;">
09/11/2015
</td>
<td style="text-align:left;">
Lake/State
</td>
<td style="text-align:left;">
Red
</td>
<td style="text-align:left;">
28,460
</td>
</tr>
</tbody>
</table>

</div>

Six of the top ten (including the top two) are at the Belmont stop of
the Red line sometime in the last week of June. That is when the
[Chicago Pride
Parade](https://en.wikipedia.org/wiki/Chicago_Pride_Parade) happens in
Lakeview. Interestingly, this event dominates the single station day all
time high but does not appear in the busiest days.

Once again we can see the Chicago Cubs parade (11/04/2016) appearing at
the stations Lake/State and Clark/Lake, two downtown stations.

Busiest Stations
----------------

This is about finding out which stations have served the most all time
rides.

<div>

<table class="table">
<caption>
Top 10 Stations
</caption>
<thead>
<tr>
<th style="text-align:left;">
Station
</th>
<th style="text-align:left;">
Lines
</th>
<th style="text-align:left;">
Rides
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Clark/Lake
</td>
<td style="text-align:left;">
Green Pink Orange
</td>
<td style="text-align:left;">
79,426,161
</td>
</tr>
<tr>
<td style="text-align:left;">
Lake/State
</td>
<td style="text-align:left;">
Red
</td>
<td style="text-align:left;">
77,337,160
</td>
</tr>
<tr>
<td style="text-align:left;">
Chicago/State
</td>
<td style="text-align:left;">
Red
</td>
<td style="text-align:left;">
75,249,013
</td>
</tr>
<tr>
<td style="text-align:left;">
95th/Dan Ryan
</td>
<td style="text-align:left;">
Red
</td>
<td style="text-align:left;">
62,853,565
</td>
</tr>
<tr>
<td style="text-align:left;">
Belmont-North Main
</td>
<td style="text-align:left;">
Red
</td>
<td style="text-align:left;">
60,689,408
</td>
</tr>
<tr>
<td style="text-align:left;">
Fullerton
</td>
<td style="text-align:left;">
Red
</td>
<td style="text-align:left;">
59,679,916
</td>
</tr>
<tr>
<td style="text-align:left;">
Grand/State
</td>
<td style="text-align:left;">
Red
</td>
<td style="text-align:left;">
54,734,384
</td>
</tr>
<tr>
<td style="text-align:left;">
Jackson/State
</td>
<td style="text-align:left;">
Red
</td>
<td style="text-align:left;">
52,284,407
</td>
</tr>
<tr>
<td style="text-align:left;">
O'Hare Airport
</td>
<td style="text-align:left;">
Blue
</td>
<td style="text-align:left;">
52,146,279
</td>
</tr>
<tr>
<td style="text-align:left;">
Roosevelt
</td>
<td style="text-align:left;">
Green Orange
</td>
<td style="text-align:left;">
48,527,193
</td>
</tr>
</tbody>
</table>

</div>

The top 2 (Clark/Lake and Lake/State) are downtown stations with a lot
of transfer options.

Seven out of the top 10 stations are on the Red line.

O'Hare is the only station for the blue line and is 9th.

Day Types
---------

The CTA dataset also provides a day type field to distinguish between
weekdays, Saturdays, and Sundays or holidays. The number of rides for
the weekdays was divided by 5 because there are approximately five times
as many weekdays as there are Saturdays or Sundays/Holidays.

![](/assets/cta/unnamed-chunk-5-1.png)

The graph shows that weekdays have more rides than Saturdays and Sundays
almost by a factor of two.
