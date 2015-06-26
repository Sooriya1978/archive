def primo(n):
    """
    avalia se n eh primo.
    """
    chave = True
    escopo = range(2,101,1)
    escopo.remove(n)
    for i in escopo:
        if n%i == 0:
            chave = False
    return chave

# Testando primo(): 
teste = range(2,101,1)
for j in teste: 
    if primo(j):
        print "%d eh primo!" % j
