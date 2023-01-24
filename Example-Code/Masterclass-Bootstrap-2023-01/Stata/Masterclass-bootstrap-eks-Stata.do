// OCBE Masterclass Bootstrap 2023 - Stata eksempel (https://www.stata.com|/)
//    https://www.med.uio.no/imb/english/research/centres/ocbe/
//    https://www.ous-research.no/ocbe/
//    ved Harald Weedon-Fekjær <harald.weedon-fekjar@medisin.uio.no>

// Bootstrap i Stata:
// I Stata kan noen rutiner kjøre bootstrap direkte, mens endel andre krever
// at man henter ut de rette estimatene fra kjøringene. Hvis funksjonen
// ikke direkte støtter bootstrap må man først sjekke hvordan Stata lagerer
// de ulike resulatene av funksjon, så man vet hva som skal anvedes i 
// bootstrap kjøringen.


// ------------------------------------
// ----- Laster eksempel dataene: -----
// ------------------------------------
// NB: Husk å forandre filområde til der du har filen!
cd "M:\OusBiostat\Kurs-foredrag\Masterclass\Masterclass-Bootstap\Eksempel\data\"
import delimited "RoykeSlutt.csv", delimiter(";") case(preserve) numericcols(2 3) 



// -----------------------------------------------
// ------ 95% bootstrap konfidens intervall: -----
// -----------------------------------------------

// **********************************************************
// ***  Bootstrap: Gjennomsnittlig røykeslutt motivasjon: ***
// **********************************************************
bootstrap, reps(10000) seed(3) dots(1000): mean Motivasjon
estat bootstrap, all


// *************************************************
// ***  Bootstrap: Median røykeslutt motivasjon: ***
// *************************************************
// I stata regner man ut median via "summarize ..., detail", mens
// den støter bootstrap direkte.
// Først kjører "summarize" finner navnet på variabelen vi skal bruke:
summarize Motivasjon, detail
return list      // Ser på hva "summarize" lagerer av skjulte variable
display r(p50)   // Dobbelt sjekker at  r(p50) inneholder median
// Kjører bootstrap:
bootstrap r(p50), reps(10000) seed(3) nodots:summarize Motivasjon, detail
estat bootstrap, all  // Skriver ut de ulike bootstrap estimatene


// ***************************************************************
// *** Forskjell mellom de som slutter og de som ikke slutter: ***
// ***************************************************************
// Via regresjon:
bootstrap, bca reps(10000) seed(3) nodots: regress Motivasjon Sluttet6m
estat bootstrap, all

// Via "ttest":
bootstrap (r(mu_1)-r(mu_2)), reps(10000) seed(3) nodots:ttest Motivasjon, by(Sluttet6m)
estat bootstrap, all

// Med bruk "ttest" og egen definert av funksjon:
program diffmean, rclass
  ttest Motivasjon, by(Sluttet6m)
  scalar m1 = r(mu_1)
  scalar m2 = r(mu_2)
  return scalar estm = m1-m2
end
bootstrap r(estm), reps(10000) seed(3) nodots: diffmean
program drop diffmean
estat bootstrap, all
