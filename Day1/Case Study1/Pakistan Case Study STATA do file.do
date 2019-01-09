clear all

cd "C:\Users\WB305167\Documents\Research

import excel country_code.xls, sheet("country_code") firstrow clear
rename Country countryname
sort Country_Code
save country_code, replace

use "IMF Revenue Database Oct-2017 wide.dta", clear
*use "World Revenue Longitudinal Data (WoRLD) (Stata11and12).dta", clear
*replace wbcode="ROM" if wbcode=="ROU"

replace wbcode="TMP" if wbcode=="TLS"
replace wbcode="COD" if wbcode=="ZAR"

rename wbcode Country_Code
sort Country_Code

replace tax=16.6 if year==2013 & Country_Code=="IND"
replace inc=5.6 if year==2013 & Country_Code=="IND"
replace corp=3.5 if year==2013 & Country_Code=="IND"
replace indv=2.1 if year==2013 & Country_Code=="IND"
replace genr=7.0 if year==2013 & Country_Code=="IND"
replace trade=1.5 if year==2013 & Country_Code=="IND"

replace tax=16.5 if year==2014 & Country_Code=="IND"
replace inc=5.5 if year==2014 & Country_Code=="IND"
replace corp=3.4 if year==2014 & Country_Code=="IND"
replace indv=2.1 if year==2014 & Country_Code=="IND"
replace genr=7.0 if year==2014 & Country_Code=="IND"
replace trade=1.5 if year==2014 & Country_Code=="IND"
replace propr=0.9 if year==2014 & Country_Code=="IND"

local new = _N +1
set obs `new'
replace Country_Code="IND" in l
replace year=2015 in l
replace tax=16.9 if year==2015 & Country_Code=="IND"
replace inc=5.3 if year==2015 & Country_Code=="IND"
replace corp=3.2 if year==2015 & Country_Code=="IND"
replace indv=2.0 if year==2015 & Country_Code=="IND"
replace genr=7.7 if year==2015 & Country_Code=="IND"
replace trade=1.5 if year==2015 & Country_Code=="IND"
replace propr=0.9 if year==2015 & Country_Code=="IND"
replace ccode=534 if year==2015 & Country_Code=="IND"
replace cname="India" if year==2015 & Country_Code=="IND"

local new = _N +1
set obs `new'
replace Country_Code="IND" in l
replace year=2016 in l
replace tax=18.3 if year==2016 & Country_Code=="IND"
replace inc=5.6 if year==2016 & Country_Code=="IND"
replace corp=3.3 if year==2016 & Country_Code=="IND"
replace indv=2.3 if year==2016 & Country_Code=="IND"
replace genr=8.6 if year==2016 & Country_Code=="IND"
replace trade=1.4 if year==2016 & Country_Code=="IND"
replace propr=0.9 if year==2016 & Country_Code=="IND"
replace ccode=534 if year==2016 & Country_Code=="IND"
replace cname="India" if year==2016 & Country_Code=="IND"


local new = _N +1
set obs `new'
replace Country_Code="PAK" in l
replace year=2015 in l

replace ngdp=27493.0 if year==2015 & Country_Code=="PAK"
replace tax=11.0 if year==2015 & Country_Code=="PAK"
replace inc=4.5 if year==2015 & Country_Code=="PAK"
replace excises=0.7 if year==2015 & Country_Code=="PAK"
replace genr=4.7 if year==2015 & Country_Code=="PAK"
replace trade=1.2 if year==2015 & Country_Code=="PAK"
replace propr=0.1 if year==2015 & Country_Code=="PAK"
replace ccode=564 if year==2015 & Country_Code=="PAK"
replace cname="Pakistan" if year==2015 & Country_Code=="PAK"


local new = _N +1
set obs `new'
replace Country_Code="PAK" in l
replace year=2016 in l

replace ngdp=29598.0 if year==2016 & Country_Code=="PAK"
replace tax=13.1 if year==2016 & Country_Code=="PAK"
replace inc=4.3 if year==2016 & Country_Code=="PAK"
replace excises=0.6 if year==2016 & Country_Code=="PAK"
replace genr=5.1 if year==2016 & Country_Code=="PAK" 
replace trade=1.5 if year==2016 & Country_Code=="PAK"
replace propr=0.1 if year==2016 & Country_Code=="PAK"
replace ccode=564 if year==2016 & Country_Code=="PAK"
replace cname="Pakistan" if year==2016 & Country_Code=="PAK"

