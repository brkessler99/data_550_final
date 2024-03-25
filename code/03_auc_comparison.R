here::i_am("final_project/code/03_auc_comparison.R")
pacman::p_load(rio,tidyverse,pROC)
diabetes <- import(here::here("final_project/data/diabetes.csv")) %>% janitor::clean_names()

test_model1 <- readRDS(here::here("final_project/output/test_model1.rds"))
test_model2 <- readRDS(here::here("final_project/output/test_model2.rds"))

roc1 <- roc(diabetes$outcome, test_model1$fitted.values)
roc2 <- roc(diabetes$outcome, test_model2$fitted.values)

roc1_auc <- as.numeric(roc1$auc)
roc2_auc <- as.numeric(roc2$auc)

roc_test <- roc.test(roc1,roc2,method="delong")

roc_test_stat <- as.numeric(roc_test$statistic)
roc_test_p <- as.numeric(roc_test$p.value)

table_data <- data.frame(roc1_auc,roc2_auc,roc_test_stat,roc_test_p)

auc_comparison_table <- knitr::kable(table_data,
             digits=2,
             col.names=c("BMI","BMI+DPF","z","p"))

saveRDS(auc_comparison_table,
        file=here::here("final_project/output/auc_comparison_table.rds"))
