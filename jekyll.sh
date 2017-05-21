#!/usr/bin/env bash

BLOG_DIR=blog
cp jodi/jodi-oil-data.md $BLOG_DIR/_posts/2017-05-07-jodi-oil-data.md
cp cta/cta.md $BLOG_DIR/_posts/2017-05-21-cta.md
ASSETS_DIR=$BLOG_DIR/assets/
cp -R jodi/assets/* $ASSETS_DIR
cp -R cta/assets/* $ASSETS_DIR
