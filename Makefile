final_project_report.html: code/04_render.R output/table_1.rds output/roc_plot.png output/auc_comparison_table.rds
	Rscript code/04_render.R

output/table_1.rds: code/01_table_1.R data/diabetes.csv
	Rscript code/01_table_1.R

output/test_model1.rds: code/02_roc_plot.R data/diabetes.csv
	Rscript code/02_roc_plot.R
	
output/test_model2.rds: code/02_roc_plot.R data/diabetes.csv
	Rscript code/02_roc_plot.R
	
output/roc_plot.png: code/02_roc_plot.R data/diabetes.csv
	Rscript code/02_roc_plot.R
	
.PHONY: roc_plot
roc_plot: output/test_model1.rds output/test_model2.rds output/roc_plot.png

output/auc_comparison_table.rds: code/03_auc_comparison.R data/diabetes.csv output/test_model1.rds output/test_model2.rds
	Rscript code/03_auc_comparison.R

.PHONY: clean	
clean:
	rm output/*
	rm final_project_report.html
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt=FALSE)"

report/final_project_report.html: 
	docker run -v /$(pwd):/project/report final_project_image
