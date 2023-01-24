* Encoding: UTF-8.
 PRESERVE.
SET DECIMAL DOT.


/* ##### Leser inn data ##### */
GET DATA  /TYPE=TXT
  /FILE=
    "M:\OusBiostat\Kurs-foredrag\Masterclass\Masterclass-Bootstap\Eksempel\Eksempel-programmer\SPSS\R"+
    "oykeSlutt.csv"
  /ENCODING='UTF8'
  /DELIMITERS=";"
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /DATATYPEMIN PERCENTAGE=95.0
  /VARIABLES=
  Intervensjon AUTO
  Motivasjon AUTO
  Sluttet6m AUTO
  /MAP.
RESTORE.
CACHE.
EXECUTE.
DATASET NAME DataSet1 WINDOW=FRONT.


/* ##### Bootstrap: Gjennomsnittlig røykeslutt motivasjon: ##### */
DATASET ACTIVATE DataSet2.
PRESERVE.
SET RNG=MT MTINDEX=3.
SHOW RNG.
BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES TARGET=Motivasjon 
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=10000
  /MISSING USERMISSING=EXCLUDE.
MEANS TABLES=Motivasjon
  /CELLS=MEAN COUNT STDDEV.
RESTORE.


/* ##### Bootstrap: Median røykeslutt motivasjon: ##### */
PRESERVE.
SET RNG=MT MTINDEX=3.
SHOW RNG.
BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES TARGET=Motivasjon 
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=10000
  /MISSING USERMISSING=EXCLUDE.
EXAMINE VARIABLES=Motivasjon
  /PLOT BOXPLOT STEMLEAF
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.
RESTORE.


/* ##### Bootstrap:  Gjennomsnittlig forskjell i røykeslutt motivasjon mellom             ##### */
/* #####                   de som har sluttet etter 6 måneder og de som ikke har sluttet   ##### */
PRESERVE.
SET RNG=MT MTINDEX=3.
SHOW RNG.
BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES TARGET=Motivasjon INPUT=Sluttet6m 
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=10000
  /MISSING USERMISSING=EXCLUDE.
T-TEST GROUPS=Sluttet6m(0 1)
  /MISSING=ANALYSIS
  /VARIABLES=Motivasjon
  /ES DISPLAY(TRUE)
  /CRITERIA=CI(.95).
RESTORE.
