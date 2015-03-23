PLS analysis

splithalf option does not display any progress.
just for parallel function.

adding:

a) display iteration x of total (total = num splithalf*num permutations/2)
	- counts permutations and splithalf steps
	- as parfor is run iteration cound will not be ordered. No very meaningfull progress info
	
b) parfor profressbar. at same location as a)
	- provides detail progress of parallel loop. But a dense number of updates produces high output
	
c) parfor progressbar. at permutation level
	- just permutations are counted. Reduces output to lesser updates.
	
	!!! parfor progressbar creates a file for counting. If more than one analysis are started in same folder,
	the counting will be corrupted!!!


save at PLS toolbox: /PLS/plscmd