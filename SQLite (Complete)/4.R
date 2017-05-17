# Question 4

# Create table called "Workers" with the relevent data
dbSendQuery(db, "CREATE TABLE Workers
                 (
                  SS_ID INTEGER PRIMARY KEY AUTOINCREMENT,
                  AHRSPAY NUM,
                  WKSWORK NUM,
                  ARACE TEXT)"
                 )

# Select all rows with a non-zero wage
dbGetQuery(db, "INSERT INTO Workers
                (
                  AHRSPAY,
                  WKSWORK,
                  ARACE
                )
                SELECT
                  AHRSPAY,
                  WKSWORK,
                  ARACE

                FROM Income

                WHERE AHRSPAY > 0;"
          )

# Calculate average annual income for each race
dbGetQuery(db, "SELECT ARACE AS Ethnicity, AVG( (AHRSPAY*40)*WKSWORK)
                AS Average_Income FROM Workers
                GROUP BY ARACE ORDER BY AVG( (AHRSPAY*40)*WKSWORK ) DESC")
