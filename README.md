README
================

# Instructions for generating the final report

This repository contains the files needed to render
`final_project_report.html`. You will need RStudio, bash, and GNU Make
to render this report as intended.

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

- 01_table_1.R: imports data, generates and saves **Table 1**
- 02_roc_plot.R: imports data, creates and saves two glm() objects,
  generates and saves **Figure 1**
- 03_auc_comparison.R: imports data, imports the two glm() objects,
  conducts the Delong ROC test, generates and saves **Table 2**
- 04_render.R: renders the html report **final_project_report.html**
