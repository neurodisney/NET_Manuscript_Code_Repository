README

Plotting_Bayesian_Model_Outputs
Updated: 03/04/2025

Dependencies:
MATLAB 

Overview: The code in this directory plots posterior parameters outputted from Rstudio_Bayesian_Analysis.txt. Subdirectories are named after the figure in the manuscript for which they generate. 

Functions and Directories 

Functions
Two MATLAB functions that generate violin plots called by code in subdirectories; add to MATLAB path prior to use.  
	Violin
	violinplot

Subdirectories 
Figure_4: code that plots the distribution of posterior log likelihood values for each model in analysis. 
	
	readLps: reads in lps.csv, formatted as lps_template.csv, also accepts .csv sorted by model
	
	plotLps: calls function violinplot to plot posterior distributions. 

	lps_template: data file should resemble this lps_template.csv file

		Column A
			~no title~
			iteration of model fit number 1:X, where X = number of models * iterations of fit
			Notes: each of the five models is fit 7000, resulting in 35000 values 
		Column B
			model
			Options [Model 1, Model 2, Model 3, Model 4, Model 5]
		Column C
			lp
			Options: negative values 
			Notes: log likelihood values should be populated in output file. 

Figure_6: code that plots the distribution of layer-specific posterior beta values for DBH+ and NET+ axons in V1. both posterior distributions are plotted within each layer's column
	
	readbetas: reads in V1betas.csv, formatted as V1betas_template.csv, also accepts .csv sorted by protein
	
	plotbetas: calls function violinplot to plot posterior distribution of V1 betas. 

	V1betas_template: data file should resemble this V1betas_template.csv file

		Column A
			~no title~
			iteration of model fit number 1:X, where X = number of models * iterations of fit
			Notes: each of the five models is fit 7000, resulting in 35000 values 
		Column B
			protein
			Options [DBH, NET]
		Column C
			layer
			Options: [I, II, III, IVa, IVb, IVc, V, VI]
		Column D
			value
			Notes: positive beta values should be populated in output file 

Figure_7: code that plots the distribution of section-specific posterior alpha values for each tissue section used in V1 analysis in order to assess individual differences. Each 	column of output plot represents data from a different animal.
	
	readalphas: reads in V1alphas.csv, formatted as V1alphas_template.csv,, also accepts .csv sorted by section
	
	plotalphas: calls function violinplot to plot posterior distribution of V1 alphas. 

	V1alphas_template: data file should resemble this V1betas_template.csv file

	Column A
		~no title~
		iteration of model fit number 1:X, where X = number of models * iterations of fit
		Notes: each of the five models is fit 7000, resulting in 35000 values 
	Column B
		section
		Options [unique string representing each section from which tissue images can be acquired]
	Column C
		value
		Options: posterior alpha values populated in output file 
	Column D
		sample
		Notes: [unique string identifier for image data taken from each section] 

Figure_8: code that plots the distribution of layer-specific posterior beta values of NET+ axon density for V1 and V2. both posterior distributions are plotted within each layer's column in the figure. 
	
	readV1V2betas: reads in V1V2betas.csv, formatted as V1V2betas_template.csv
	
	plotV1V2betas: calls function violinplot to plot posterior distribution of V1 and V2 betas. 

	V1V2betas_template: data file should resemble this V1V2betas_template.csv file

		Column A
			~no title~
			iteration of model fit number 1:X, where X = number of models * iterations of fit
			Notes: each of the five models is fit 7000, resulting in 35000 values 
		Column B
			area
			Options [V1, V2]
		Column C
			protein
			Options: [NET]
		Column D
			layer 
			Options: [ I, II, III, IV, V, VI]
		Column E 
			value
			Notes: positive beta values should be populated in output file 

