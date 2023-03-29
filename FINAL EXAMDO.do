use "\\tsclient\STATA Folder\DTMaize-trans2.dta"
reg Yield_trans Assign_trans
display 195.6901/539.2199
gen P=0.5
gen C=200
gen W=300
gen H=2
gen avgYield=539.2199
gen Y= (W+(avgYield*H)*P)-C
display Y
gen ITT=195.69
replace Y= (W+((ITT+avgYield)*H)*P)-C
display Y
display 834.91-639.22
display 195.69/639.22
use "\\tsclient\STATA Folder\DTMaize-levels2.dta", clear
tab Assign Use_DT
gen Ap=91/2014
gen Np=1885/3676
gen Pa=1-Ap-Np
display Ap Np Pa
display 195.69/Pa
reg Yield Assign if Drought==0
reg Yield Assign if Drought==1
gen Da=Drought*Assign 
reg Yield Assign Drought Da
use "\\tsclient\STATA Folder\DTMaize-trans2.dta",clear
gen Da=Drought_trans*Assign_trans 
reg Yield_trans Drought_trans Assign_trans da
gen P=0.5
gen C=200
gen W=300
gen H=2
gen avgYield=537.18
gen Yt= (W+((200.92+100.42+avgYield-38.51)*H)*P)-C
display Yt
gen Yc= (W+((avgYield-38.51)*H)*P)-C
display Yc