/*
insheet using "IMF_Tax_Data WORLD.csv"
drop v8
replace countryname="Afghanistan" if countryname=="Afghanistan, I.R. of"
replace countryname="Azerbaijan" if countryname=="Azerbaijan, Rep. of" 
replace countryname="Bahrain" if countryname=="Bahrain, Kingdom of" 
replace countryname="China" if countryname=="China,P.R.: Mainland" 
replace countryname="Korea, Rep." if countryname=="Korea, Republic of" 
replace countryname="Venezuela, RB" if countryname=="Venezuela, Rep. Bol." 
replace countryname="St. Vincent and the Grenadines" if countryname=="St. Vincent & Grens." 
replace countryname="Yemen, Rep." if countryname=="Yemen, Republic of"
replace countryname="Iran, Islamic Rep." if countryname=="Iran, I.R. of"
replace countryname="Egypt, Arab Rep." if countryname=="Egypt"
replace countryname="Bosnia and Herzegovina" if countryname=="Bosnia & Herzegovina"
replace countryname="Central African Republic" if countryname=="Central African Rep."
replace countryname="Hong Kong, China" if countryname=="China,P.R.:Hong Kong"
replace countryname="Congo, Dem. Rep." if countryname=="Congo, Dem. Rep. of"
replace countryname="Congo, Rep." if countryname=="Congo, Republic of"
replace countryname="Lao PDR" if countryname=="Lao People's Dem.Rep"
replace countryname="Sao Tome and Principe" if countryname=="Sao Tome & Principe"
replace countryname="Serbia" if countryname=="Serbia, Republic of"


sort countryname
save IMF_Tax_Data_WORLD.dta, replace

merge countryname using country_code

keep if _merge==3
drop _merge
sort Country_Code
*/

*sort ccode

save "IMF Revenue Database March-2017 - base.dta", replace

*import excel "Tax Structure tax gdp Latest Data 2016.xlsx", sheet("work") firstrow clear
*sort ccode

*keep ccode Country Category1 Category2 Economy

*save "Tax Structure tax GSFY 2014.xlsx", replace

*use "IMF Revenue Database March-2017 - work.dta", clear

*merge ccode using "Tax Structure tax GSFY 2014.xlsx"

*drop if _merge!=3

*drop _merge 

sort Country_Code 

merge Country_Code using country_code
drop if _merge !=3
*list cname ccode Country_Code year if year==2013 & _merge!=3
drop _merge
*sort Country_Code 

*correcting the data for Pakistan 
replace inc=3.3 if Country_Code=="PAK" & year==2013 
replace inc=3.7 if Country_Code=="PAK" & year==2006 
egen cum_tax = rowtotal(inc propr genr excises trade) if inc!=. | propr!=. | genr!=. | excises!=. | trade!=.
gen other_tax=tax-cum_tax
replace other_tax=. if other_tax<0
label var other_tax "Other Taxes"

sort Country_Code year

save "IMF Revenue Database March-2017 - base.dta", replace

use "IMF Revenue Database March-2017 - base.dta", clear

local v="PAK"

*list cname Country_Code countryname _merge if strpos(cname,"Som")!=0

*twoway (scatter  corp tax if year==2013 & Country_Code!="NOR",  mlabel(Country_Code)) (lfit corp tax if year==2013)

*keep if year==2014 & Country_Code!="LUX" & Country_Code!="NOR" & Country_Code!="CHE" & Country_Code!="QAT"

*twoway (scatter  tax ln_GDP_PC if year==2014,  mlabel(Country_Code)) (lfit tax ln_GDP_PC if year==2014)

*drop if indicatorcode!="RT_RM_GDP"|timeperiod!=2013

*list Country_Code indicatorname indicatorcode value if timeperiod==2013 & Region_Code=="EAP"

sort Country_Code year

