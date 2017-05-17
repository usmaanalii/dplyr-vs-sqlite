# Data exploration
data <- read.csv("census-income.data.gz")

# Question 1

# Create SQLite database (Make sure RSQLite is installed)
db <- dbConnect(SQLite(), dbname = "census_income.sqlite")

# Create "Income" table
dbSendQuery(conn = db,
            "CREATE TABLE Income
            (AAGE INT,
             ACLSWKR TEXT,
             ADTIND TEXT,
             ADTOCC TEXT,
             AHGA TEXT,
             AHRSPAY NUM,
             AHSCOL TEXT,
             AMARITL TEXT,
             AMJIND TEXT,
             AMJOCC TEXT,
             ARACE TEXT,
             AREORGN TEXT,
             ASEX TEXT,
             AUNMEM TEXT,
             AUNTYPE TEXT,
             AWKSTAT TEXT,
             CAPGAIN NUM,
             CAPLOSS NUM,
             DIVVAL NUM,
             FILESTAT TEXT,
             GRINREG TEXT,
             GRINST TEXT,
             HDFMX TEXT,
             HHDREL TEXT,
             MARSUPWT NUM,
             MIGMTR1 TEXT,
             MIGMTR3 TEXT,
             MIGMTR4 TEXT,
             MIGSAME TEXT,
             MIGSUN TEXT,
             NOEMP NUM,
             PARENT TEXT,
             PEFNTVTY TEXT,
             PEMNTVTY TEXT,
             PENATVTY TEXT,
             PRCITSHP TEXT,
             SEOTR TEXT,
             VETQVA TEXT,
             VETYN TEXT,
             WKSWORK NUM,
             YEAR TEXT,
             TRGT TEXT)")

# Import data frame into database
dbWriteTable(conn = db, name = "Income", value = data,
             row.names = FALSE, append = TRUE)
