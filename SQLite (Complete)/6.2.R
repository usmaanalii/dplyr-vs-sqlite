# Question 6.2

# Create Table "Hispanics"
dbSendQuery(conn = db, "CREATE TABLE Hispanics
            (
            SS_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            AHGA TEXT,
            AHRSPAY NUM,
            AMJIND TEXT,
            AREORGN TEXT,
            WKSWORK NUM
            )"
            )

# Insert relevent data into "Hispanics"
dbGetQuery(db, "INSERT INTO Hispanics
           (
           AREORGN,
           AHGA,
           AMJIND,
           AHRSPAY,
           WKSWORK
           )

           SELECT

           Person.AREORGN AS Hispanic,
           Person.AHGA AS Education,
           Job.AMJIND AS Industry,
           Pay.AHRSPAY AS Wage,
           Pay.WKSWORK AS Weeks
           FROM
           Person
           INNER JOIN Job ON Job.SS_ID = Person.SS_ID
           INNER JOIN Pay ON Pay.SS_ID = Person.SS_ID
           WHERE
           (
           AHGA = ' Bachelors degree(BA AB BS)'
           OR
           AHGA = ' Masters degree(MA MS MEng MEd MSW MBA)'
           OR
           AHGA = ' Doctorate degree(PhD EdD)'
           )
           AND
           (
           AREORGN NOT IN (' All other', ' Do not know', ' NA')
           );
           ")

# List of industries
dbGetQuery(db, "SELECT DISTINCT AMJIND AS 'List of industries' FROM Hispanics")

# Average Wage
dbGetQuery(db, "SELECT AMJIND AS Industry, AVG(AHRSPAY)
                AS 'Average hourly wage' FROM Hispanics
                GROUP BY AMJIND ORDER BY AVG(AHRSPAY) DESC")

# Average Weeks
dbGetQuery(db, "SELECT AMJIND AS Industry, AVG(WKSWORK)
                AS 'Average weeks worked' FROM Hispanics
                GROUP BY AMJIND ORDER BY AVG(WKSWORK) DESC")
