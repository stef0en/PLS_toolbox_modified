## Read-in batch PLS fMRI analysis from MAT-file
[PLS toolbox](https://www.rotman-baycrest.on.ca/index.php?section=84) has the ability to start batch analysis from text-files. This has been proven unhandy when, for example large behavoiral data, made the text file grew very large.

Therefore we changed the code of 2 functions (**batch\_pls\_analysis.m** and **batch\_plsgui.m**) within the PLS toolbox to allow reading MATLAB structures. Those structures can be filled easily and dynamically with content of any size and kind.

To run an analysis from MAT-file:

1. copy **batch\_pls\_analysis.m** and **batch\_plsgui.m** into PLS/plsgui directory.
2. create a MATLAB file (e.g. PLS\_Bfmri\_analysis.mat) containing a stucture called **batch\_file**
	 * Use the templates in this directory to see which variables need to be included 
	 
3. Fill the MAT-file with your data.
4. Start the analysis in MATLAB with: _batch\_plsgui('nameOfYourMATfile.mat')_

For developmental information see:

https://github.com/stef0en/PLS_toolbox_modified/tree/master/batch_matrix_input

https://gitlab.mpib-berlin.mpg.de/wiegert/PLS_toolbox_modifications/tree/master/batch_matrix_input


# Structure of PLS input matrix


1. Properties:
	* Name: XXX_BfMRIanalysis.mat
	* Class: Structure 


2. Structure of _XXX\_BfMRIanalysis.mat_
	* contains a structure **batch\_file**
		* is\_analyis: binary **true if analysis, false if datamat creation**
		* result\_file: char **XXX\_BfMRIresult.mat or XXX\_MODELresult.mat**
			> Note: 
			> Result file must be listed first, and must follow the file
			> name format of xxxx_yyyyresult.mat, where xxxx stands for
			> "any result file name prefix" and yyyy stands for the name
			> of PLS module (either PET ERP fMRI BfMRI STRUCT or SmallFC).
			> File name is case sensitive on Unix or Linux computers.
		 
		* group_files: cell **must be in the form XXX\_BfMRIsessiondata.mat; 1xn cell, n=groups, groups=1xm cell, m=subjects**
		* method: int 			**PLS Option (between 1 to 6, see PLS notes)**
			> Notes:
			> 1. Mean-Centering PLS
			> 2. Non-Rotated Task PLS (please also fill out contrast data)
			> 3. Regular Behav PLS (please also fill out behavior data & name)
			> 4. Multiblock PLS (please also fill out behavior data & name)
			> 5. Non-Rotated Behav PLS (please also fill out contrast data and
			> behavior data & name)
			> 6. Non-Rotated Multiblock PLS (please also fill out contrast data and
			> behavior data & name)
			
		* mean_type: int	**Mean-Centering Type (between 0 to 3)**
			> Mean-Centering Type:
			> * 0.Remove group condition means from conditon means within each group
			> * 1.Remove grand condition means from each group condition mean
			> * 2.Remove grand mean over all subjects and conditions
			> * 3.Remove all main effects by subtracting condition and group means
			
		* cormode: int		**Correlation Mode (can be 0,2,4,6)**
			> Correlation Mode:
			> * 0.Pearson correlation
			> * 2.covaraince
			> * 4.cosine angle
			> * 6.dot product
			
		* num\_perm: int		**Number of Permutation; default 95**
		* num\_split: int	**Natasha Perm Split Half**
		* num\_boot: int		**Number of Bootstrap**
		* boot\_type: char (strat)		**Either strat or nonstrat bootstrap type**
		* nonrotated\_boot: int **??**
		* clim: int		**Confidence Level for Behavior PLS**
		* save\_data: int		**Set to 1 to save stacked datamat**
		* selected\_cond: int array
			> Notes: If you don't need to deselect conditions, just leave
			> "selected\_cond" and "selected_bcond" empty.
			
			> First put k number of 1 after "selected_cond" keyword, where k is the
			> number of conditions in sessiondata file. Then, replace with 0 for
			> those conditions that you would like to deselect for any case except
			> behavior block of multiblock PLS. e.g. If you have 3 conditions in
			> sessiondata file, and you would like to deselect the 2nd condition,
			> then you should enter 1 0 1 after selected_cond.
			
		* selected\_bcond: int	**??**
		* behaviordata: matrix	**Contains data from behavioral conditions; ROWs = data, COLs = subjects**
		* behaviorname: cell	**Contains names of behavioral conditions**
		
		* is\_struct: int	**??**
		* intel\_system: int **??**
		
		* contrasts: array **??**
	
## Tamplates
Not all of the aforementioned variables need to be included. Use the template as reference which variables have to be included in the MAT-file. There are 3 templates in the repository for:

1. Behavioral PLS
2. Task PLS
3. Task PLS with different Contrasts