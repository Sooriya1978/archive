# -*- coding: utf-8 -*-
"""
Created on Tue May 14 18:27:14 2013

@author: thiago
"""

lista = [1,2,3,"banana"]
lista.append(4)
print lista
print lista.pop(1) # remove o valor do indice 1, e retorna valor
print lista
lista.remove("banana")
print lista
del(lista[0]) # nao retorna o valor removido
print lista