*twoway (connected tax year if Country_Code=="PAK",  msymbol(o))(connected tax year if Country_Code=="NPL",  msymbol(T))(connected tax year if Country_Code=="LKA",  msymbol(D))(connected tax year if Country_Code=="IND",  msymbol(S))(connected tax year if Country_Code=="BGD",  msymbol(+)), legend (lab(1 "PAK") lab(2 "NPL")lab(3 "LKA")lab(4 "IND")lab(5 "BGD"))
*twoway connected rev year if Region_Code=="SA", by( countryname)
*twoway (connected rev year if Country_Code=="PAK",  msymbol(o))(connected rev year if Country_Code=="NPL",  msymbol(T))(connected rev year if Country_Code=="LKA",  msymbol(D))(connected rev year if Country_Code=="IND",  msymbol(S))(connected rev year if Country_Code=="BGD",  msymbol(+)), legend(pos (3) col(1) lab(1 "PAK") lab(2 "NPL")lab(3 "LKA")lab(4 "IND")lab(5 "BGD"))
*twoway connected rev year if Region_Code=="SA"|Region_Code=="EAP"

**** charts for Pakistan***
*correcting the data for Pakistan 


graph bar inc propr genr excises trade other_tax if Country_Code=="`v'", over(year, relabel(1 "1990" 2 " " 3 " " 4 " " 5 " " 6 "1995" 7 " " 8 " " 9 " " 10 " " 11 "2000" 12 " " 13 " " 14 " " 15 " " 16 "2005" 17 " " 18 " " 19 " " 20 " " 21 "2010" 22 " " 23 " " 24 " " 25 " " 26 " " 27 "2016")) legend(label(1 "Income Tax")  label(2 "Property Tax") label(3 "Tax on Goods") label(4 "Excises") label(5 "Tax on Intl. Trade") label(6 "Other Taxes")) stack

local v="PAK"
graph bar rev tax soc if Country_Code=="`v'", over(year, relabel(1 "1990" 2 " " 3 " " 4 " " 5 " " 6 "1995" 7 " " 8 " " 9 " " 10 " " 11 "2000" 12 " " 13 " " 14 " " 15 " " 16 "2005" 17 " " 18 " " 19 " " 20 " " 21 "2010" 22 " " 23 " " 24 " " 25 " " 26 " " 27 "2016")) legend(label(1 "Revenues")  label(2 "Tax") label(3 "Social Security"))


*list year rev tax inc indv corp pay propr goods genr vat excises trade if Country_Code=="PAK"
*list Country_Code year rev tax inc indv corp pay propr goods genr vat excises trade other_tax if Country_Code=="PAK"


*timeseries Charts tax for regions

*egen imfregionyr = group(Category2 year)
*egen meantax1 = mean(tax), by(imfregionyr) 
*label var meantax1 "Tax-GDP ratio (%)"

egen wbregionyr = group(Region_Code year)
egen meantax2 = mean(tax), by(wbregionyr) 
label var meantax2 "Tax-GDP ratio (%)"


egen oil_gasyr = group(Oil_Gas_Rich year)
egen meantax4 = mean(rev), by(oil_gasyr) 
label var meantax4 "Rev-GDP ratio (%)"


gen Region_Code1=Region_Code
replace Region_Code1="INDIA" if Country_Code=="IND"
egen wbregion1yr = group(Region_Code1 year)
egen meantax3 = mean(tax), by(wbregion1yr) 
label var meantax3 "Tax-GDP ratio (%)"

gen Oil_Gas_Rich1=Oil_Gas_Rich
replace Oil_Gas_Rich1="`v'" if Country_Code=="`v'"

egen oil_gas1yr = group(Oil_Gas_Rich1 year)
egen meantax5 = mean(rev), by(oil_gas1yr) 
label var meantax5 "Rev-GDP ratio (%)"

/*
foreach i in "CEMAC" "CIS" "Central and Eastern Europe" "ECCU" "East Asia" "Euro Area" "Middle East, North Africa" "Other than Euro Area" "Pacific Islands" "South Asia" "Sub Saharan Africa" "WAEMU" "Western Hemisphere"{
	local graphs `graphs' (line meantax year if Category2 == "`i'")
	}
graph twoway `graphs', legend (lab(1 "CEMAC") lab(2 "CIS")lab(3 "Central and Eastern Europe")lab(4 "ECCU")lab(5 "East Asia") lab(6 "Euro Area") lab(7 "Middle East, North Africa") lab(8 "Other than Euro Area") lab(9 "Pacific Islands") lab(10 "South Asia") lab(11 "Sub Saharan Africa") lab(12 "WAEMU") lab(13 "Western Hemisphere"))

*/
* twoway (connected meantax year), by(Category2)
*sort Category2 year 
*sepscatter meantax1 year, separate(Category2) recast(connect) missing

