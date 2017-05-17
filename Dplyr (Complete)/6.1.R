# Finding max wage and their SS_ID
max_wage <- pay_data %>% summarise(max(AHRSPAY)) %>% .$`max(AHRSPAY)`
max_wage_id <- pay_data %>%
                filter(AHRSPAY == max(AHRSPAY)) %>%
                       select(SS_ID, AHRSPAY) %>% .$`SS_ID`

# Number in each state with the highest earning job
high_job <- job_data %>% filter(SS_ID == max_wage_id) %>% .$`AMJOCC`

# List of all the SS_ID"s with AMJOCC = x
high_job_ids <- job_data %>% filter(AMJOCC == high_job) %>% .$`SS_ID`

numbers_each_state_job <- persons_data[high_job_ids, ] %>%
                          group_by(GRINST) %>% tally() %>%
                          arrange(desc(n)) %>% rename(State = GRINST, Total = n)

# Number in the state that they"re from
high_state <- persons_data %>% filter(SS_ID == max_wage_id) %>% .$`GRINST`

number_in_state <- persons_data %>% filter(GRINST == high_state) %>%
                   group_by(GRINST) %>% tally() %>%
                   rename(State = GRINST, Total = n)

# Number in the job type that they"re from
number_in_job <- job_data %>% filter(AMJOCC == high_job) %>%
                 tally() %>% rename("Total in job" = n)

# Number in the industry that they"re from
high_industry <- job_data %>% filter(SS_ID == max_wage_id) %>% .$`AMJIND`
number_in_industry <- job_data %>% filter(AMJIND == high_industry) %>%
                      tally() %>% rename("Total in industry" = n)

# Answer is also in the environment list >>>>
numbers_each_state_job
number_in_state
number_in_job
number_in_industry
