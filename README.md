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
3.  Type the command `make` in the RStudio terminal with a bash shell to
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

include a README.md file that describes the contents of your repository
the README should make clear how to generate the final report and a
brief description of the contents of the report
