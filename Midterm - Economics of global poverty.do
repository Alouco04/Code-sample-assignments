use "\\tsclient\STATA Folder\CSG_Midterm_2020_Data.dta"
cd "\\tsclient\STATA Folder"
reg haz04 treat if group==1|group==2
outreg2 using midterm1.doc, ctitle(Regression 1)
gen Nel=0 if group==2
replace Nel=1 if group==1
ttest pcexp1998 ,by(Nel)
ttest edu,by(Nel)
gen el=0 if group==3
replace el=1 if group==1
reg haz04 treat if group==1|group==3
outreg2 using midterm1_2.doc, ctitle(Regression 2)
ttest pcexp1998 ,by(el)
ttest edu,by(el)
reg haz04 educ treat married unemployed pcexp1998 if group==1|group==3
outreg2 using midterm1_2.doc, ctitle(MultiRegression)
reg educ treat if group==1| group==3
gen poor98=0
replace poor98=1 if pcexp1998<322
tab poor98 group
gen poor04=0
replace poor04=1 if pcexp2004<322
tab poor04 group
gen gap98=0
replace gap98=(322-pcexp1998)/322 if pcexp1998<322
sum gap98 if poor98==1 & group==1
sum gap98 if poor98==1 & group==2
sum gap98 if poor98==1 & group==3
gen gap04=0
replace gap04=(322-pcexp2004)/322 if pcexp2004<322
sum gap04 if poor04==1 & group==1
sum gap04 if poor04==1 & group==2
sum gap04 if poor04==1 & group==3
gen chron=0
replace chron=1 if poor98==1 & poor04==1
tab chron group
