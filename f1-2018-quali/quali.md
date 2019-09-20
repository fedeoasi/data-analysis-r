---
layout: post
output:
  md_document:
    pandoc_args:
    - '-s'
    - '-t'
    - 'markdown-bracketed\_spans'
tags:
- formula one
- qualifying
title: 'Formula One 2018: Clustering Qualifying Results'
---

Introduction
------------

In this blog post we are going to use a clustering algorithm to group
Formula One (F1) teams based on their qualifying results in 2018. While
it is relatively easy to read qualifying results, it is not as simple to
get a clear picture of the relative performance between teams.
Clustering gives us a way to track the performance of teams over time
and analyze patterns.

Dataset
-------

The data used in this blog post was downloaded from the [Ergast
Developer API](http://ergast.com/mrd/). We are using the qualifying
results for the first nine races of the current (2018) season.

Methodology
-----------

The data used for the teams is the average of the best time for the two
teammates posted over the full qualifying session, regardless of whether
it was set in Q1, Q2, or Q3. When a driver did not set a time (e.g.,
Verstappen at Monaco) we just omit its record.

Teams will be divided into three groups. While the clustering algorithm
does not make any assumption other than separate the groups as much as
possible, we will name the clusters as follows: front-runners (<span
style="color: white;border-radius: 4px; padding: 4px; background-color:  #ba4daa ;text-align: c;">1</span>),
midfield (<span
style="color: white;border-radius: 4px; padding: 4px; background-color:  #f50701 ;text-align: c;">2</span>),
back of the pack (<span
style="color: white;border-radius: 4px; padding: 4px; background-color:  #fd0 ;text-align: c;">3</span>).

The algorithm used is
[K-means](https://en.wikipedia.org/wiki/K-means_clustering) with a
cluster size of three. K-means creates a specified number of clusters
minimizing the within cluster variance. The resulting cluster averages
(also known as centroids) are representative lap times for every goup.
These are not times that exist in the dataset but they represent a
compromise between lap times within the same group.

2018 Australian Grand Prix
--------------------------

In this section we are going to look at the Australian Grand Prix in
detail and then apply the same methodology to the other qualifying
sessions in the 2018 season.

The table below shows for every F1 team:

-   Best Time: average of the best lap times posted by the two drivers
-   Cluster: cluster the team belongs to
-   Cluster Time: within-cluster average
-   Gap to Cluster: gap between the best lap time and the cluster time
    (a negative gap means faster than the cluster time)

<div markdown="0">

<table class="table">
<thead>
<tr>
<th style="text-align:left;">
Team
</th>
<th style="text-align:left;">
Best Time
</th>
<th style="text-align:left;">
Cluster
</th>
<th style="text-align:left;">
Cluster Time
</th>
<th style="text-align:right;">
Gap To Cluster
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Mercedes
</td>
<td style="text-align:left;">
1:21.626
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
1:21.825
</td>
<td style="text-align:right;">
-0.199
</td>
</tr>
<tr>
<td style="text-align:left;">
Ferrari
</td>
<td style="text-align:left;">
1:21.832
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
1:21.825
</td>
<td style="text-align:right;">
0.008
</td>
</tr>
<tr>
<td style="text-align:left;">
Red Bull
</td>
<td style="text-align:left;">
1:22.015
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
1:21.825
</td>
<td style="text-align:right;">
0.191
</td>
</tr>
<tr>
<td style="text-align:left;">
Haas F1 Team
</td>
<td style="text-align:left;">
1:23.263
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
1:23.428
</td>
<td style="text-align:right;">
-0.165
</td>
</tr>
<tr>
<td style="text-align:left;">
Renault
</td>
<td style="text-align:left;">
1:23.296
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
1:23.428
</td>
<td style="text-align:right;">
-0.132
</td>
</tr>
<tr>
<td style="text-align:left;">
McLaren
</td>
<td style="text-align:left;">
1:23.724
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
1:23.428
</td>
<td style="text-align:right;">
0.297
</td>
</tr>
<tr>
<td style="text-align:left;">
Force India
</td>
<td style="text-align:left;">
1:24.253
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
1:24.584
</td>
<td style="text-align:right;">
-0.331
</td>
</tr>
<tr>
<td style="text-align:left;">
Williams
</td>
<td style="text-align:left;">
1:24.575
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
1:24.584
</td>
<td style="text-align:right;">
-0.009
</td>
</tr>
<tr>
<td style="text-align:left;">
Sauber
</td>
<td style="text-align:left;">
1:24.596
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
1:24.584
</td>
<td style="text-align:right;">
0.011
</td>
</tr>
<tr>
<td style="text-align:left;">
Toro Rosso
</td>
<td style="text-align:left;">
1:24.913
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
1:24.584
</td>
<td style="text-align:right;">
0.329
</td>
</tr>
</tbody>
</table>

</div>

In Australia, the front-runners were Mercedes, Ferrari, and Red Bull.
Three teams (Haas, Renault, and McLaren) represented the mid-field and
then the remaining four teams (Force India, Williams, McLaren, and Toro
Rosso) were clustered together to form the back of the pack.

The cluster times are separated by at least one second and the gaps to
the cluster centers are always within four tenths. This is exactly what
we want to see which means that the clustering algorithm did a decent
job.

Overall Results
---------------

The following table shows the cluster groupings for all races in the
2018 season so far and the sum of the clusters per team. A lower number
means a better overall cluster placement, where the best possible result
is to be always part of the frontrunners.

### Clusters

<div markdown="0">

<table class="table">
<thead>
<tr>
<th style="text-align:left;">
Team
</th>
<th style="text-align:left;">
AUS
</th>
<th style="text-align:left;">
BAH
</th>
<th style="text-align:left;">
CHI
</th>
<th style="text-align:left;">
AZE
</th>
<th style="text-align:left;">
SPA
</th>
<th style="text-align:left;">
MON
</th>
<th style="text-align:left;">
CAN
</th>
<th style="text-align:left;">
FRA
</th>
<th style="text-align:left;">
AUT
</th>
<th style="text-align:right;">
Total
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Mercedes
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:right;">
9
</td>
</tr>
<tr>
<td style="text-align:left;">
Ferrari
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:right;">
9
</td>
</tr>
<tr>
<td style="text-align:left;">
Red Bull
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:right;">
10
</td>
</tr>
<tr>
<td style="text-align:left;">
Haas F1 Team
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:right;">
19
</td>
</tr>
<tr>
<td style="text-align:left;">
Renault
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:right;">
19
</td>
</tr>
<tr>
<td style="text-align:left;">
Force India
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #ba4daa ;">

1

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:right;">
19
</td>
</tr>
<tr>
<td style="text-align:left;">
McLaren
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:right;">
20
</td>
</tr>
<tr>
<td style="text-align:left;">
Toro Rosso
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:right;">
24
</td>
</tr>
<tr>
<td style="text-align:left;">
Sauber
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:right;">
25
</td>
</tr>
<tr>
<td style="text-align:left;">
Williams
</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #f50701 ;">

2

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:left;">
<div
style="height: 100%; width: 100%; max-width: 50px; text-align: center; font-weight: bold; color: white;border-radius: 6px; padding: 2px 4px; background-color:  #fd0 ;">

3

</div>

</td>
<td style="text-align:right;">
26
</td>
</tr>
</tbody>
</table>

</div>

### Front Runners

-   Mercedes and Ferrari were able to achieve the perfect score (always
    front runners).
-   Red Bull closely matched the first two except for the Austrian GP
    where it was clustered as mid-field.
-   In the Austrian GP, a not so great day for Red Bull and an
    incredible performance for Haas caused the two teams to be clustered
    together as mid-field while the remaining six teams were labeled
    back of the pack.
-   Force India was the only other team to join the front runners, which
    happenened in Baku. On that occasion Sergio Perez managed to get a
    third place and the only podium of a non Mercedes, Ferrari, or Red
    Bull driver.

### Midfield and Back of the Pack

-   Renault and Haas were in the mid-field in all occasions except for
    one, while all other teams (excluding the top three) were in the
    back runner group at least twice.
-   Toro Rosso's performance in Baku gave it its own back of the pack
    cluster allowing Sauber and Williams to join the midfield for the
    first time in the season. Sauber also joined the midfield in France
    where Charles Leclerc qualified eigth.
-   McLaren joined the back of the pack in the French GP, which was
    definitely their worst performance of the year.

### Overall Results

Looking at the overall results by clustering the totals in the clusters
table, these are the three clusters:

-   Front-runners: Mercedes, Ferrari, and Red Bull
-   Midfield: Haas, Renault, Force India, and McLaren
-   Back of the pack: Toro Rosso, Sauber, and Williams

### Gaps

The following table shows in detail the gaps to the cluster time and the
lap times for all teams and races.

<div markdown="0">

<table class="table">
<thead>
<tr>
<th style="text-align:left;">
Team
</th>
<th style="text-align:left;">
AUS
</th>
<th style="text-align:left;">
BAH
</th>
<th style="text-align:left;">
CHI
</th>
<th style="text-align:left;">
AZE
</th>
<th style="text-align:left;">
SPA
</th>
<th style="text-align:left;">
MON
</th>
<th style="text-align:left;">
CAN
</th>
<th style="text-align:left;">
FRA
</th>
<th style="text-align:left;">
AUT
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Mercedes
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.199 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:21.626 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.191 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:28.171 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.097 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:31.650 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.303 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:41.757 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.297 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:16.192 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.237 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:11.336 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.034 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:10.926 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.403 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:30.087 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.211 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:03.139 </span>
</td>
</tr>
<tr>
<td style="text-align:left;">
Ferrari
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.008 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:21.832 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.333 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:28.029 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.415 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:31.138 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.066 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:41.993 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.031 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:16.458 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.053 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:11.152 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.031 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:10.929 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.095 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:30.586 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.211 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:03.561 </span>
</td>
</tr>
<tr>
<td style="text-align:left;">
Red Bull
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.191 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:22.015 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.523 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:28.885 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.319 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:31.871 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.107 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:41.952 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.328 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:16.817 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.29 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:10.810 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.066 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:11.026 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.309 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:30.799 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.027 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:03.918 </span>
</td>
</tr>
<tr>
<td style="text-align:left;">
Haas F1 Team
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.165 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:23.263 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.041 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:29.944 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.167 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:32.754 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.229 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:43.674 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.585 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:17.658 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.142 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:13.060 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.1 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:12.605 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.572 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:31.490 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.027 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:03.971 </span>
</td>
</tr>
<tr>
<td style="text-align:left;">
Renault
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.132 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:23.296 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.409 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:29.494 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.265 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:32.656 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.694 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:43.208 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.113 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:18.356 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.053 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:12.270 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.499 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:12.006 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.003 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:32.065 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.454 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:04.618 </span>
</td>
</tr>
<tr>
<td style="text-align:left;">
McLaren
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.297 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:23.724 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.442 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:30.345 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.447 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:33.368 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.347 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:44.249 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.222 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:18.021 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.057 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:12.275 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.355 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:12.860 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.094 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:33.069 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.046 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:05.117 </span>
</td>
</tr>
<tr>
<td style="text-align:left;">
Force India
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.331 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:24.253 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.112 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:30.015 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.014 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:32.907 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.475 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #ba4daa ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:42.534 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.474 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:18.717 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.11 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:12.107 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.266 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:12.239 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.202 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:32.264 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.01 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:05.061 </span>
</td>
</tr>
<tr>
<td style="text-align:left;">
Williams
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.009 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:24.575 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.109 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:31.458 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.095 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:34.173 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.167 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:43.735 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.442 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:19.959 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.004 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:12.921 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.005 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:13.616 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.52 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:33.682 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.221 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:05.293 </span>
</td>
</tr>
<tr>
<td style="text-align:left;">
Sauber
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.011 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:24.596 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.108 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:31.241 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.415 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:34.683 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.744 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:44.646 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.441 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:19.076 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.071 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:12.989 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.005 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:13.627 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.367 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:32.429 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.151 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:05.222 </span>
</td>
</tr>
<tr>
<td style="text-align:left;">
Toro Rosso
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.329 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:24.913 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.186 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:29.716 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.32 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:33.948 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:50.924 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.219 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:18.462 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.218 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:12.700 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.311 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #f50701 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:12.817 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
-0.427 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:32.736 </span>
</td>
<td style="text-align:left;">
<span
style="display: block; color: black; padding: 2px 4px; text-align: c;">
0.048 </span> <span
style="height: 100%; width: 100%; text-align: center; color: white; background:  #fd0 ; border-radius: 6px; padding: 2px 4px; font-weight: bold;">
1:05.120 </span>
</td>
</tr>
</tbody>
</table>

</div>

Conclusion
----------

The use of clustering over qualifying results helps creating a
simplified view of the results. By grouping teams we don't have to
remember the exact lap times or gaps and we can instead concentrate on
the clusters.

As far as findings it was not surprising to find the top three teams in
their own cluster, but it was interesting to find out for example that
Force India in Azerbaijan had the most remarkable qualifying of the non
top three teams or that Williams had their only midfield result in
Azerbaijan.

Using three clusters might have been a bit limiting. There are races
such as the Austrian GP where there is a 2-2-6 split, which means the
back of the pack is very crowded. A cluster size of four would probably
be a better fit but a size of three allowed very simple naming and
explanations.

Did the cluster information help understanding the overall relative
standing of teams? Were any patterns missed in the analysis of the
Clusters or Gaps tables? Feel free to leave feedback in the comments
section below.
