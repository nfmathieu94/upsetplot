#!/usr/bin/env python
import pandas as pd
import numpy as np

#importing data frame
df = pd.read_csv('upset_df.csv')

#Creating list of dictionaries that have NaN removed 
listOfRILs = {df[column].name: [y for y in df[column] if not pd.isna(y)] for column in df}

#create new dictionary by comparing values between different key value pairs
mpinglocations = dict()
for RIL in listOfRILs:
    for loc in listOfRILs[RIL]:
        if loc not in mpinglocations:
            mpinglocations[loc] = {}
        mpinglocations[loc][RIL] = 1

RILnames = sorted(listOfRILs.keys())
print("\t".join(RILnames))
for loc in mpinglocations:
    row = []
    for RIL in RILnames:
        if RIL in mpinglocations[loc]:
            row.append("1")
        else:
            row.append("0")
            print("\t".join(row))

#Create dataframe from mpinglocation dictionary, replace NaN with 0, and transpose
df2 = pd.DataFrame.from_dict(mpinglocations, orient = 'index')
df2 = df2.fillna(0)
df2 = df2.rename_axis('Location')
print(df2)
#Export dataframe to CSV
df2.to_csv('RIL2_1to8_binary.csv', '\t')
