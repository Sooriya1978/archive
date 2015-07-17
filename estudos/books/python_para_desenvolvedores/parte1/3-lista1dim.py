def lista1dim(l):
    """
    Transforma a lista em uma lista de uma dimensao.
    """
    if isinstance(l,list):
        retorno = []
        for i in l:
            retorno = retorno + lista1dim(i)
        return retorno
    else:
        return [l]

x = [ ['maria','pedro'],['joao'],['A','B','C'] ]
print lista1dim(x)
