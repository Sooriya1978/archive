# -*- coding: utf-8 -*-
"""
Created on Sat May 11 00:21:56 2013

@author: thiago
"""

def distance_from_zero(a):
    tipo = type(a)
    if tipo == int or tipo==float:
        return abs(a)
    else:
        return "Not an integer or float!"

#print distance_from_zero(7)
###########################################################
import math
def area_of_circle(radius):
    return (radius**2)*math.pi
###########################################################
lista = [2,3,4,5,"thiago"] 
print lista[1] + lista[3] 

lista_vazia = []
lista_vazia.append("maria")
lista_vazia.append("joao")
print lista_vazia 
print "Tamanho da lista: " + str(len(lista_vazia))
# ou
print "a lista tem %s itens " %len(lista_vazia)
# ou ainda
print "a lista tem %s itens, sendo %s e %s" %(len(lista_vazia),lista_vazia[0],lista_vazia[1]) 
######################################################
lista_slice = ["a","b","c","d","e","f"]
print lista_slice[2:4] # acaba antes da posicao 4
###############################################################
# uma string eh uma lsita de caracteres
animals = "catdogfrog"
cat = animals[:3]   
dog = animals[3:6]    
frog = animals[6:] 
######################################################################
# procura termo na lista : index
lista = ["a","b","c","d","e","f"]
print lista.index("c") # mostra posicao do intem an lista
#inseri novo item e desloca a posicao dos subsequentes
lista.insert(0,"Novo primeiro item")
for item in lista:
    print item 

print "########################################################"
start_list = [5, 3, 1, 2, 4]
square_list = []

# Your code here!
for n in start_list:
    square_list.append(n**2)
square_list.sort()
print square_list
print "####Na lista os indices sao numeros sequenciais, no dic nao!###########"
dicionario = {'key1':2,'key2':56}
print dicionario['key1'] + dicionario['key2']

dic_vazio = {}
dic_vazio['chave1'] =  45
lista1 = [2,3,4,6]
lista1.remove(6) # remove baseado no valor
del lista1[0] # remove baseado no indice
dic_vazio['lista1'] = lista1 # podemos adiconar lista nos dicionario
print dic_vazio
del dic_vazio['lista1'] 
print dic_vazio
a = [1,2,{'teste':'valor'}]
print a[2]['teste']
#############################################################
dic = {'item1':'thiago','item2':'bruno','item3':'vanessa'}
for i in dic:
    print dic[i]
##############################################
a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
for number in a:
    if (number % 2) == 0:
        print number
###############################################
# Write your function below!
def fizz_count(x):
    contador = 0
    for i in x:
        if i == 'fizz':
            contador += 1
    return contador    
print fizz_count(["fizz","buzz","fizz"])
###################################################
prices = {
    "banana": 4,
    "apple": 2,
    "orange": 1.5,
    "pear": 3
}
    
stock = {
    "banana": 6,
    "apple": 0,
    "orange": 32,
    "pear": 15
}
total = 0
for i in stock:
    total += stock[i]*prices[i]
print total
print '#########################'
groceries = ["banana", "orange", "apple"]

stock = { "banana": 6,
    "apple": 0,
    "orange": 32,
    "pear": 15
}
    
prices = { "banana": 4,
    "apple": 2,
    "orange": 1.5,
    "pear": 3
}

# Write your code below!
def compute_bill(food):
    total = 0
    for i in food:
        if stock[i] > 0 :
            total += prices[i]
            stock[i] -= 1
    return total
compute_bill(["banana"])
print stock
###################################
teste = {'alice'}




















