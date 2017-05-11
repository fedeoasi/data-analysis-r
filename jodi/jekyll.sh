#!/usr/bin/env bash

BLOG_DIR=../blog
cp jodi-oil-data.md $BLOG_DIR/_posts/2017-05-07-jodi-oil-data.md
ASSETS_DIR=$BLOG_DIR/assets/
cp -R assets/* $ASSETS_DIR
