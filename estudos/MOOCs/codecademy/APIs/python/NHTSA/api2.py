import requests
response = requests.get("http://placekitten.com/")
print response.status_code
print response.headers # retorna um dicionario

from xml.dom import minidom

ponteiro = open('animais.txt','r')
animais = minidom.parseString(ponteiro.read())
nomes = animais.getElementsByTagName('name')
for i in nomes:
    print i.firstChild.nodeValue
