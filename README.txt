README
Updated: 03/04/25
Created by: Corey Roach 

-------------------
GENERAL INFORMATION
-------------------

Title of Repository: NET_Manuscript_Code_Repository

Author Contact Information 

	Principal Investigator/Corresponding Author: Anita A. Disney
	Institution: Duke University
	Email:anita.disney@duke.edu
	ORCID: 0000-0003-3390-0681

	First Author: Corey Roach
	Institution: U. Pennsylvania
	Email: corey.roach@pennmedicine.upenn.edu
	Email: corey.roach@duke.edu

--------------------
 Repository OVERVIEW
--------------------

This repository contains data analysis and visualization code used in the study titled, "Release and reuptake sites for norepinephrine are differently distributed across layers of the primary visual cortex in macaque monkeys", which was submitted for peer review to the Journal of Comparative Neurology in February 2025. Each subdirectory in this repository contains code designed to carry out a different analysis in the study. Usage notes are detailed in respective README files. Following a 3D stereological analysis of NET+ axons in V1 and V2, a 2D Laminar Analysis was carried out that aimed to quantify the laminar density of NET+ and DBH+ axons in V1 and V2. To this end, 2D circular probes were randomly applied to images of immuno-labeled tissue, and axon-probe intersections and angles of incidence were recorded. 

2D_Laminar_Analysis_Bayesian_Models 
Notes: RStudio/RSTAN and MATLAB code that fits 2D Laminar data to Bayesian models that describe the relationship of immunolabeled axons across layers in V1.  

2D_Laminar_Analysis_Orientation
Notes: MATLAB code plots angles of incidence of counted probes and statistically evaluates circular uniformity. 

2D_Laminar_Analysis_Probe_Placement
Notes: Fiji macros that can be used to randomly place probes on images.  