sort Region_Code year
sepscatter meantax2 year if year<=2014, separate(Region_Code1) recast(connect) missing  title("Tax Collection by Region - Trend")

sort Oil_Gas_Rich1 year
sepscatter meantax5 year if year<=2014, separate(Oil_Gas_Rich1) recast(connect) missing  title("Tax Collection by Region - Trend")

egen meantax = mean(tax), by(year)
label var meantax "Overall Taxes"
egen meantaxinc = mean(inc), by(year)
label var meantaxinc "PIT/CIT"
egen meantaxcorp = mean(corp), by(year)
label var meantaxcorp "CIT"
egen meantaxindv = mean(indv), by(year)
label var meantaxindv "PIT"
egen meantaxpropr = mean(propr), by(year)
label var meantaxpropr "Property Tax"
egen meantaxgenr = mean(genr), by(year)
label var meantaxgenr "VAT"
egen meantaxexcises = mean(excises), by(year)
label var meantaxexcises "Excises"
egen meantaxtrade = mean(trade), by(year)
label var meantaxtrade "Trade Taxes"
egen meantaxother_tax = mean(other_tax), by(year)
label var meantaxother_tax "Other Taxes"

sort year
twoway (connected meantaxindv meantaxcorp meantaxpropr meantaxgenr meantaxexcises meantaxtrade meantaxother_tax year if year<=2014 , yaxis(1) msymbol(Oh S T + - x) ytitle("% of GDP") ) (connected meantax year if year<=2014, yaxis(2) msymbol(o) title("Tax Structure over time"))
*without total tax
twoway (connected meantaxindv meantaxcorp meantaxpropr meantaxgenr meantaxexcises meantaxtrade meantaxother_tax year if year<=2014 , yaxis(1) msymbol(Oh S T + - x) ytitle("% of GDP") title("Tax collection over time (World)"))

*CIT 
twoway (connected meantaxcorp year if year<=2014 , msymbol(O) ylabel(0(1.0)5.0) ytitle("% of GDP") title("CIT collection over time"))

sort Region_Code1 year
twoway (connected meantax3 year if year<=2014 & Region_Code1=="SA", msymbol(Oh))(connected tax year if year<=2014 & Country_Code=="IND"), legend(lab(1 "South Asia: Total Taxes") lab(2 "India:Total Taxes")) ytitle("% of GDP") title("Comparing Tax Collection")

**************
*** Tax Buouancy and Tax Effort

use "IMF Revenue Database March-2017 - work.dta", clear
gen res_dum=.
replace res_dum=1 if Resource_Rich=="YES"
replace res_dum=0 if Resource_Rich=="NO"

gen oil_gas_dum=.
replace oil_gas_dum=1 if Oil_Gas_Rich=="YES"
replace oil_gas_dum=0 if Oil_Gas_Rich=="NO"

*per capita GDP dataset see reshape data do file
merge 1:m Country_Code year using "Per Capita GDP Current USD - Feb-2017"
drop if _merge !=3
drop _merge
gen ln_GDP_PC = ln(GDP_Per_Capita_Current_USD)
label var ln_GDP_PC "Log of GDP_Per_Capita"

drop if Country_Code=="LSO"
twoway (scatter tax ln_GDP_PC if year==2014, mlabsize(vsmall) mlabel(Country_Code)) (scatter tax ln_GDP_PC if year==2014 & Country_Code=="`v'", mcolor(red)) (lfit tax ln_GDP_PC if year==2014), graphregion(color(white)) bgcolor(white) ylabel(, nogrid) ytitle("Tax Revenues (% of GDP), 2014") xtitle("Log GDP per capita, 2014") title("Level of Income and Tax Revenues") legend(off)

