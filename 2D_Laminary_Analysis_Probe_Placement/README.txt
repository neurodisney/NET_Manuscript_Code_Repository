README


2D_Probe_Placement
Updated: 2/28/25

--------------------
Dependencies 
Fiji, version 2.9.0
--------------------

--------------------
Files

IMAGEJ_Macro_Random_Location_Generator
Notes: ImageJ Macro saved as .txt file. Version used in the published manuscript. Randomly adds a predetermined number (~300) 20 px dots to the image, to which 20 um (with .05 um linethickness) sampling probes around in photoshop. 
can be added. For any given instance of two or more probes overlapping, a random generator is used to select one of the overlapping probes, the other probes are ignored. 

IMAGEJ_Macro_Place_Probes
Notes: ImageJ Macro saved as .txt file. Version not used in the published manuscript. Inputs pixel conversion factor, probe diamter, line thickness, and number of probes. Randomly places non-overlapping probes onto uploaded image 

--------------------

Usage Notes

1. Open Fiji:
Launch Fiji (make sure it's up-to-date for compatibility).

2. Open Your Image:
Go to File > Open... and select your .tif image.
Make sure the image is the one you want to analyze, and that it’s already calibrated or you know the pixel-to-micrometer conversion factor.

3. Set the Image Scale (Optional but Recommended):
If your image isn’t already scaled, go to:
Analyze > Set Scale...
Input the Known Distance (e.g., 10 µm) and the Pixel Distance (e.g., 20 pixels).

Set the Unit of Length to µm.
Click OK.
This step is optional because the macro uses a manually defined conversion factor, but setting the scale ensures that your measurements are accurate and consistent.

4. Open the Macro Editor:
Go to Plugins > New > Macro...
This will open the ImageJ Macro Editor window.

5. Copy and Paste the Code:
Copy the entire macro code and paste it into the Macro Editor.
Double-check that the pxToUm value is accurate for your image if you didn't set the scale.

6. Run the Macro:
Click Run (the triangle button at the top of the Macro Editor).
The macro will:
Prompt you for the probe diameter, line thickness, and number of probes.
Draw non-filled circles (sampling probes) on the image with the specified parameters.

7. Check the Results:
The probes will be drawn on the image as non-filled circles.
If they don’t look correct:
Double-check the pxToUm value.
Ensure your image is scaled properly (Step 3).

8. Save or Analyze the Image:
You can now save the image with the drawn probes:
File > Save As...
Or proceed with further analysis, such as measuring distances or counting probes.

Tips and Notes:
Setting the Scale First: If you set the scale in Analyze > Set Scale..., you don’t need to adjust pxToUm in the code, but it won't affect the macro since it's using its own conversion factor.
Consistent Units: Ensure you consistently use micrometers (µm) throughout for accurate results.
