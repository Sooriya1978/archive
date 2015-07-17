# -*- coding: utf-8 -*-
"""
Created on Mon May 27 18:32:39 2013

@author: thiago
"""

lista = ['thiago','thais']
for item,valor in enumerate(lista):
    print item,valor
    
lista_a = [1,2,3,4]
lista_b = [11,12,13,14,15,16]
for a,b in zip(lista_a,lista_b):
    if a>b: 
        print a
    else:
        print b
print round(2.1)


def digit_sum(n):
    soma = 0
    for i in str(n):
        soma += int(i)
    return soma
print digit_sum(123), "\n\n"

def factorial(x):
    f = 1
    for i in range(1,x+1):
        f *= i
    return f
print factorial(4), "\n\n"

def is_prime(x):
    if x < 2:
        return False
    for i in range(2,x):
        if x%i == 0:
            return False
            break
    return True
print is_prime(8), "\n\n"

def reverse(text):
    final = len(text) - 1
    invertida = str()
    while final > -1:
        invertida += text[final]
        final -= 1
    return invertida
print reverse("thiago"), "\n\n"

def anti_vowel(text):
    new = str()
    vowels = ['a','e','i','o','u']
    for i in text:
        teste_i = 0
        for j in vowels:
            if j == i.lower():
                teste_i = 1
        if teste_i == 0:
            new += i
    return new
print anti_vowel("thiago !"), "\n\n"

def scrabble_score(word):
    score = {"a": 1, "c": 3, "b": 3, "e": 1, "d": 2, "g": 2, 
         "f": 4, "i": 1, "h": 4, "k": 5, "j": 8, "m": 3, 
         "l": 1, "o": 1, "n": 1, "q": 10, "p": 3, "s": 1, 
         "r": 1, "u": 1, "t": 1, "w": 4, "v": 4, "y": 4, 
         "x": 8, "z": 10}
    soma = 0
    word = word.lower()
    for i in word:
        soma += score[i]
    return soma
print scrabble_score("thiago"), "\n\n"

def censor(text,word):
    texto = text.split(" ")
    final = []
    for i in texto:
        if i == word:
            final.append(len(word)*"*")
        else:
            final.append(i)
    final = " ".join(final)
    return final
print censor("hack e hack","hack"), "\n\n"

def count(sequence,item):
    soma = 0
    for i in sequence:
        if i == item:
            soma += 1
    return soma
print count([1,2,1,1],1), "\n\n"

def purify(lista):
    new = []
    for i in lista:
        if i%2==0:
            new.append(i)
    return new
print purify([1,2,3]), "\n\n"

def product(lista):
    produto = 1
    for i in lista:
        produto *= i
    return produto
print product([4,5,5]), "\n\n"

def remove_duplicates(lista):
    new = []
    for i in lista:
        if i not in new:
            new.append(i)
    return new
print remove_duplicates([1,1,2,2])

def anti_vowel2(text):
    new = []
    vowels = ['a','e','i','o','u']
    for i in text:
        if i not in vowels:
            new.append(i)
    return "".join(new)
print anti_vowel2("thiago !"), "\n\n"
            
def median(lista):
    new = sorted(lista)
    if len(new) % 2 == 0:
        return (new[ len(new)/2 -1 ] + new[ len(new)/2  ])/2.0
    else:
        return new[ (len(new) - 1)/2 ]
print median([2,2,3,4])


    
    
    
    
    
    
    
    
    
    
    
    
    
    