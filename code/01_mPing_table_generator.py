#!/usr/bin/env python3
#This code takes multiple relocate2 output files and creates one data table with a common identifier RIL_Start
import pandas as pd
import glob 
import os 

#Reading in Data
''' My idea is to organize .bed files into specific directories so only
the folder_path needs to be specified (maybe as sys.argv[1] ??). Each directory 
would be something like A123, EG4, or RIL2_1to270 and these directories would contain
the .bed files from RelocaTE2.
'''
folder_path = "../data/RIL2_mPing/"

file_list = glob.glob(folder_path + "*.bed")


# combining data into one table
li = []
for file in file_list:
    frame = pd.read_table(file, skiprows=[0], names=['chr', 'start', 'end', 'name', 'score', 'strand'])
    frame['file'] = os.path.basename(file)
    li.append(frame)


# creating one table from list
df3 = pd.concat(li,axis=0)
df3 = df3.reset_index(drop=True)

# Combine chr and start column by '_' to make unique identifier

df3['Name_Start'] = df3['chr'].astype(str) +'_'+ df3['start'].astype(str)

# removing chr and start

df3.drop(['chr', 'start'], inplace=True, axis=1)

# changing column order

df3 = df3[['Name_Start','end', 'name', 'score', 'strand', 'file']]

# Saving to .csv file
# Would like to change this so the file name reflects the name chosen for file_path above
# wondering if we can do this by using sys.argv[1] as file name???
df3.to_csv('RIL2_1to8_mPing_data.csv', index=False)



