# Read me
This repository contains customizations of the **PLS toolbox**. The demand to compute high resolution fMRI images with very large matricies of behavioral data made some adjustments to the toolbox necessary. E.g. can grow a result file easily above 30GB of size, making the visualization on desktop machines difficult.

Focus was set on **Blocked fMRI** analyses. Some function might also work with other analyses like **E.R. fMRI**, **Strucktur**, **ERP** or **PET**. Only **Blocked fMRI** optinon has been tested. 

All original scipts can be found at:
[PLS toolbox](https://www.rotman-baycrest.on.ca/index.php?section=84)

Different and inidpendent modifications are stored in subdirectories:

* DIRECTORY: __batch\_matrix_input__
	* optimized for very large data input
	
* DIRECTORY: __pls\_splithalf\_progress__
	* progress output of parallel split half calculations
	
* DIRECTORY: __progress\_output___
	* detailed progress output as text-file

* DIRECTORY: __reduce\_resultfiles_size__
	* optional reduced result file size
	* must be used with __batch\_matrix_input__
	

For more details see READMEs in particular direcotries.


__Repository only contains modified code, to run PLS toolbox please download it [here](http://pls.rotman-baycrest.on.ca/source/Pls.zip) and replace the necessary files__


For developmental information see:

https://github.com/stef0en/PLS_toolbox_modified

https://gitlab.mpib-berlin.mpg.de/wiegert/PLS_toolbox_modifications


