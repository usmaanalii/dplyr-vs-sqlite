# Question 4 - Average annual income
workers_data <- filter(income_data, AHRSPAY > 0)[ , c("ARACE",
                                                 "AHRSPAY", "WKSWORK")] %>%
  rename(Race = ARACE, Wage = AHRSPAY, Weeks_worked = WKSWORK) %>%
  arrange(desc(Race))

average_incomes <- workers_data %>%
                   group_by(Race) %>% summarise(Average_income =
                                            mean(Wage * Weeks_worked * 40)) %>%
                                                arrange(desc(Average_income))

# Answer is also in the environment list >>>>
average_incomes
