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

RUN mkdir /project
WORKDIR /project

RUN mkdir code
RUN mkdir data
RUN mkdir output
COPY code .
COPY Makefile .
COPY final_project_report.Rmd .

COPY .Rprofile .
COPY renv.lock .
RUN mkdir -p renv
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN Rscript -e "renv::restore(prompt=FALSE)"

RUN mkdir report
CMD make && mv final_project_report.Rmd report

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######

FROM rocker/r-ubuntu

WORKDIR /project
COPY --from=base /project .

COPY code code
COPY data data

COPY renv/activate.R renv
COPY renv/settings.json renv

CMD make && mv final_project_report.html report