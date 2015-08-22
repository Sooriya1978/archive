import csv
import datetime

# Le arquivo dados do arquivo em linhas
vetor_linha = []
vetor_todos_horarios = []
vetor_data = []
vetor_data_completa = []
falta01 = []
falta02 = []
falta03 = []
falta04 = []
falta_mais_q_5 = []

arquivo1 = 'Galeao_Python.csv'
with open(arquivo1,'r') as linhas:
    linhascsv = csv.reader(linhas)
    for linha in linhascsv:
        vetor_linha.append(linha)

arquivo2 = 'todos_horarios.csv'
with open(arquivo2,'r') as datahora:
    datahoracsv = csv.reader(datahora)
    for dh in datahoracsv:
        vetor_todos_horarios.append(dh)

for i in range (1, len(vetor_linha)):
    data = vetor_linha[i][0]
    data = datetime.datetime.strptime(data, '%m/%d/%Y %H:%M:%S')
    vetor_data.append(data)

for i in range (1, len(vetor_todos_horarios)):
    datah = vetor_todos_horarios[i][0]
    datah = datetime.datetime.strptime(datah, '%m/%d/%Y %H:%M:%S')
    vetor_data_completa.append(datah)














#uma_hora = datetime.timedelta(hours = 1)
#
#for i in range(0,len(vetor_data) - 1):
#
## lista contendo faltas de UMA HORA depois da data fixada
#    if vetor_data[i + 1] - vetor_data[i] == uma_hora*2:
#        falta01.append(vetor_data[i])
#
## lista contendo faltas de DUAS HORAS depois da data fixada
#    elif vetor_data[i + 1] - vetor_data[i] == uma_hora*3:
#        falta02.append(vetor_data[i])
#
## lista contendo faltas de TRES HORAS depois da data fixada
#    elif vetor_data[i + 1] - vetor_data[i] == uma_hora*4:
#        falta03.append(vetor_data[i])
#
## lista contendo faltas de QUATRO HORAS depois da data fixada
#    elif vetor_data[i + 1] - vetor_data[i] == uma_hora*5:
#        falta04.append(vetor_data[i])
#
## lista contendo mais que CINCO HORAS faltando depois da data fixada
#    elif vetor_data[i + 1] - vetor_data[i] > uma_hora*5:
#        falta_mais_q_5.append(vetor_data[i])
#
#file = open('falt01.txt','w')
#for i in range (0,len(falta01)):
#    file.write(str(falta01[i]) + ',')
#file.close()
#
#file = open('falt02.txt','w')
#for i in range (0,len(falta02)):
#    file.write(str(falta02[i]) + ',')
#file.close()
#
#file = open('falt03.txt','w')
#for i in range (0,len(falta03)):
#    file.write(str(falta03[i]) + ',')
#file.close()
#
#file = open('falt04.txt','w')
#for i in range (0,len(falta04)):
#    file.write(str(falta04[i]) + ',')
#file.close()
#
#file = open('falta_mais_q_5.txt','w')
#for i in range (0,len(falta_mais_q_5)):
#    file.write(str(falta_mais_q_5[i]) + ',')
#file.close()
#
#print len(vetor_data)
#print len(falta01)+len(falta02)+len(falta03)+len(falta04)+len(falta_mais_q_5)
#print len(vetor_data)-(len(falta01)+len(falta02)+len(falta03)+len(falta04)+len(falta_mais_q_5))
#print len(falta01),
#print len(falta02),
#print len(falta03),
#print len(falta04),
#print len(falta_mais_q_5)