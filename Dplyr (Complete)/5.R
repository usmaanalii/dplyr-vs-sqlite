# 5 - Creating the tables
persons_data <- income_data %>%
                select(SS_ID, AAGE, AHGA, ASEX, PRCITSHP,
                       PARENT, GRINST, GRINREG, AREORGN, AWKSTAT)
job_data <- income_data %>% select(SS_ID, ADTIND, ADTOCC, AMJOCC, AMJIND)
pay_data <- income_data %>% select(SS_ID, AHRSPAY, WKSWORK)

## Check
persons_data %>% head(2)
job_data %>% head(2)
pay_data %>% head(2)
