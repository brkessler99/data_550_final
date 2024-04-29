README
================

This repository contains the files needed to render
`final_project_report.html`. It contains a folder with four R script
files, a folder with the data set `diabetes.csv`, a folder with the code
output, the RMarkdown file `final_project_report.Rmd` and its associated
.html file, and a Makefile that contains GNU Make commands for rendering
the report and its components. Briefly, this analysis compares two
unconditional logistic regression models to assess the predictive power
of the diabetes pedigree function for type II diabetes mellitus
diagnosis using ROC curves and AUC.

# Instructions for generating the final report

You will need RStudio, bash, and GNU Make to render this report as
intended.

1.  Clone the data_550_final repository from GtiHub to a local
    directory.
2.  Navigate to the cloned repository. Set this as your working
    directory.  
3.  Synchronize your local project directory with the `renv.lock` file
    to ensure that you have the correct R packages and versions for this
    analysis. Do this by running the command `make install` in the
    RStudio terminal with a bash shell.
4.  Type the command `make` in the RStudio terminal with a bash shell to
    create the components of the report and compile
    `final_project_report.html` in your local final_project directory.
    Alternatively, open the Makefile to see what make commands are
    available generating individual components of the report.

NOTE: remove the rendered .html report and all files in the output
folder with the command `make clean`.

# Code directory

Code for creating the tables and figure are found in the `code` folder:

- 01_table_1.R: imports data, generates and saves **Table 1**
- 02_roc_plot.R: imports data, creates and saves two glm() objects,
  generates and saves **Figure 1**
- 03_auc_comparison.R: imports data, imports the two glm() objects,
  conducts the Delong ROC test, generates and saves **Table 2**
- 04_render.R: renders the html report **final_project_report.html**

# Docker Build

The Docker image called `final_project_image` is available as a public
DockerHub repository
[here](https://hub.docker.com/layers/brkessler99/final_project_image/latest/images/sha256:6f3afbc64f5f74041ea977f47c7bd534bbd65ee37e0abe3195be408da5c9a04b?uuid=01a662de-708f-475a-a7c3-565bf2baa81b%0A).
The image was built using the command
`docker build -t final_project_image .`. Pull the image by running the
command `docker pull brkessler99/final_project_image`.

# Docker Run

Run the containerized code by using the make command
`make report/final_project_report.html` in a bash terminal. This command
mounts a local directory called `report` to the container and retrieves
the rendered .html report.

NOTE: This target was designed for a Mac/Linux OS. Windows systems using
git bash may require an extra `/` at the start of a file path when
mounting the directory.
