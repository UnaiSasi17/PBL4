import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

x=pd.read_csv("/Users/gorkaetxebarriaatutxa/Documents/PBL4/Estadistica/Datos.csv",delimiter=';')
coefi=x['wasted'].corr(x['incomes'],method='pearson')
print(coefi)

