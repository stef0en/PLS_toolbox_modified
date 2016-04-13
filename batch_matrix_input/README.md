#Conception of PLS input matrix


1. Properties:
	* Name: XXX_BfMRIanalysis.mat
	* Class: Structure 


2. Structure of _XXX\_BfMRIanalysis.mat_
	* contains a structure **batch\_analysis**
		* is\_analyis: binary **true if analysis, false if datamat creation**
		* result\_file: char **XXX\_BfMRIresult.mat or XXX\_MODELresult.mat)**
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
		
		* contrast\_data: **??**
	
	