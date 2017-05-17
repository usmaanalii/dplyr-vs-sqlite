# Question 3

# Selecting the number of people by sex and race
dbGetQuery(db, 'SELECT ASEX AS White, COUNT(SS_ID) AS Total
                FROM Income WHERE ARACE = " White" GROUP BY ASEX')

dbGetQuery(db, 'SELECT ASEX AS Asian_PI, COUNT(SS_ID) AS Total
                FROM Income WHERE ARACE = " Asian or Pacific Islander"
                GROUP BY ASEX')

dbGetQuery(db, 'SELECT ASEX AS Ind_Esk, COUNT(SS_ID) AS Total
                FROM Income WHERE ARACE = " Amer Indian Aleut or Eskimo"
                GROUP BY ASEX')

dbGetQuery(db, 'SELECT ASEX AS Black, COUNT(SS_ID) AS Total
                FROM Income WHERE ARACE = " Black" GROUP BY ASEX')

dbGetQuery(db, 'SELECT ASEX AS Other, COUNT(SS_ID) AS Total
                FROM Income WHERE ARACE = " Other" GROUP BY ASEX')
