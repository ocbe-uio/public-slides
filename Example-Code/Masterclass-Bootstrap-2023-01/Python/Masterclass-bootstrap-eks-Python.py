# OCBE Masterclass Bootstrap 2023 - Python eksempel (https://www.python.org/)
#    https://www.med.uio.no/imb/english/research/centres/ocbe/
#    https://www.ous-research.no/ocbe/
#    ved Harald Weedon-Fekjær <harald.weedon-fekjar@medisin.uio.no>

import os
import pandas as pd
import numpy as np
from scipy.stats import bootstrap


# ------------------------------------
# ----- Laster eksempel dataene: -----
# ------------------------------------
# NB: Husk å forandre arbeideormåde:
arbeidsomraade = "M:\\OusBiostat\\Kurs-foredrag\\Masterclass"
arbeidsomraade +=  "\\Masterclass-Bootstap\\Eksempel\\Eksempel-programmer\\Python\\"
os.chdir(arbeidsomraade)
# Leser inn data:
filnavn = arbeidsomraade + "RoykeSlutt.csv"
RoykeSlutt = pd.read_csv(filnavn,sep=";")


# -----------------------------------------------
# ------ 95% bootstrap konfidens intervall: -----
# -----------------------------------------------


# Bootstrap: Gjennomsnittlig røykeslutt motivasjon:
VarUtenUkjente = RoykeSlutt['Motivasjon'].dropna()
bootstrap_ci = bootstrap( (VarUtenUkjente,), np.mean,
                         n_resamples=10000,random_state=3,
                         confidence_level=0.95,method='percentile') 
                         # BCa bootstrap bruk: method='BCa'
print(bootstrap_ci.confidence_interval)
  #* Utskrift:
  #* ConfidenceInterval(low=7.982456140350878, high=8.964912280701755)

# Bootstrap: Median røykeslutt motivasjon:
VarUtenUkjente = RoykeSlutt['Motivasjon'].dropna()
bootstrap_ci = bootstrap( (VarUtenUkjente,), np.median,
                         n_resamples=10000,random_state=3,
                         confidence_level=0.95,method='percentile') 
                         # BCa bootstrap bruk: method='BCa'
print(bootstrap_ci.confidence_interval)
  #* Utskrift:
  #* ConfidenceInterval(low=8.0, high=10.0)


# Bootstrap:  Gjennomsnittlig forskjell i røykeslutt motivasjon mellom
#             de som har sluttet etter 6 måneder og de som ikke har sluttet:
DataUtenUkjente = RoykeSlutt[['Motivasjon','Sluttet6m']].dropna()
m0 = np.mean(DataUtenUkjente[DataUtenUkjente['Sluttet6m']==0])[0]
m1 = np.mean(DataUtenUkjente[DataUtenUkjente['Sluttet6m']==1])[0]
print(m1-m0)
  #* Utskrift:
  #* 0.8416666666666668
def GjennomsnittligForskjell(bootMot,bootSlutt):
    m0 = np.mean(bootMot[bootSlutt==0])
    m1 = np.mean(bootMot[bootSlutt==1])
    return m1-m0
DataUtenUkjente = RoykeSlutt[['Motivasjon','Sluttet6m']].dropna()
data = (DataUtenUkjente['Motivasjon'],DataUtenUkjente['Sluttet6m'])
bootstrap_ci = bootstrap( data, GjennomsnittligForskjell,vectorized=False,
                         paired=True, # Husk "paired=True"!
                         n_resamples=10000,random_state=3,
                         confidence_level=0.95,method='percentile') 
print(bootstrap_ci.confidence_interval)
  #* Utskrift:
  #* ConfidenceInterval(low=-0.0666666666666682, high=1.7499999999999991)