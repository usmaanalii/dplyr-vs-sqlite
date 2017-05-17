# # Create Table "Hispanics" with all of the relevent data from the three tables
hispanics_grads_data <- data.frame(persons_data %>% select(AREORGN, AHGA),
                                   job_data %>% select(AMJIND), pay_data %>%
                                   select(AHRSPAY, WKSWORK)) %>%
                                   filter(AREORGN != " All other",
                                   AREORGN != " Do not know",
                                   AREORGN != " NA",
                                   AHGA %in% c(" Bachelors degree(BA AB BS)",
                                   " Masters degree(MA MS MEng MEd MSW MBA)",
                                   " Doctorate degree(PhD EdD)")) %>%
                                   rename(Hispanic = AREORGN, Education = AHGA,
                                          Industries = AMJIND, Wage = AHRSPAY,
                                          Weeks = WKSWORK)

# List of industries
hispanic_grads_industries <- hispanics_grads_data %>% distinct(Industries)

# Average wage
hispanic_grad_average_wages <- hispanics_grads_data %>%
                               group_by(Industries) %>%
                               summarise(avg_wage = mean(Wage)) %>%
                               arrange(desc(avg_wage)) %>%
                               rename("Average wage" = avg_wage,
                                      "Industries of Hispanics" = Industries)

# Average weeks
hispanic_grads_average_weeks <- hispanics_grads_data %>%
                                group_by(Industries) %>%
                                summarise(avg_weeks = mean(Weeks)) %>%
                                arrange(desc(avg_weeks)) %>%
                                rename("Average weeks worked" = avg_weeks,
                                "Industries of Hispanics" = Industries)

# Answer is also in the environment list >>>>
hispanics_grads_data %>% head(2)
hispanic_grads_industries
hispanic_grad_average_wages
hispanic_grads_average_weeks