twoway (scatter rev ln_GDP_PC if year==2014 & Country_Code!="KIR" & Country_Code!="TUV", mlabsize(vsmall) mlabel(Country_Code)) (scatter rev ln_GDP_PC if year==2014 & Country_Code=="`v'", mcolor(red)) (lfit rev ln_GDP_PC if year==2014 & Country_Code!="KIR" & Country_Code!="TUV"), graphregion(color(white)) bgcolor(white) ylabel(, nogrid) ytitle("Revenues (% of GDP), 2014") xtitle("Log GDP per capita, 2014") title("Level of Income and Revenues") legend(off)

twoway (scatter rev ln_GDP_PC if year==2014 & Country_Code!="KIR" & Country_Code!="TUV" & res_dum==1, mlabsize(vsmall) mlabel(Country_Code)) (scatter rev ln_GDP_PC if year==2014 & Country_Code=="`v'", mcolor(red)) (lfit rev ln_GDP_PC if year==2014 & Country_Code!="KIR" & Country_Code!="TUV" & res_dum==1), graphregion(color(white)) bgcolor(white) ylabel(, nogrid) ytitle("Revenues (% of GDP), 2014") xtitle("Log GDP per capita, 2014") title("Level of Income and Revenues") legend(off)

twoway (scatter rev ln_GDP_PC if year==2014 & Country_Code!="KIR" & Country_Code!="TUV" & res_dum==1, mlabsize(vsmall) mlabel(Country_Code)) (scatter rev ln_GDP_PC if year==2014 & Country_Code=="`v'", mcolor(red)) (lfit rev ln_GDP_PC if year==2014 & Country_Code!="KIR" & Country_Code!="TUV" & res_dum==1), graphregion(color(white)) bgcolor(white) ylabel(, nogrid) ytitle("Revenues (% of GDP), 2014") xtitle("Log GDP per capita, 2014") title("Level of Income and Revenues") legend(off)

twoway (scatter rev ln_GDP_PC if year==2014 & Country_Code!="KIR" & Country_Code!="TUV" & oil_gas_dum==1, mlabsize(vsmall) mlabel(Country_Code)) (scatter rev ln_GDP_PC if year==2014 & Country_Code=="`v'", mcolor(red)) (lfit rev ln_GDP_PC if year==2014 & Country_Code!="KIR" & Country_Code!="TUV" & oil_gas_dum==1), graphregion(color(white)) bgcolor(white) ylabel(, nogrid) ytitle("Revenues (% of GDP), 2014") xtitle("Log GDP per capita, 2014") title("Level of Income and Revenues") legend(off)

twoway (scatter tax ln_GDP_PC if year==2014 & Country_Code!="KIR" & Country_Code!="TUV" & res_dum==1, mlabsize(vsmall) mlabel(Country_Code)) (scatter tax ln_GDP_PC if year==2014 & Country_Code=="`v'", mcolor(red)) (lfit tax ln_GDP_PC if year==2014 & Country_Code!="KIR" & Country_Code!="TUV" & res_dum==1), graphregion(color(white)) bgcolor(white) ylabel(, nogrid) ytitle("Revenues (% of GDP), 2014") xtitle("Log GDP per capita, 2014") title("Level of Income and Revenues") legend(off)

twoway (scatter tax ln_GDP_PC if year==2014 & Country_Code!="KIR" & Country_Code!="TUV" & oil_gas_dum==1, mlabsize(vsmall) mlabel(Country_Code)) (scatter tax ln_GDP_PC if year==2014 & Country_Code=="`v'", mcolor(red)) (lfit tax ln_GDP_PC if year==2014 & Country_Code!="KIR" & Country_Code!="TUV" & oil_gas_dum==1), graphregion(color(white)) bgcolor(white) ylabel(, nogrid) ytitle("Revenues (% of GDP), 2014") xtitle("Log GDP per capita, 2014") title("Level of Income and Revenues") legend(off)

