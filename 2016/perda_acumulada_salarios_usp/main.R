setwd('~/remota/repos/git.uspdigital.usp.br/archive/2016/perda_acumulada_salarios_usp/')

# 1) Nos arquivos .csv salvei apenas a coluna do piso e so salário corrigido (aproveitei a conta do excel)  
# 2) Há 3 arquivos: basico.csv, tecnico.csv e superior.csv
# 3) Suposição: a inflação de um mês para o outro variou de forma linear, ou seja, 
# podemos integrar a área sobre de mês em mês e tirar a diferença.
# O pacote usado para integração pracma.

require(pracma)

# Escrevendo resultados:
f <- file("output.md","w")
writeLines("# Estimativa da perda acumulada dos salários USP entre Maio-2011 e Jan-2016 \n",con,sep="\n")

writeLines("\n ## Básico ",con=f,sep="\n")
basico = read.csv('data/basico.csv')
x = seq(1:nrow(basico))
acumulado_piso = trapz(x,basico$piso)
acumulado_corrigido = trapz(x,basico$corrigido)

writeLines("Salário PISO acumulado no período: R$ ",con=f,sep="")
writeLines(gsub('\\.',',',round(acumulado_piso,2)),con=f,sep="\n")
writeLines("\n",con=f,sep="")

writeLines("Salário CORRIGIDO acumulado no período: R$ ",con=f,sep="")
writeLines(gsub('\\.',',',round(acumulado_corrigido,2)),con=f,sep="\n")
writeLines("\n",con=f,sep="")

perda = acumulado_corrigido - acumulado_piso
writeLines("Perda acumulada: R$ ",con=f,sep="")
writeLines(gsub('\\.',',',round(perda,2)),con=f,sep="\n")
writeLines("\n",con=f,sep="")

writeLines("\n\n ## Técnico",con=f,sep="\n")
tecnico = read.csv('data/tecnico.csv')
x = seq(1:nrow(tecnico))
acumulado_piso = trapz(x,tecnico$piso)
acumulado_corrigido = trapz(x,tecnico$corrigido)
writeLines("Salário PISO acumulado no período: R$ ",con=f,sep="")
writeLines(gsub('\\.',',',round(acumulado_piso,2)),con=f,sep="\n")
writeLines("\n",con=f,sep="")

writeLines("Salário CORRIGIDO acumulado no período: R$ ",con=f,sep="")
writeLines(gsub('\\.',',',round(acumulado_corrigido,2)),con=f,sep="\n")
writeLines("\n",con=f,sep="")

perda = acumulado_corrigido - acumulado_piso
writeLines("Perda acumulada: R$ ",con=f,sep="")
writeLines(gsub('\\.',',',round(perda,2)),con=f,sep="\n")
writeLines("\n",con=f,sep="")

writeLines("\n\n  ## Superior ",con,sep="\n")
superior = read.csv('data/superior.csv')
x = seq(1:nrow(superior))
acumulado_piso = trapz(x,superior$piso)
acumulado_corrigido = trapz(x,superior$corrigido)

writeLines("Salário PISO acumulado no período: R$ ",con=f,sep="")
writeLines(gsub('\\.',',',round(acumulado_piso,2)),con=f,sep="\n")
writeLines("\n",con=f,sep="")

writeLines("Salário CORRIGIDO acumulado no período: R$ ",con=f,sep="")
writeLines(gsub('\\.',',',round(acumulado_corrigido,2)),con=f,sep="\n")
writeLines("\n",con=f,sep="")

perda = acumulado_corrigido - acumulado_piso
writeLines("Perda acumulada: R$ ",con=f,sep="")
writeLines(gsub('\\.',',',round(perda,2)),con=f,sep="\n")

close(con)

