#!/usr/bin/env python
import pandas as pd
import glob 
import os


# grab files and rename
file_list = []
for file in glob.glob("*.csv"):
    file_list.append(file)
    
            
    
# creating two different lists    
RILnames = []
RILinsertions = []
for file in file_list:
    table = pd.read_csv(file)
    name = os.path.basename(file)
    RILnames.append(name)
    value = (table['RIL_Start'])
    RILinsertions.append(value)
RILnames = [sub.replace('_mPing.csv', '') for sub in RILnames]
    

# assigning values to keys creating dictionary     
RILdict = {}
for i in range(len(RILnames)):
    RILdict[RILnames[i]] = RILinsertions[i]
    

# creating data frame    
df = pd.DataFrame.from_dict(RILdict, orient ='index')    

# transposing data frame 
final_df = df.T

# visualizing and saving nonbinary dataframe to csv in 'Results' directory
final_df.to_csv('./Results/upset_df.csv', index=False)

# creating and saving binary matrix to csv in 'Results' directory (need to check if correct!)
melt_df = final_df.melt()
grouped_df = pd.DataFrame(melt_df.groupby(['variable', 'value'], as_index=False).size())
pivot_table = grouped_df.pivot(index='value', columns='variable', values='size').fillna(0)

display(pivot_table)
pivot_table.to_csv('./Results/upset_binary_df.csv', index=True)