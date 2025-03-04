README

2D_Laminar_Analysis_Bayesian_Models
Updated: 3/4/25

Dependencies:
Rstudio
RSTAN

Overview: code used to carry out Bayesian analysis on 2D laminar data. 

Files 

Rstudio_Bayesian_Analysis.txt: This code runs in Rstudio; copy and paste code into new document file. This code reads in 2D laminar data, formatted as '2D_Laminar_Data_Template.csv' but saved as .csv, fits the data to each of  five Bayesian models (see below) and outputs posterior values for several parameters featured in the models. Inferences about the 'true' laminar densities were made by comparing the likelihood of each model. 

2D_Laminar_Analysis_Template.csv: 
	Column A: 
		Animal
		Options: [A7, A8, A9]
	Column B: 
		Section_Identifier
		Options: string, describing section number
	Column C: 
		Immunolabeled_Protein
		Option: [DBH, NET, 5HT]
	Column D: 
		Area
		Options: [V1, V2]
	Column E: 
		Layer
		Options: [I, II, III, IVa, IVb, IVc, IVc-alpha, IVc-beta, V, VI]
	Column F: 
		Count_Qr
		Options: zero or positive integer
		Notes: total number of intersections 
	Column G: 
		Qr_Double_Intersections
		Options: zero or positive integer 
		Notes: number of probes with two intersections, not used in published study
	Column H: 
		Qr_Triple_Intersections
		Options: zero or positive integer 
		Notes: number of probes with three intersections, not used in published study
	Column I: 
		Probe_Number_R
		Options: zero or positive integer 
		Notes: total number of probes in layer 
	Column J: 
		Length_Rlength
		Options: zero or positive integer 
		Notes: (px*um conversion factor used to calculate diameter of single probe) * number of probes, not used in published study
	Column K:
		Ratio_Qr_over_Rlength
		Options: autopopulated
		Notes: Column F/Column J, not used in published study

IMPORTANT: The content of these models are specific for hypothesis testing within the confines of this study. Minor modification to syntax can cause drastic change in output interpretability. The defined parameters interact with 'Rstudio_Bayesian_Analysis.txt', so these models must be assessable by Rstudio's working directory ('wd'). Brief descriptions of the model utility are included below, for more details see text. 

model_1.stan: a validation benchmark that asserts DBH+, NET+, and 5HT+ axons share the same laminar pattern. a priori predicted to be least likely. 

model_2.stan: a validation benchmark that asserts the laminar pattern of DBH+ axons is more similar to  5HT+ axons than NET+ axons. a priori predicted to be least likely. 

model_3.stan: model that asserts that DBH+ and NET+ axons share the same laminar pattern and are detected at the same rate (i.e. are the same thing counted twice). represents field assumption that the two proteins tightly colocalize.

model_4.stan: model that asserts that when adjusted for detection sensitivity, DBH+ and NET+ axons share the same laminar pattern, and both differ from 5HT+ neurons.

model_5.stan: model that asserts that the laminar densities of DBH+, NET+, and 5HT+ axons are all different. 

model_5_multi_area: a modified version of model 5 that tests if the laminar density of NET+ axons is the same between V1 and V2.
	Note: For implementation of this model in the code requires a change in output file name convention, output file name 'V1betas.csv' should be changed to 'V1V2betas'. 	Furthermore this model may require a separate 2D_Laminar_Analysis.csv that features both V1 and V2 data. 


Plotting_Bayesian_Model_Outputs: this directory contains all of the code built to plot on the output data from Rstudio_Bayesian_Analysis.txt. See relevant README files in subdirectories for code descriptions and usage notes. 


