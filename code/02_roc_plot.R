here::i_am("final_project/code/02_roc_plot.R")
pacman::p_load(tidyverse,rio,gtsummary,plotROC)
diabetes <- import(here::here("final_project/data/diabetes.csv")) %>% janitor::clean_names()

test_model1 <- glm(outcome ~ bmi, data=diabetes)
test_model2 <- glm(outcome ~ bmi + diabetes_pedigree_function, data=diabetes)

saveRDS(test_model1,
        here::here("final_project/output/test_model1.rds"))
saveRDS(test_model2,
        here::here("final_project/output/test_model2.rds"))

ggplot(diabetes) + 
  geom_roc(aes(d=outcome,m=test_model1$fitted.values,color="BMI"),labels=FALSE) + 
  geom_roc(aes(d=outcome,m=test_model2$fitted.values,color="BMI + DPF"),labels=FALSE) + 
  geom_abline(slope=1,intercept=0,linetype=2,color="gray") +
  theme_classic() +
  labs(x="1-Specificity",y="Sensitivity",color="Model")

ggsave(filename="roc_plot.png",
       path=here::here("final_project/output"))
