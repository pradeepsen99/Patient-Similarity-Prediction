#Imports
import torch
import torch.nn.functional as F
import gdown
import pandas as pd
from tabulate import tabulate
from torch.utils.data import Dataset
from torchvision import datasets
from torchvision.transforms import ToTensor
import matplotlib.pyplot as plt
from torch.utils.data import DataLoader
import torch.nn as nn
from tqdm import tqdm
import numpy as np

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
df = pd.read_csv('data.csv', low_memory=False) #read in csv file (~800mb)

#Sanity checks for pandas import + read_csv
#print(df.columns)
#print(sorted(df['ap_cidpri'].unique()))
#df.head()
#print(df['id_'].nunique())
#print(df['id_'].count())
#print(df['ap_coduni'].unique())
#print(df['ap_coduni'].count())

#Filtering out for specific values as outlined in Table 3
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

tensor_cidpri = torch.tensor(cidpri_list)
cidpri_one_hot = F.one_hot(tensor_cidpri)

#Drop cidpri column since we are now done with it
df_input_features = df_input_features.drop(['ap_cidpri'], axis=1)

#Dataloader calss
class NephrologyDataset(Dataset):
  def __init__(self, input_features, categorical_features):
    x = input_features.values
    y = categorical_features
    print(y)

    self.x_train = torch.tensor(x, device=device)
    self.y_train = y.to(device)#torch.tensor(y, device=device)

  def __len__(self):
    return len(self.y_train)
  
  def __getitem__(self, idx):
    return self.x_train[idx], self.y_train[idx]

#Dataloader initialization
dataloader = NephrologyDataset(df_input_features[:3190570], cidpri_one_hot[:3190570])
train_loader = DataLoader(dataloader,batch_size=10,shuffle=True)

print(len(cidpri_one_hot))

#CNN_Softmax model definition
class CNN_Softmax(torch.nn.Module):
    def __init__(self):
        super().__init__()
        self.conv_a = torch.nn.Conv1d(in_channels=10, 
                                      out_channels=20, 
                                      kernel_size=1,
                                      stride=1)
        self.conv_b = torch.nn.Conv1d(in_channels=20, 
                                      out_channels=10, 
                                      kernel_size=1,
                                      stride=1)
        self.maxpool_a = torch.nn.MaxPool1d(kernel_size=1,
                                            stride=1)
        self.maxpool_b = torch.nn.MaxPool1d(kernel_size=1,
                                            stride=1)
        self.fc = torch.nn.Linear(in_features=10, 
                                  out_features=10)

    def forward(self, x):
        x = self.conv_a(x)
        x = F.relu(x)
        x = self.maxpool_a(x)
        #print(x.shape)
        #print('Finished first conv')
        x = self.conv_b(x)
        x = F.relu(x)
        x = self.maxpool_b(x)
        #print(x.shape)
        #print('Finished second conv')
        x = self.fc(x)
        x = F.relu(x)
        #print(x.shape)
        return x

#Train
import torch.optim as optim

print(device)
net = CNN_Softmax().to(device)
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(net.parameters(), lr=0.001)


loss_values = []
for epoch in tqdm(range(20)):  # loop over the dataset multiple times

    running_loss = []
    for i, data in enumerate(train_loader, 0):
        # get the inputs; data is a list of [inputs, labels]
        inputs, labels = data
        inputs = inputs.float()
        labels = labels.float()

        # zero the parameter gradients
        optimizer.zero_grad()

        # forward + backward + optimize
        #print(inputs.shape)
        outputs = net(inputs)
        loss = criterion(outputs, 
                         labels)
        loss.backward()
        optimizer.step()

        # print statistics
        running_loss.append(loss.item())
        #if i % 2000 == 1999:    # print every 2000 mini-batches
        #    print(f'[{epoch + 1}, {i + 1:5d}] loss: {running_loss / 2000:.3f}')
        #    running_loss = 0.0

    loss_values.append(np.mean(running_loss))


print('Finished Training')
print(loss_values)

#Graphs + Analysis
plt.plot(np.squeeze(loss_values[1:]))