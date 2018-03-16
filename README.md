# data-analysis-r

A repo containing the source code for blog deployed at http://www.fedeoasi.com

The blog framework used is [jekyll](https://jekyllrb.com/) and the posts are written in
[Rmd](https://rmarkdown.rstudio.com/).

## Repository Structure

- Every blog posts lives in its own folder (e.g., cta)
- The `blog` folder contains the jekyll files needed to generate the site
- The `jekyll.sh` script copies the generated md files to the `blog/_posts` folder so that they
  get picked up by the blogging framework

## Structure of a Blog Post

A blog post is a folder that usually contains:
- A .Rmd file containing markdown interleaved with R code that may or may not be shown in the post
- A .md file that is generated from the .Rmd
- A `download_datasets.sh` script to download the data needed for the post (if the download can be automated)
- A `knit.sh` script that calls R to generate the md file and invokes the ../jekyll.sh file

