
Armazenamento de arquivos via API externa (object storage)?

    https://aws.amazon.com/pt/s3/
    http://docs.openstack.org/developer/swift/

Código on-line:
   
    https://gist.github.com/
    http://dpaste.com/

Instalação de Plugins no tsuru via URL:

    tsuru plugin-install thiagoteste https://.../plugin.txt
    tsuru plugin-list
    tsuru thiagoteste

Instalação de Plugins no tsuru via arquivo:
 
    ~/.tsuru/plugins/meuplugin.sh
    chmod +x ~/.tsuru/plugins/meuplugin.sh

Exemplo de plugin que faz o deplou automático:

    #!/bin/bash
	  custom_name=$1
	  echo " *** Criando app e mysql para: $custom_name *** "
	  tsuru app-create $custom_name php
	  tsuru service-add mysql $custom_name
	  tsuru service-bind $custom_name -a $custom_name

Instalação do composer php:

    curl -sS https://getcomposer.org/installer | php 
    php composer.phar create-project laravel/laravel meuprojeto
    # mover para composer.phar /usr/local/bin/composer para ficar global.

Tsuru e php:

    https://github.com/sroze/tsuru-php-example
    https://github.com/tsuru/basebuilder/tree/master/php

Plugin tsuru para instalação do wordpress:

    #! /bin/bash

    echo "criando app $1"
    tsuru app-create $1 php

    servicename="mysql-$1"
    echo "criando mysql $servicename"
    tsuru service-add mysql $servicename

    echo "relacionando $servicename com a app $1"
    tsuru service-bind $servicename -a $1

    echo "fazendo download do ultimo wordpress"
    wget http://wordpress.org/latest.zip

    echo "descompactando wordpress"
    unzip latest.zip

    cd wordpress

    echo "adicionando php-mysql no requirements.apt"
    echo php5-mysql > requirements.apt

    echo "configurando wordpress para variaveis de ambiente"
     sed "s/'database_name_here'/getenv('MYSQL_DATABASE_NAME')/; \
         s/'username_here'/getenv('MYSQL_USER')/; \
         s/'localhost'/getenv('MYSQL_HOST')/; \
         s/'password_here'/getenv('MYSQL_PASSWORD')/" \
     wp-config-sample.php  > wp-config.php

    echo "fazendo deploy do wordpress"
    tsuru app-deploy . -a $1

    echo "wordpress deployado com sucesso \o/ !!!!!"

Usando a API sem usar comandos do tsuru-client:

    curl -H "authorization: bearer $(cat ~/.tsuru_token)" api.apps.usp.br/apps/thiago-quinta

Usando a API sem usar comandos do tsuru-client via plugin (pois ele cria variáveis de ambiente):

    vim ~/.tsuru/plugins/meuplugin
    chmod +x ~/.tsuru/plugins/meuplugin

    #!/bin/bash
    curl -H "authorization: bearer ${TSURU_TOKEN}" ${TSURU_TARGET}apps/thiago-quinta


# Para automatização de tarefas via token:

    tsuru token-show
    tsuru token-regenarate

# Deslogar do tsuru:

    tsuru-logout

