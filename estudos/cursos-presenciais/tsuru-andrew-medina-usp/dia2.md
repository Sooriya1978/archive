Variáveis de ambiente:

    tsuru env-set TITULO='App: thiago-01' SENHA='123' -a thiago-01
    tsuru env-get -a thiago-01
    env
    tsuru app-run 'env' -a thiago-01
    tsuru env-unset TITULO SENHA -a thiago-01

Serviços - MySQL:

    tsuru service-list
    tsuru service-add mysql mysql-thiago-01
    tsuru service-info mysql mysql-thiago-01
    tsuru service-bind mysql-thiago-01 -a thiago-01
    tsuru env-get -a thiago-01
    tsuru app-run -o "env | grep TSURU_SERVICES"  -a thiago-01

Criar requirements.apt na raiz do projeto:

    php5-mysql
    php5-curl

hooks no tsuru.yml:

    hooks:
      build: 
        - echo "*** criando tabelas ****"
        - php schema.php

