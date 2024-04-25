FROM rocker/r-ubuntu as base

RUN apt-get update && apt-get install -y pandoc && apt-get install -y \
  libcurl4-openssl-dev \
  libxml2-dev \
  libssl-dev \
  libfontconfig1-dev \
  libharfbuzz-dev \
  libfribidi-dev \
  libfreetype6-dev \
  libpng-dev \
  libtiff5-dev \
  libjpeg-dev

RUN mkdir /final_project
WORKDIR /final_project

RUN mkdir code
RUN mkdir data
RUN mkdir output
COPY code code
COPY data data
COPY Makefile .
COPY final_project_report.Rmd .

COPY .Rprofile .
COPY renv.lock .
RUN mkdir -p renv
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN Rscript -e "renv::restore(prompt=FALSE)"

RUN mkdir report
CMD make && mv final_project_report.html report