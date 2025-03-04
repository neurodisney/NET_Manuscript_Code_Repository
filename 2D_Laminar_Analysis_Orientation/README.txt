README

2D_Laminar_Analysis_Orientation
Updated: 03/04/25

Dependencies 
	requires custom scripts readV1Angles.m & readV2Angles.m 
	requires circular statistics toolbox in MATLAB
	Berens, P. (2009). CircStat: A MATLAB Toolbox for Circular Statistics. 
	Journal of Statistical Software, 31(10), 1–21. https://doi.org/10.18637/jss.v031.i10
	https://www.mathworks.com/matlabcentral/fileexchange/10676-circular-statistics-toolbox-directional-statistics

Overview: This collection of code takes the measured orientations of all counted axons and runs a Rayleigh Test. The Rayleigh test is a statistical test commonly used to assess whether a set of circular data (e.g., angles, directions) is uniformly distributed or whether it exhibits a preferred direction (i.e., is unimodal). 

Files

readV1Angles.m: code that reads the Microsoft excel sheet that stores V1 orientation data into MATLAB. 'V1_Orientation_Data_Template.xlsx' reflects the exact formatting that the code is designed to read in, each row represents the information for a single counted axon, and is formatted as...

	Column A: 
		Animal
		Options: [A7, A8, A9]
	Column B: 
		Section
		Options: positive number
	Column C: 
		Area
		Option: [V1]
	Column D: 
		Layer
		Options: [I, II, III, IVa, IVb, IVc, V, VI]
	Column E: 
		RawAngle
		Options: positive or negative number 
	Column F: 
		PiaCorrection
		Options: positive or negative number 
		Notes: correction value to make all angles relative to the pia surface
	Column G: 
		CorrectedAngle
		Options: autoformatted, positive or negative number
		Notes: measured angles relative to pia surface. 

readV2Angles.m: code that reads the Microsoft excel sheet that stores V2 orientation data into MATLAB. 'V2_Orientation_Data_Template.xlsx' reflects the exact formatting that the code is designed to read in, each row represents the information for a single counted axon, and is formatted as...

	Column A: 
		Animal
		Options: [A7, A8, A9]
	Column B:
		Section
		Options: positive number
	Column C:
		Area
		Option: [V2]
	Column D:
		Layer
		Options: [1, 2, 3, 4, 5, 6]
	Column E:
		RawAngle
		Options: positive or negative number 
	Column F:
		PiaCorrection
		Options: positive or negative number 
		Notes: correction value to make all angles relative to the pia surface
	Column G:
		CorrectedAngle
		Options: autoformatted, positive or negative number
		Notes: measured angles relative to pia surface. 


Rayleigh_test_plotting: takes the measured orientations of all counted axons read into MATLAB by 'readV1angles.m' and 'readV2angles.m', runs a Rayleigh Test, and generates a polar plot of orientations. The Rayleigh test is a statistical test commonly used to assess whether a set of circular data (e.g., angles, directions) is uniformly distributed or whether it exhibits a preferred direction (i.e., is unimodal). 



