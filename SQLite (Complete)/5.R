# Question 5

# Creating the "Person" table
dbSendQuery(db, "CREATE TABLE Person
                (
            SS_ID INTEGER PRIMARY KEY AUTOINCREMENT,
            AAGE NUM,
            AHGA TEXT,
            ASEX TEXT,
            PRCITSHP TEXT,
            PARENT TEXT,
            GRINST TEXT,
            GRINREG TEXT,
            AREORGN TEXT,
            AWKSTAT TEXT)"
            )

dbGetQuery(db, "INSERT INTO Person
           (
           AAGE,
           AHGA,
           ASEX ,
           PRCITSHP,
           PARENT,
           GRINST,
           GRINREG,
           AREORGN,
           AWKSTAT
           )

           SELECT
           AAGE,
           AHGA,
           ASEX ,
           PRCITSHP,
           PARENT,
           GRINST,
           GRINREG,
           AREORGN,
           AWKSTAT

           FROM Income;"

        )

# Creating the "Job" table
dbSendQuery(db, "CREATE TABLE Job
            (
                SS_ID INTEGER PRIMARY KEY AUTOINCREMENT,
                ADTIND TEXT,
                ADTOCC TEXT,
                AMJOCC TEXT,
                AMJIND TEXT
            )"
            )

dbGetQuery(db, "INSERT INTO Job
            (
                ADTIND,
                ADTOCC,
                AMJOCC,
                AMJIND
            )

                SELECT

                ADTIND,
                ADTOCC,
                AMJOCC,
                AMJIND

            FROM Income;"
            )

# Creating the "Pay" table
dbSendQuery(db, "CREATE TABLE Pay
            (
                SS_ID INTEGER PRIMARY KEY AUTOINCREMENT,
                AHRSPAY NUM,
                WKSWORK NUM
            )"
)

dbGetQuery(db, "INSERT INTO Pay
            (
                AHRSPAY,
                WKSWORK
            )

                SELECT

                AHRSPAY,
                WKSWORK

            FROM Income;"
            w)
