#!/usr/bin/env bash

BLOG_DIR=blog
cp jodi/jodi-oil-data.md $BLOG_DIR/_posts/2017-05-07-jodi-oil-data.md
cp cta/cta.md $BLOG_DIR/_posts/2017-05-21-cta.md
cp f1-quali/quali.md $BLOG_DIR/_posts/2017-06-18-f1-quali.md
cp f1-2017-vs-2016/quali.md $BLOG_DIR/_posts/2017-07-15-f1-2017-vs-2016.md
cp chicago-temp/temp.md $BLOG_DIR/_posts/2018-03-13-chicago-temp.md
cp electricity-sources/electricity.md $BLOG_DIR/_posts/2017-09-25-electricity.md
cp f1-2017-vs-2016-part-2/quali.md $BLOG_DIR/_posts/2018-04-07-f1-2017-vs-2016.md
cp f1-2018-quali/quali.md $BLOG_DIR/_posts/2018-07-04-f1-quali-clustering.md
cp chicago-temp-2/temp.md $BLOG_DIR/_posts/2019-04-28-chicago-temp-2.md
ASSETS_DIR=$BLOG_DIR/assets/
cp -R jodi/assets/* $ASSETS_DIR
cp -R cta/assets/* $ASSETS_DIR
cp -R f1-quali/assets/* $ASSETS_DIR
cp -R f1-2017-vs-2016/assets/* $ASSETS_DIR
cp -R chicago-temp/assets/* $ASSETS_DIR
cp -R electricity-sources/assets/* $ASSETS_DIR
cp -R f1-2017-vs-2016-part-2/assets/* $ASSETS_DIR
cp -R f1-2018-quali/assets/* $ASSETS_DIR
cp -R chicago-temp-2/assets/* $ASSETS_DIR