/*
table Country_Code year if oil_gas_dum==1 & year>=2000, c(mean rev) f(%5.2f) column

table cname year if oil_gas_dum==1 & year>=2000, c(mean rev) f(%5.2f) column

table cname year if oil_gas_dum==1 & year>=2000, c(mean tax) f(%5.2f) column


foreach v of numlist 2000(1)2014 { 
twoway (scatter rev ln_GDP_PC if year==2014 & Country_Code!="KIR" & Country_Code!="TUV" & res_dum==1, mlabsize(vsmall) mlabel(Country_Code)) /
(scatter rev ln_GDP_PC if year==`v' & Country_Code=="`v'", mcolor(red)) (lfit rev ln_GDP_PC if year==2014 & Country_Code!="KIR" & Country_Code!="TUV" & res_dum==1), graphregion(color(white)) bgcolor(white) ylabel(, nogrid) ytitle("Revenues (% of GDP), 2014") xtitle("Log GDP per capita, 2014") title("Level of Income and Revenues") legend(off)
}
*importing agriculture dataset see reshape data do file
*/

merge 1:m Country_Code year using "Agriculture value added WDI March 2017 - percent of GDP"
drop if _merge !=3
drop _merge

drop if Country_Code=="LSO"
twoway (scatter tax agri_share if year==2014, mlabsize(vsmall) mlabel(Country_Code)) (scatter tax agri_share if year==2014 & Country_Code=="`v'", mcolor(red)) (lfit tax agri_share if year==2014), graphregion(color(white)) bgcolor(white) ylabel(, nogrid) ytitle("Tax Revenues (% of GDP), 2014") xtitle("Agriculture Value Added (% of GDP), 2014") title("Level of Income and Tax Revenues") legend(off)

merge 1:m Country_Code year using "Polity Dataset Democracy"
drop if _merge !=3
drop _merge

twoway (scatter tax democracy if year==2014, mlabsize(vsmall) mlabel(Country_Code)) (scatter tax democracy if year==2014 & Country_Code=="`v'", mcolor(red)) (lfit tax democracy if year==2014), graphregion(color(white)) bgcolor(white) ylabel(, nogrid) ytitle("Tax Revenues (% of GDP), 2014") xtitle("Log GDP per capita, 2014") title("Level of Income and Tax Revenues") legend(off)

merge 1:m Country_Code year using "GDP Current USD - March 2017"
drop if _merge !=3
drop _merge
gen ln_GDP = ln(GDP)
label var ln_GDP "Log of GDP Current USD"

merge 1:m Country_Code year using "Population WDI - 2017-Oct Query"
drop if _merge !=3
drop _merge

*merging IMF WEO database

drop phat*

local v="IND"
*regressions and adjusting for other variables

reg tax ln_GDP_PC agri_share democracy res_dum if year==2014

corr ln_GDP_PC agri_share  res_dum democracy if year==2014

reg tax ln_GDP_PC democracy res_dum if year==2014
predict phat
list tax phat if year==2014 & Country_Code=="`v'"
drop phat

reg inc ln_GDP_PC democracy res_dum if year==2014
predict phat1
list inc phat1 if year==2014 & Country_Code=="`v'"
drop phat1

reg genr ln_GDP_PC democracy res_dum if year==2014
predict phat2
list genr phat2 if year==2014 & Country_Code=="`v'"
drop phat2

reg trade ln_GDP_PC democracy res_dum if year==2014
predict phat3
list trade phat3 if year==2014 & Country_Code=="`v'"

reg other_tax ln_GDP_PC democracy res_dum if year==2014
predict phat4
list other_tax phat4 if year==2014 & Country_Code=="`v'"

reg excises ln_GDP_PC democracy res_dum if year==2014
predict phat5
list excises phat5 if year==2014 & Country_Code=="`v'"

drop phat*

reg tax ln_GDP_PC democracy res_dum if year==2014
reg tax res_dum democracy if year==2014
predict resid_tax, residuals
reg ln_GDP_PC res_dum democracy if year==2014
predict resid_lngdp, residuals
twoway (scatter resid_tax resid_lngdp if year==2014, mlabsize(vsmall) mlabel(Country_Code)) (scatter resid_tax resid_lngdp if year==2014 & Country_Code=="`v'", mcolor(red)) (lfit resid_tax resid_lngdp if year==2014), graphregion(color(white)) bgcolor(white) ylabel(, nogrid) ytitle("Tax Revenues (% of GDP), 2014", size (small)) xtitle("Log GDP per capita adjusted for democracy and resources, 2014", size (small)) title("Tax Revenues and Level of Income adjusted", size (small)) legend(off)

