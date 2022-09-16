#!/usr/bin/env python
# coding: utf-8

# In[2]:


get_ipython().system('pip install tensorflow')


# In[13]:


get_ipython().system('pip install keras')


# In[15]:


import numpy as np
from matplotlib import pyplot as plt
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import pandas as pd
from sklearn.datasets import make_moons
from keras.models import Sequential
from keras.layers import Dense
from keras.callbacks import EarlyStopping
from keras.callbacks import ModelCheckpoint
from matplotlib import pyplot
from keras.models import load_model
from matplotlib import pyplot
from pandas import DataFrame
from keras.layers import Dropout


# In[5]:


url1 = 'https://raw.githubusercontent.com/alfie-agustin/Sistemas-inteligencia-artificial/main/sponge.data'


# In[6]:


import pandas as pd


# In[7]:


df = pd.read_csv(url1, delimiter=',', engine= 'python', header= None)


# In[8]:


df.rename(columns={df.columns[39]: 'Color', df.columns[44]: 'AlojaCAngrejo'})


# In[9]:


def Encoder(df):
          from sklearn import preprocessing
          le = preprocessing.LabelEncoder()
          columnsToEncode = list(df.select_dtypes(include=['category','object']))
          #le = LabelEncoder()
          for feature in columnsToEncode:
              try:
                  df[feature] = le.fit_transform(df[feature])
              except:
                  print('Error encoding '+feature)
          return df


# In[10]:


df = Encoder(df)


# In[ ]:


#train test split


# In[11]:


from sklearn.model_selection import train_test_split

x1 = df.drop(columns = [44]).copy()
y1 = df[44]

x_train1, x_test1, y_train1, y_test1 = train_test_split(x1,y1, test_size=0.20 )


print(x_train1.shape), print(y_train1.shape)
print(x_test1.shape), print(y_test1.shape)


# In[ ]:


#modelo de reed neuronal


# In[16]:


modelo = keras.Sequential()
modelo.add(Dense( units = 45, input_shape = [45], activation='relu'))
modelo.add(Dense(1, activation='sigmoid'))


# In[17]:


modelo.compile(
    optimizer = keras.optimizers.Adam(0.0001),
    loss = 'binary_crossentropy',
    metrics =['accuracy']
)


# In[18]:


print('Cominenzo entrenamiento')


historial = modelo.fit(x_train1, y_train1, epochs =10000, verbose = False)


print("Modelo entrenado")


# In[19]:


import matplotlib.pyplot as plt

plt.xlabel("epochs")
plt.ylabel("magnitud perdida")
plt.plot(historial.history["loss"])


# In[20]:


pred = modelo.predict(x_test1)


# In[22]:


modelo.evaluate(x_test1, y_test1)


# In[ ]:


#optimizacion


# In[23]:


epochs = [1000, 2000, 2500, 3000, 3500]
batchsize = [20, 30 , 40, 50, 60]


# In[24]:


parameter_grid = dict(batch_size = batchsize, epochs = epochs)


# In[25]:


from sklearn.model_selection import GridSearchCV


# In[27]:


get_ipython().system('pip install scikeras')


# In[28]:


from scikeras.wrappers import KerasClassifier


# In[29]:


Kmodel = KerasClassifier(build_fn=modelo, verbose=1)
grid = GridSearchCV(estimator=Kmodel, param_grid=parameter_grid, scoring='accuracy', n_jobs=-1, refit='boolean')
grid_result = grid.fit(x_train1, y_train1)


# In[30]:


print(grid_result.best_params_)


# In[ ]:


#red optimizada


# In[34]:


print("Comienzo entrenamiento")

historial = modelo.fit(x_train1, y_train1, epochs =1000,batch_size = 20, verbose = False)

print("Final entrenamiento")


# In[35]:


pred = modelo.predict(x_test1)


# In[38]:


modelo.evaluate(x_test1, y_test1)

