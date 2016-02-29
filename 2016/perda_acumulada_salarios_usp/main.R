setwd('~/Desktop/perda_acumulada_salarios_usp/')

# 1) Nos arquivos .csv salvei apenas a coluna do piso e so salário corrigido (aproveitei a conta do excel)  
# 2) Há 3 arquivos: basico.csv, tecnico.csv e superior.csv
# 3) Suposição: a inflação de um mês para o outro variou de forma linear, ou seja, 
# podemos integrar a área sobre de mês em mês e tirar a diferença.
# O pacote usado para integração pracma.

require(pracma)

basico = read.csv('data/basico.csv')
x = seq(1:nrow(basico))
acumulado_piso = trapz(x,basico$piso)
acumulado_corrigido = trapz(x,basico$corrigido)
acumulado_corrigido - acumulado_piso
# R$ 4769,62

tecnico = read.csv('data/tecnico.csv')
x = seq(1:nrow(tecnico))
acumulado_piso = trapz(x,tecnico$piso)
acumulado_corrigido = trapz(x,tecnico$corrigido)
acumulado_corrigido - acumulado_piso
# R$ 8664,52

superior = read.csv('data/superior.csv')
x = seq(1:nrow(superior))
acumulado_piso = trapz(x,superior$piso)
acumulado_corrigido = trapz(x,superior$corrigido)
acumulado_corrigido - acumulado_piso
# R$ 16292,67
