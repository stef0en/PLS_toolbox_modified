#Progressbar for PLS splithalf option

PLS splithalf option can, under certain circumstances, take very long to complete. The **splithalf** option does not display any progress, so we implemented a custom progress monitor, downloadable from MATLAB webpage.

Parfor progress monitor was writte by Jeremy Scheff an can be used for any parallel loop in MATLAB. Download [here](http://www.mathworks.com/matlabcentral/fileexchange/32101-progress-monitor--progress-bar--that-works-with-parfor).

**This function works just for parallel settings.**

PLS function edited: **splithalf\_perm\_par.m**

1. Displays iteration n of total cycles (total = num splithalf*num permutations/2)
	* DIRECTORY: __modified\_disp\_iteration__
	* counts permutations and splithalf steps
	* While in __parfor__ iteration cound is not linearly ordered, this results in no very meaningfull progress information.
	
2. Adding parfor progress bar. 
	* DIRECTORY: __modified\_parforprocess__ and __modified\_parforprocess\_less\_output__
	* Progressbar function provides a detailed progress of parallel loops. Keep in mind: Updateing the interation frequently result in high output!
	* Parfor progress bar at permutation level: just permutations are counted. Reduces output to lesser updates.
	
3. Modified Parfor progress bar 
	* Progress bar creates a file for counting. If more than one analysis are started in same folder, the counting will be corrupted!!!
	* We modified progress bar code, so it will use an unique filename for each analysis.
	
Use **pls\_progrssbar\_** from this repository!
Replace **splithalf\_perm\_par.m** in PLS toolbox direcotry: __/PLS/plscmd/__


https://gitlab.mpib-berlin.mpg.de/wiegert/PLS_toolbox_modifications/tree/master/pls_splithalf_progress

https://github.com/stef0en/PLS_toolbox_modified/tree/master/pls_splithalf_progress

