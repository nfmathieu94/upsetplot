import pandas as pd
import glob 
import os


folder_path = '../data/csv_mPing/'
file_list = glob.glob(folder_path + "*.csv")
file_list

keys = [] #RIL names
values = [] #mPing locations
for file in file_list:
    table = pd.read_csv(file)
    name = os.path.basename(file)
    keys.append(name)
    value = (table['RIL_Start'])
    values.append(value)


# assigning values to keys     
dictionary = {}
for i in range(len(keys)):
    dictionary[keys[i]] = values[i]
    

    
df = pd.DataFrame.from_dict(dictionary, orient ='index')    

final_df = df.T
print(final_df)

final_df.to_csv('../data/upset_input/upset_df.csv', index=False)
