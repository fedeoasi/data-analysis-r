#!/usr/bin/env bash

aws s3 sync ../blog/_site s3://fedeoasi.com --profile fedeoasi --region us-east-1
