# Comentario de 1 linha
"""
Cometario
em blocos
"""
print 51%50
print 2**3

nome1 = "Thiago"
nome2 = "Thais"

print "%s ama %s" % (nome1,nome2)
print nome1.upper()
print nome2.lower()
print nome1 + " tem " + str(len(nome1))  + " caracteres"

from datetime import datetime
def funcao_data():
 now = datetime.now()
 print str(now.month) + "/" + str(now.day) + "/" + str(now.year)
 print str(now.hour) + ":" + str(now.minute) + ":" + str(now.second)
 
funcao_data()

if 3 > 4:
    print "3 is not greater than 4"
elif 3 < 4:
    print "3 is less than 4 "
else:
    print "default solution"
    
##############################Lesson 4
pyg = 'ay'

original = raw_input('Enter a word:')

if len(original) > 0 and original.isalpha():
    word = original.lower()
    first = word[0]
    if first == 'a':
        print "vowel"
    elif first == 'b':
        print "vowel"
    elif first == 'c':
        print "vowel"
    elif first == 'd':
        print "vowel"
    elif first == 'e':
        print "vowel"
    else:
        print "consonant"
    
else:
    print 'empty'
    
def shut_down(a):
    a = a.lower()
    if a == 'yes':
        return "Shutting down..."
    elif a == 'no':
        return "Shutdown aborted!"
    else:
        return "Sorry, I didn't understand you."
from math import sqrt
print sqrt(13689)
