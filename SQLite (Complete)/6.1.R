# Question 6.1

# Finding the highest hourly wage
dbGetQuery(db, "SELECT MAX(AHRSPAY) AS Highest_wage FROM Pay")

# The number in each state with the highest earning job
dbGetQuery(db, "SELECT Person.GRINST AS State, COUNT(*) AS Total
                FROM Person
                INNER JOIN Job ON Job.SS_ID = Person.SS_ID
                WHERE AMJOCC = ' Professional specialty'
                GROUP BY GRINST ORDER BY COUNT(*) DESC")

# Extracting all of the data for the highest earner
dbGetQuery(db, "SELECT

           Pay.AHRSPAY,
           Person.GRINST,
           Job.AMJOCC,
           Job.AMJIND
           FROM
           Person
           INNER JOIN Job ON Job.SS_ID = Person.SS_ID
           INNER JOIN Pay ON Pay.SS_ID = Person.SS_ID
           WHERE

           AHRSPAY = 9999;
           ")

# The number in the state where the highest earner is from
dbGetQuery(db, "SELECT GRINST AS State, COUNT(*) AS Total
                FROM Person WHERE GRINST = ' Not in universe'")

# The number in the job type the highest earner has
dbGetQuery(db, "SELECT AMJIND AS Job, COUNT(*) AS Total
                FROM Job WHERE AMJIND = ' Other professional services'")

# The number in the major industry the highest earner is in
dbGetQuery(db, "SELECT AMJOCC AS Industry, COUNT(*) AS Total FROM
                Job WHERE AMJOCC = ' Professional specialty'")
