#Conception PLS input matrix


## Properties:
1. Name: XXX_BfMRIanalysis'
2. 


## Structure
* XXX_BfMRIanalysis
	* result_file: char (_BfMRIresult.mat)
	* group_files: char (_BfMRIsessiondata.mat)
	* pls: int 			% PLS Option (between 1 to 6, see PLS notes)
	* mean_type: int	% Mean-Centering Type (between 0 to 3)
	* cormode: int		% Correlation Mode (can be 0,2,4,6)
	* num_perm: int		% Number of Permutation
	* num_split: int	% Natasha Perm Split Half
	* num_boot: int		% Number of Bootstrap
	* boot_type: char (strat)		% Either strat or nonstrat bootstrap type
	* clim: int		% Confidence Level for Behavior PLS
	* save_data: int		% Set to 1 to save stacked datamat
	* selected_cond: int array
	* behavior_data: float array