# Progress output
Very large fMRI analyses can run several days. To estimate time of completion we implemented an textfile output with details about progress as well as the total calulation time in the end.

This repository contains **pls\_analysis.m** which has to be repleced with the corresponding file in __PLS/plscmd/__

1. Textfile output
 * For each analysis an unique textfile will be created
 * File contains timestamps for starting of analysis, each bootstep and permutation iteration, end of result saving process.
 * Total running time
 
2. Output to standard output
* The total calculation time will writte to the standard output after completion. (Will appear in log files.)


https://github.com/stef0en/PLS_toolbox_modified/tree/master/progress_output

https://gitlab.mpib-berlin.mpg.de/wiegert/PLS_toolbox_modifications/tree/master/progress_output



