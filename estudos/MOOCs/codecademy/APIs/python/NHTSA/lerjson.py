import json
from pprint import pprint

f = open('animais.json','r')
dados = f.read()
animais = json.loads(dados)
f.close()

pprint(animais)
