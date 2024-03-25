here::i_am("final_project/code/01_table_1.R")
pacman::p_load(tidyverse,rio,gtsummary)
diabetes <- import(here::here("final_project/data/diabetes.csv")) %>% janitor::clean_names()

diabetes2 <- diabetes %>% mutate(outcome=factor(outcome,levels=c(0,1),labels=c("No T2DM","T2DM")))

table_1 <- diabetes2 %>% select(bmi,diabetes_pedigree_function,outcome) %>% 
  tbl_summary(statistic=list(all_continuous() ~ "{mean} ({sd})"),
              by=outcome,
              label=list(bmi ~ "BMI",
                         diabetes_pedigree_function ~ "DPF")) %>% 
  add_overall() %>% 
  add_p(test=list(all_continuous() ~ "t.test",
                  all_categorical() ~ "fisher.test"))

saveRDS(table_1,
        file=here::here("final_project/output/table_1.rds"))