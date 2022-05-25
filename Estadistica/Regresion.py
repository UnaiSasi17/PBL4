import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

def readData(property):
    x=pd.read_csv("/Users/gorkaetxebarriaatutxa/Documents/PBL4/Estadistica/Datos.csv",delimiter=';')
    return x[property]

def estimarValores(x, y):
	n = np.size(x)
	m_x = np.mean(x)
	m_y = np.mean(y)
	SS_xy = np.sum(y*x) - n*m_y*m_x
	SS_xx = np.sum(x*x) - n*m_x*m_x
	b_1 = SS_xy / SS_xx
	b_0 = m_y - b_1*m_x
	return (b_0, b_1)
def coeficienteCorrelacion():
    x=pd.read_csv("/Users/gorkaetxebarriaatutxa/Documents/PBL4/Estadistica/Datos.csv",delimiter=';')
    return x['incomes'].corr(x['wasted'], method='pearson')
    
def graficoregresion(x, y, b):   
	plt.scatter(x, y, color = "m",
			marker = "o", s = 30)
	y_pred = b[0] + b[1]*x
	plt.plot(x, y_pred, color = "g")
	plt.xlabel('Incomes')
	plt.ylabel('Wasted food')
	plt.show()
 
def predict(valor):
    x = readData("incomes")
    y = readData("wasted")
    b = estimarValores(x, y)
    y_pred = b[0] + b[1]*valor
    return y_pred

def grafico():
    x = readData("incomes")
    y = readData("wasted")
    b = estimarValores(x, y)
    print("Coeficientes estimados:\nb_0 = {} \
		\nb_1 = {}".format(b[0], b[1]))
    graficoregresion(x, y, b)
	
def menu():
    print('******************')
    print('*******MENU*******')
    print('******************')
    print('1) Predecir desperdicio')
    print('2) Correlacion lineal')
    print('3) Mostrar grafico')
    print('0) Para salir del menu')
    
def ejecutarOpcion():
   while True:
       menu()
       opcion=input('mete la Opcion:')
       if opcion=='1':
           income=float(input('Introduce un income:'))
           print(predict(income))
       elif opcion=='2':
           print(coeficienteCorrelacion())
       elif opcion=='3':
           grafico()
       elif opcion=='0':
          break;
           
def main():
    ejecutarOpcion()
    
    
main()

