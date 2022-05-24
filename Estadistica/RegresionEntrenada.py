from asyncio.windows_events import NULL
from asyncore import read
from statistics import linear_regression, mode
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.linear_model import LinearRegression

def readData(property):
    x=pd.read_csv("/Users/gorkaetxebarriaatutxa/Documents/PBL4/Estadistica/Datos.csv",delimiter=';')
    return x[property]

def fitModel(mod,x,y):
    mod=LinearRegression()
    mod.fit(X=x,y=y)
    return mod

def predict(mod,x):
   return mod.predict(x)
    

def main():
    model=NULL
    x=readData('incomes')
    y=readData('wasted')
    
    model=fitModel(model,x,y)
    sns.scatterplot(x=x,y=y,data=pd.read_csv("/Users/gorkaetxebarriaatutxa/Documents/PBL4/Estadistica/Datos.csv",delimiter=';'))
    
    
    
   
    


    
    
    




