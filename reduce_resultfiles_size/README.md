## Reduce result file size for behavioral PLS
[PLS toolbox](https://www.rotman-baycrest.on.ca/index.php?section=84)

The results of PLS analyses containing very large behavioral data can easily exceed several GB and possibly reach the max. memory capacity of local computers. Therefore we reduced the result structure, produced by **fmri\_pls\_analysis.m**, to the first 10 LVs. This will keep the significant information but trimming the file size dramatically.

**Just works with PLS containing behavioral data.**

# Altered functions
1. **batch\_pls\_gui.m**
	* evaluates an option variable in the input file (for more information see: batch_matrix_input; same repository). The variables __smallResult__ determines if the result file size has to be reduced.
	
2. **fmri\_pls\_analysis.m**
	* determin if PLS is a behavior PLS.
	* delete data related to all LVs above LV 10 from result structure
	* if less than 10 LVs, keep all data.
	
# Procedure

To upgrade you PLS toolbox:

* copy **batch\_pls\_gui.m** and **fmri\_pls\_analysis.m** into __PLS/plsgui/__
* __batch\_matrix\_input__ code is already included in **fmri\_pls\_analysis.m**

For developmental information see:

https://github.com/stef0en/PLS_toolbox_modified/tree/master/reduce_resultfiles_size

https://gitlab.mpib-berlin.mpg.de/wiegert/PLS_toolbox_modifications/tree/master/reduce_resultfiles_size



