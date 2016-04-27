## Read-in batch PLS struct datamat from MAT-file
[PLS toolbox](https://www.rotman-baycrest.on.ca/index.php?section=84) has the ability to create for the analysis necessary struct datamat files from text-files. To gain more control via scripting we altered the read in from text files to MATLAB files, containing all necessary information.

Therefore we changed the code of 2 functions (**batch\_create\_datamat.m** and **batch\_plsgui.m**) within the PLS toolbox to allow reading MATLAB structures.

To run struct datamat file creation from MAT-file:

1. copy **batch\_create\_datamat.m** and **batch\_plsgui.m** into PLS/plsgui directory.
2. create a MATLAB file (e.g. xxx\_Bfmri\_batchfile.mat) containing a stucture called **session\_file**
	 * Use the templates in this directory to see which variables need to be included 
	 
3. Fill the MAT-file with your data.
4. Start the analysis in MATLAB with: _batch\_plsgui('nameOfYourMATfile.mat')_

**JUST WORKS WITH FMRI!!! No ERP, PET, STRUCT...**


For more information see:

https://github.com/stef0en/PLS_toolbox_modified/tree/master/batch_subject_datamat_from_matrix

https://gitlab.mpib-berlin.mpg.de/wiegert/PLS_toolbox_modifications/tree/master/batch_subject_datamat_from_matrix


# Structure of PLS input matrix


1. Properties:
	* Name: XXX\_BfMRI\_batchfile.mat
	* Class: Structure 


2. Structure of _XXX\_BfMRI\_batchfile.mat_
	* contains a structure **session_file**
		* is\_analyis: binary **true if analysis, false if datamat creation**
		* prefix: char 	**prefix for session file and datamat file**
		 
		* brain_region: int 	**threshold or file name for brain region**
		* across_run: binary	**1 for merge data across all run, 0 for within each run**
		* single_subj: binary 	**1 for single subject analysis, 0 for normal analysis**
		
		* Condition Section:
			* cond_name: cell, char 	**condition names**
			* ref_scan_onset: int 	**reference scan onset for conditions**
			* num_ref_scan: int	**number of reference scan for conditions**
			
		*  Run Section:
			* data_files: cell,char 	**Path and full name of functional image. E.g different runs or conditions**
			* block_onsets: cell,int	**Starting volumes of different blocks. Each image has its own cell; Conditons in rows**
			* block_length: cell,int 	**Like block onsets**
	
	
## Tamplates
Use the template as reference for the MAT-file.

1. Task PLS with 2 runs and 3 conditions