*avplot ln_GDP_PC, mlabsize(vsmall) mlabel(Country_Code) graphregion(color(white)) bgcolor(white) ylabel(, nogrid) ytitle("Tax Revenues (% of GDP), 2014") xtitle("Log GDP per capita, 2014") title("AVPLOT Level of Income and Tax Revenues") legend(off)

*time trends

graph bar inc propr genr excises trade other_tax if Country_Code=="`v'", over(year, relabel(1 "1990" 2 " " 3 " " 4 " " 5 " " 6 "1995" 7 " " 8 " " 9 " " 10 " " 11 "2000" 12 " " 13 " " 14 " " 15 " " 16 "2005" 17 " " 18 " " 19 " " 20 " " 21 "2010" 22 " " 23 " " 24 " " 25 " " 26 "2015" 27 "2016")) legend(label(1 "Income Tax")  label(2 "Property Tax") label(3 "Tax on Goods") label(4 "Excises") label(5 "Tax on Intl. Trade") label(6 "Other Taxes")) graphregion(color(white)) bgcolor(white) ylabel(, nogrid) ytitle("(% of GDP), 2014", size (small)) title("`v' Tax Structure (1990-2016)", size (small)) legend(off) stack

*calculating buoyancy and efficiency
* tax collection in LCU

use "IMF Revenue Database March-2017 - base.dta", clear

foreach v in rev tax inc indv corp pay propr goods genr vat excises trade soc grants { 
gen `v'_lcu=(`v'/100)*ngdp
local w=upper(substr("`v'",1,1))+substr("`v'",2,.)+" Revenue in LCU"
label var `v'_lcu "`w'"
}

encode Country_Code , gen(cntry)
tsset cntry year
gen delta_GDP=(ngdp-l.ngdp)/l.ngdp

foreach v in rev tax inc propr genr trade { 
gen delta_`v'=(`v'_lcu-l.`v'_lcu)/l.`v'_lcu
gen `v'_buoyancy=delta_`v'/delta_GDP
local w=upper(substr("`v'",1,1))+substr("`v'",2,.)+ " Taxes - Buoyancy"
}

label var rev_buoyancy "Revenue Buoyancy"
label var tax_buoyancy "Tax Buoyancy"
label var inc_buoyancy "Income Taxes Buoyancy"
label var genr_buoyancy "Goods and Services Taxes Buoyancy"
label var propr_buoyancy "Property Taxes Buoyancy"
label var trade_buoyancy "Trade Taxes Buoyancy"

