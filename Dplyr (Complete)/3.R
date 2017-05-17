# Question 3 - Male and Female numbers
sex_race_numbers <- income_data %>%
                    group_by(ARACE, ASEX) %>% tally() %>% arrange(desc(ARACE))
sex_race_numbers <- rename(sex_race_numbers,
                           Race = ARACE, Sex = ASEX, Total = n)

# Answer is also in the environment list >>>>
sex_race_numbers
