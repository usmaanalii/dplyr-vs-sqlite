# Question 2 - Add SS_ID
nrow(income_data) # Find how many rows
income_data <- mutate(income_data, SS_ID = c(1:nrow(income_data)))

# Change column names
income_data <- income_data %>% rename(
    AAGE = X73, ADTIND = X0, ADTOCC = X0.1, AHGA = High.school.graduate,
    AHRSPAY = X0.2, AMJIND = Not.in.universe.or.children,
    AMJOCC = Not.in.universe.2, AREORGN = All.other, ASEX = Female,
    AWKSTAT = Not.in.labor.force, GRINREG = Not.in.universe.5,
    GRINST = Not.in.universe.6, PARENT = Not.in.universe.7,
    PRCITSHP = Native..Born.in.the.United.States, WKSWORK = X0.8, ARACE = White)

