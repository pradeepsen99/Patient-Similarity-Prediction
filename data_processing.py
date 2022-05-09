import pandas as pd
from tabulate import tabulate

df = pd.read_csv('data.csv', low_memory=False) #read in csv file (~800mb)

#Sanity checks for pandas import + read_csv
#print(df.columns)
#print(sorted(df['ap_cidpri'].unique()))
#df.head()
#print(df['id_'].nunique())
#print(df['id_'].count())
#print(df['ap_coduni'].unique())
#print(df['ap_coduni'].count())

kidney_codes = ['E10 ', 'E14 ', 'I10 ', 'I120', 'N039', 'N088', 'N083', 'N180', 'N188', 'N189']
df = df.loc[df['ap_cidpri'].isin(kidney_codes)]

#Filtering out columns to match input features
#Features: an_hcv, an_hiv, an_hbsag, ap_nuidade, ap_coduni, owner_id, ap_pripal, ap_motsai, estado, an_tru, an_intfis, vol
column_features = ['an_hcv', 'an_hiv', 'an_hbsag', 'ap_nuidade', 'ap_coduni', 'ap_pripal', 'ap_motsai', 'estado', 'an_tru', 'an_intfis', 'ap_cidpri']
df_input_features = df.filter(items=column_features)
print(tabulate(df_input_features.head(), headers = 'keys', tablefmt = 'psql'))

#Converting ap_coduni values into int via dict
coduni_dict = {}
unique_coduni = df_input_features['ap_coduni'].unique()
for i in range(0, len(unique_coduni)):
  coduni_dict[unique_coduni[i]] = i
df_input_features = df_input_features.replace({'ap_coduni': coduni_dict})
print(tabulate(df_input_features.head(), headers = 'keys', tablefmt = 'psql'))

#Converting an_hcv, an_hiv, an_hbsag to int values from dict
yes_no_dict = {'N': 0, "P": 1}
df_input_features = df_input_features.replace({'an_hcv': yes_no_dict, 'an_hiv': yes_no_dict, 'an_hbsag': yes_no_dict})
print(tabulate(df_input_features.head(), headers = 'keys', tablefmt = 'psql'))

#Converting estado to int values from dict
estado_dict = {}
unique_estado = df_input_features['estado'].unique()
for i in range(0, len(unique_estado)):
  estado_dict[unique_estado[i]] = i
df_input_features = df_input_features.replace({'estado': estado_dict})
print(tabulate(df_input_features.head(), headers = 'keys', tablefmt = 'psql'))

#Converting an_tru to int values from dict 
df_input_features['an_tru'] = df_input_features['an_tru'].str.strip()
df_input_features['an_tru'] = df_input_features['an_tru'].str.extract('(\d+)', expand=False)

#Converting an_intfis to int values from dict 

intfis_dict = {}
unique_intfis = df_input_features['an_intfis'].unique()
for i in range(0, len(unique_intfis)):
  intfis_dict[unique_intfis[i]] = i
df_input_features = df_input_features.replace({'an_intfis': intfis_dict})
print(tabulate(df_input_features.head(), headers = 'keys', tablefmt = 'psql'))

#Converting pandas object types into integer
df_input_features = df_input_features.dropna()
df_input_features['an_hcv'] = df_input_features['an_hcv'].astype('str').astype('float')
df_input_features['an_hiv'] = df_input_features['an_hiv'].astype('str').astype('float')
df_input_features['an_hbsag'] = df_input_features['an_hbsag'].astype('str').astype('float')
df_input_features['an_tru'] = df_input_features['an_tru'].astype('str').astype('float')
df_input_features['an_intfis'] = df_input_features['an_intfis'].astype('str').astype('float')

#Sanity checks post filtering
#display(df.groupby('ap_cidpri')['ap_cidpri'].transform('count'))
print(tabulate(df['ap_cidpri'].value_counts().to_frame(), headers = 'keys', tablefmt = 'psql'))
print(tabulate(df_input_features.head(), headers = 'keys', tablefmt = 'psql'))
print(df_input_features.dtypes)

#Converting categorical lables to one hot encoding
kidney_codes_dict = {'E10 ': 1, 'E14 ': 2, 'I10 ': 3, 'I120': 4, 'N039': 4, 'N088': 5, 'N083': 6, 'N180': 7, 'N188': 8, 'N189': 9}

cidpri_list = df_input_features['ap_cidpri'].tolist()
for i in range(0, len(cidpri_list)):
  cidpri_list[i] = kidney_codes_dict[cidpri_list[i]]


df_input_features.to_csv('data_processed.csv')

