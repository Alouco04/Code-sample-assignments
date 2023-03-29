********************************************************************************

					* ARE 166: Economics of Global Poverty *
		
						  * Week 3 - April 16, 2020
								* Problem Set 2							    
       
********************************************************************************


* 0. Set current directory:

	cd "//tsclient/Remote_Stata/"
   
	* cd "/Users/julian/Dropbox/Spring-2020/166/Problem Set 2/"
	use ps2_2020_Nicaragua.dta, clear

* 1. Bivariate regressions: reg command

	* Regression we want to run:
	
	* 		[income = beta_0 + beta_1*treat + epsilon]
	
	* In Stata:
	
	reg income treat
	
	* How do we interpret the output?
	
	* Some stored values: (will show values of last regression run)
	
	display _b[treat] 	// beta_1
	display _se[treat] 	// std. err()
	
	* t-statistic:
	
	display _b[treat]/_se[treat]
	
	* 95% Confidence Intervals:
	
	display _b[treat] - 1.96*_se[treat]  // lower bound
	display _b[treat] + 1.96*_se[treat]	 // upper bound
	
	/* Note that the critical value 1.96 is an approximation:
	   that's why the two values above are not exactly the same as
	   in the regression output table. (As the number of observations
	   grows the 1.96 approximation is more accurate).  */
	   
	* How does all of the above compare with the mean-difference ttest?
	
	ttest income,by(treat)
	
* 2. Multivariate regressions: Adding controls.

	* Regression we want to run:
	
	* 		[income = beta_0 + beta_1*treat + beta_2*land + epsilon]
	
	* In Stata:
	
	reg income treat land
	
	* Can add as many variables as we need:
	
	reg income treat land age
	
	reg income treat land age job // how to interpret job?
	
	* The way we included it doesn't make sense...
	
	tab job // categorical variable: few values that group observations.

* 3. Turn categorical variable into several dummies:

	***
	* Lets, first, add a label to the values: label command
	
	* Define label:
	label define job_labels 1 "Cattle" 2 "Grain" 3 "Yuca" 
	* Give newly defined labels to variable values
	label values job job_labels
	
	* Check:
	tab job
	***
	
	* Now, we want to include each job as a separate dummy in the regression 
	* equation:
	
	* [income = beta_0 + beta_1*treat + beta_2*land + beta_3*cattle +
	*				beta_4*grain + beta_5*yuca + epsilon]
	
	* split categorical variable into as many dummies as categories:
	
	tab job, gen(job_)
	
	* We can change the name of existing variables: rename command.
	
	rename job_1 cattle
	rename job_2 grain
	rename job_3 yuca
	
	* Now we're set to run the regression:
	
	reg income treat land grain cattle yuca
	
	* Why does it omit one category? 
	* How should we interpret dummy variables representing categories?
	
	* (Can choose which category to omit)
	
	reg income treat land grain yuca
	reg income treat land grain cattle
	reg income treat land cattle yuca

* 4. Exporting regression results:

	* Several ways to do it.
	
	* One of the easiest: outreg2 command
	
	reg income treat land cattle yuca
	outreg2 using regtable_1.xls, replace
	
*******
	
	
	
	
	
	
