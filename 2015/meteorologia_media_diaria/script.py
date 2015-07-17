# -*- coding: utf-8 -*-
"""
Created on Wed Jul 15 23:49:34 2015

@author: thiago
"""
import csv
#from datetime import datetime 
import datetime 

# Lê arquivo dados do arquivo em matriz
matriz = []
arquivo = 'test2.csv'
with open(arquivo,'r') as linhas:
    linhascsv = csv.reader(linhas)
    for linha in linhascsv:
        matriz.append(linha)

# Convertendo todas datas em datas-python
#print matriz[1][0]

for i in range(1,len(matriz)):
    matriz[i][0] = datetime.datetime.strptime(matriz[i][0],"%d/%m/%Y %H:%M:%S")

dia = 2
mes = 1
ano = 2007
horas = range(0,24)

este_dia = list()
for i in range(1,len(matriz)):
    x = matriz[i][0]
    if (x.day == dia) and (x.month == mes) and (x.year == ano):
        este_dia.append(x.hour)

horas_faltantes = set(horas) - set(este_dia)
print horas_faltantes

datetime.datetime.strptime(matriz[i][0],"%d/%m/%Y %H:%M:%S")
matriz.append(['colocar data','calcular media'])

print matriz

# Verifica dias se tem 24 medias para o dia.
#total = 0
#for i in range(1,len(matriz)):
#    x = matriz[i][0]
#    if (x.day == dia) and (x.month == mes) and (x.year == ano):
#        total = total + 1

#print total

#print time.strptime(matriz[1][0], "%d/%m/%Y %H:%M:%S")
#print time.strptime(matriz[2][0], "%d/%m/%Y %H:%M:%S")

#print datetime.datetime.fromtimestamp(matriz[1][0])


#hoje = datetime.date.today()
#print hoje
#print hoje.day
#print hoje.month
#print hoje.year
#print hoje.weekday() # 0-segunda-feira e 6 domingo

#toordinal: quantidade de dias desde 1/1/1
#print hoje.toordinal()
#hojeordinal =  hoje.toordinal()

# Converte o ordinal novamente para data
#print datetime.date.fromordinal(hojeordinal)

#Diferença:
#(ano,mes,dia,hora,minuto,segundo,microsegundo,tzinfo)
#data1 = datetime.datetime(2010,01,01,00,00,00)
#data2 = datetime.datetime(2010,01,02,00,00,00)
#print data2 - data1

# Cria lista com as datas
#step = datetime.timedelta(hours=6)

#result = []

#while data1 < data2:
    #result.append(data1.strftime('%Y-%m-%d %H:%M:%S'))
#    result.append(data1)
#    data1 += step

#print result

#for i in result:
#    print i.hour
#    print i.isoformat()
#    print i.strftime('%Y-%m-%d %H:%M:%S')
#    print i.strftime('%A %B %d, %Y') 
    



        
#print dados[3][0]

#      http://www.gregreda.com/2013/10/26/working-with-pandas-dataframes/
#      http://synesthesiam.com/posts/an-introduction-to-pandas.html
#      http://www.gregreda.com/2013/10/26/intro-to-pandas-data-structures/
#     https://spectraldifferences.wordpress.com/2014/04/08/import-csv-into-python-using-pandas/

########    
#import pandas
#print pandas.read.csv(arquivo)
#times = pd.date_range('2012-10-01', periods=289, freq='5min')