foreach v in rev tax inc propr genr trade { 
egen buoy_cnt_`v'_gt_1=count(`v'_buoyancy) if `v'_buoyancy>=1 & `v'_buoyancy!=. , by(Country_Code)
replace buoy_cnt_`v'_gt_1=0 if buoy_cnt_`v'_gt_1==. & `v'_buoyancy!=.
}
gen tot_yrs=2016-1990


su buoy_cnt_tax_gt_1 if Country_Code=="`v'"
su buoy_cnt_inc_gt_1 if Country_Code=="PAK"
*su buoy_cnt_genr_gt_1 if Country_Code=="PAK"
*su buoy_cnt_trade_gt_1 if Country_Code=="PAK"

*tostring tot_yrs, replace 
*tostring buoy_cnt_tax_lt_1, replace
local l=`r(N)'-`r(max)'
local text1="Years Buoyancy is < 1 : "+ "`l'"
local text2="Years Buoyancy is > 1 : "+ "`r(max)'"

*di "`text2'"

*gen tax_buoy_5_yr_avg= (F2.tax_buoyancy+F1.tax_buoyancy+tax_buoyancy+l1.tax_buoyancy+l2.tax_buoyancy)/5
*gen tax_buoy_3_yr_avg= (F1.tax_buoyancy+tax_buoyancy+l1.tax_buoyancy)/3

*sort Country_Code year
*twoway (lowess tax_buoyancy year if year<=2016 & Country_Code=="PAK", bwidth(0.2) msymbol(X)), title("Tax Buoyancy `v' (smoothed)")

*twoway (connected tax_buoyancy year if year<=2016 & Country_Code=="`v'", yline(0) yline(1, lp(dash)) msymbol(X) ytitle("Multiples of GDP", size(small)) ), graphregion(color(white)) bgcolor(white) ylabel(, nogrid labsize(small)) xtitle(, size(small)) xlabel(, labsize(small)) text(2.6 2010 "`text1'", color(black) size(vsmall)) text(2.4 2010  "`text2'", color(black) size(vsmall)) title("Buoyancy of Overall Taxes in `v'", size(small))

*twoway (connected tax_buoyancy inc_buoyancy genr_buoyancy trade_buoyancy year if year<=2016 & Country_Code=="PAK", yline(0) yline(1, lp(dash)) msymbol(Oh S T + - x)), title("Tax Buoyancy `v'", size(small))

*twoway (connected tax_buoyancy year if year<=2016 & Country_Code=="PAK", msymbol(X) yline(0) yline(1, lp(dash)) ytitle("Multiples of GDP", size(small)) ylabel(-1.0(1.0)4.0)), graphregion(color(white)) bgcolor(white) ylabel(, nogrid labsize(small)) xtitle(, size(small)) xlabel(, labsize(small)) text(3.2 2011 "`text1'", color(black) size(vsmall)) text(3.0 2011  "`text2'", color(black) size(vsmall)) title("Buoyancy of Income Taxes in `v'", size(small))

twoway (connected inc_buoyancy year if year<=2016 & Country_Code=="`v'", msymbol(X) yline(0) yline(1, lp(dash)) ytitle("Multiples of GDP", size(small)) ylabel(-1.0(1.0)4.0)), graphregion(color(white)) bgcolor(white) ylabel(, nogrid labsize(small)) xtitle(, size(small)) xlabel(, labsize(small)) text(3.2 2011 "`text1'", color(black) size(vsmall)) text(3.0 2011  "`text2'", color(black) size(vsmall)) title("Buoyancy of Income Taxes in `v'", size(small))

twoway (connected genr_buoyancy year if year<=2016 & Country_Code=="`v'", msymbol(X) yline(0) yline(1, lp(dash)) ytitle("Multiples of GDP", size(small)) ylabel(-1.0(1.0)11.0)), graphregion(color(white)) bgcolor(white) ylabel(, nogrid labsize(small)) xtitle(, size(small)) xlabel(, labsize(small)) text(7.6 2011 "`text1'", color(black) size(vsmall)) text(7.0 2011  "`text2'", color(black) size(vsmall)) title("Buoyancy of Goods and Services Taxes in `v'", size(small))

twoway (connected trade_buoyancy year if year<=2016 & Country_Code=="`v'", msymbol(X) yline(0) yline(1, lp(dash)) ytitle("Multiples of GDP", size(small)) ylabel(-9.0(1.0)8.0)), graphregion(color(white)) bgcolor(white) ylabel(, nogrid labsize(small)) xtitle(, size(small)) xlabel(, labsize(small)) text(6.7 2011 "`text1'", color(black) size(vsmall)) text(6.0 2011  "`text2'", color(black) size(vsmall)) title("Buoyancy of Trade Taxes in `v'", size(small))

*TAX EFFICIENCY

merge 1:m Country_Code year using "`v'rbaijan Tax Rate Data"
drop if _merge!=3
drop _merge
keep if Country_Code=="PAK"

gen gst_eff=(genr/GST_Rate)*100
gen inc_eff=(inc/Composite_Income_Tax_Rate)*100

twoway (connected gst_eff year if year<=2016 & Country_Code=="PAK",  msymbol(X) ytitle("(%)", size(small)) ), graphregion(color(white)) bgcolor(white) ylabel(, nogrid labsize(small)) xtitle(, size(small)) xlabel(, labsize(small)) text(17 2010 "100% is full efficiency", color(black) size(small)) title("Tax Efficiency - Goods and Services Taxes", size(small))
twoway (connected inc_eff year if year<=2016 & Country_Code=="PAK",  msymbol(X) ytitle("(%)", size(small)) ), graphregion(color(white)) bgcolor(white) ylabel(, nogrid labsize(small)) xtitle(, size(small)) xlabel(, labsize(small)) text(8.0 2010 "100% is full efficiency", color(black) size(small)) title("Tax Efficiency - Income Taxes", size(small))




