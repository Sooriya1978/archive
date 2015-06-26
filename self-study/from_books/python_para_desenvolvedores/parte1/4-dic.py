def mydic(x):
    v = x.values()
    soma = sum(v)

    media = sum(v) / len(v) 

    var = max(v) - min(v) 

    return [soma,media,var]

x = {'a':10,'b':20,'c':30}
print mydic(x)
