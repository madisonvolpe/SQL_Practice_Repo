library(rstudioapi)
library(RPostgreSQL)
library(lubridate)
library(DBI)

## create tables 

## emp table 
emp <- data.frame(EMPNO = c(7369,7499,7521,7566,7654,7698,7782,7788,7839,
                            7844,7876,7900,7902,7934), 
                  ENAME = c("SMITH","ALLEN", "WARD", "JONES", "MARTIN", "BLAKE", "CLARK",
                            "SCOTT", "KING", "TURNER", "ADAMS", "JAMES", "FORD", "MILLER"),
                  JOB = c("CLERK", "SALESMAN", "SALESMAN", "MANAGER", "SALESMAN", "MANAGER",
                          "MANAGER", "ANALYST", "PRESIDENT", "SALESMAN", "CLERK", "CLERK",
                          "ANALYST", "CLERK"),
                  MGR = c(7902, 7698, 7698,7839,7698,7839,7839,7566,NA,7698,7788,7698,7566,
                          7782),
                  HIREDATE = mdy(c("12-17-1980", "02-20-1981", "02-22-1981", "04-02-1981",
                                   "09-28-1981", "05-01-1981", "06-09-1981", "12-09-1982",
                                   "11-17-1981", "09-08-1981", "01-12-1983", "12-03-1981",
                                   "12-03-1981", "01-23-1982")),
                  SAL = c(800,1600,1250,2975,1250,2850,2450,3000,5000,1500,1100,950,3000,1300),
                  COMM = c(NA,300,500,NA,1400,NA,NA,NA,NA,0,NA,NA,NA,NA),
                  DEPTNO = c(20,30,30,20,30,30,10,20,10,30,20,30,20,10))

  emp[,2:3] <- apply(emp[,2:3],2, as.character)

## department 
  
dept <- data.frame(DEPTNO = c(10,20,30,40), DNAME = c("ACCOUNTING", "RESEARCH", "SALES", "OPERATIONS"),
                   LOC = c("NEW YORK", "DALLAS", "CHICAGO", "BOSTON"))
  

dept[,2:3] <- apply(dept[,2:3], 2, as.character)

## emp_bonus

emp_bonus <- data.frame(EMPNO = c(7369,7900, 7788), RECEIVED = lubridate::dmy(c("14-03-2005", 
                                                                                "14-03-2005",
                                                                                "14-03-2005")),
                        TYPE = c(1,2,3))

## emp_bonus2

emp_bonus2 <- data.frame(EMPNO = c(7934, 7934, 7839, 7782), RECEIVED = lubridate::dmy(c("17-03-2005",
                                                                                        "15-02-2005",
                                                                                        "15-02-2005",
                                                                                        "15-02-2005")),
                         type = c(1,2,3,1))

## emp_bonus3

emp_bonus3 <- data.frame(EMPNO = c(7934, 7934), RECEIVED = lubridate::dmy(c("17-03-2005", "15-02-2005")),
                         TYPE = c(1,2))

## emp2

emp2 <- data.frame(EMPNO = c(7369,7499,7521,7566,7654,7698,7782,7788,7839,
                            7844,7876,7900,7902,7934, 8000), 
                  ENAME = c("SMITH","ALLEN", "WARD", "JONES", "MARTIN", "BLAKE", "CLARK",
                            "SCOTT", "KING", "TURNER", "ADAMS", "JAMES", "FORD", "MILLER", "YODA"),
                  JOB = c("CLERK", "SALESMAN", "SALESMAN", "MANAGER", "SALESMAN", "MANAGER",
                          "MANAGER", "ANALYST", "PRESIDENT", "SALESMAN", "CLERK", "CLERK",
                          "ANALYST", "CLERK", "JEDIMASTER"),
                  MGR = c(7902, 7698, 7698,7839,7698,7839,7839,7566,NA,7698,7788,7698,7566,
                          7782, NA),
                  HIREDATE = mdy(c("12-17-1980", "02-20-1981", "02-22-1981", "04-02-1981",
                                   "09-28-1981", "05-01-1981", "06-09-1981", "12-09-1982",
                                   "11-17-1981", "09-08-1981", "01-12-1983", "12-03-1981",
                                   "12-03-1981", "01-23-1982", NA)),
                  SAL = c(800,1600,1250,2975,1250,2850,2450,3000,5000,1500,1100,950,3000,1300, 5000),
                  COMM = c(NA,300,500,NA,1400,NA,NA,NA,NA,0,NA,NA,NA,NA, NA),
                  DEPTNO = c(20,30,30,20,30,30,10,20,10,30,20,30,20,10, NA))

## connect to postgres database 
pg = dbDriver("PostgreSQL")
con = dbConnect(pg, user = rstudioapi::askForPassword("Database user"),
                password = rstudioapi::askForPassword("Database password"),
                host = "localhost", port = 5432, dbname = "sqlcookbook")

## list tables in db 
dbListTables(con)

  ## write emp to emp table 
  dbWriteTable(con, "emp", emp, row.names=FALSE, append = TRUE)
  
  ## write dept to dept table
  dbWriteTable(con, "dept", dept, row.names = FALSE, append = TRUE)
  
  ## write emp_bonus to emp_bonus table 
  dbWriteTable(con, "emp_bonus", emp_bonus, row.names = FALSE, append = TRUE)

  ## write emp_bonus2 to emp_bonus2 table
  dbWriteTable(con, "emp_bonus2", emp_bonus2, row.names = FALSE, append = TRUE)
  
  ## write emp_bonus3 to emp_bonus3 table
  dbWriteTable(con, "emp_bonus3", emp_bonus3, row.names = FALSE, apend = TRUE)
  
  ## write emp2 to emp2 table
  dbWriteTable(con, "emp2", emp2, row.names = FALSE, apend = TRUE)
  
  
## check to see if data loaded 
dbGetQuery(con,"select * from emp;")
dbGetQuery(con, "select * from dept;")  
dbGetQuery(con, "select * from emp_bonus;")
dbGetQuery(con, "select * from emp_bonus2;")
dbGetQuery(con, "select * from emp_bonus3;")
dbGetQuery(con, "select * from emp2;")

dbDisconnect(con)
