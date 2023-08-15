# Taking RelocaTE2 results and generating an Upset Plot to visualize mPing differences

## Data
`Nonredundant_results` directory contains the nonredundant output data from RelocaTE2. The data was copied 
from the `mcclintock_relocate_results` directory. The nonredundant results are organized into different directories, 
so `A123_mPing` contains only the A123.bed file, the `RIL2_mPing` directory contains the first 8 RIL bed files, etc. 

Directly inside the `data` directory has the nonredundant results that have been converted to .csv files.
The file `RIL2_1-8_mPing.csv` was created by using a script to read in the separate files (`RIL2-1_mPing.csv`,
`RIL2-2_mPing.csv`, etc)

## Code
There are 4 different scripts used to create the upset plot


