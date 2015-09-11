Marcar/desmarcar um pacote para não atualizar:

    sudo apt-mark hold git
    sudo apt-mark unhold git

Adicionando repositórios ppa no ubuntu:

    apt-add-repository ppa:ansible/ansible
    add-apt-repository ppa:ansible/ansible

Fazer atualizações de segurança automaticamente:

    apt-get install unattended-upgrades

Classificar arquivos pelo tamanho:

    du -sh * | sort -n

Apagar todos arquivos com extensão tar.gz (incluíndo subdiretórios):

    find . -name "*.tar.gz" | xargs rm

Permissões na forma octal:

    7: rwx
    6: rw- 
    5: r-w
    4: r--
    3: -wx
    2: -w-
    1: --x

Dando permissões(u: usuário, g: grupo, o: outros:, a: todos):
  
    chmod ug+rx texto.md # dono e grupo podem ler e executar (para executar é preciso ler)
    chmod go-w texto.md  # grupo e outros não podem executar
    
Trabalhando com grupos:
  
    addgroup programadores # adiciona em /etc/group 
    adduser prog1
    adduser prog2
    gpasswd -a prog1 programadores # Ver novamente /etc/group
    gpasswd -a prog2 programadores
    chgrp programadores index.php

Apagando usuários e grupos:

    userdel -r prog1 # Apaga home do usuário
    groupdel programadores

Adicionado usuário ao grupo sudo (pois no arquivo /etc/sudoers há entrada para usuários do grupo sudo):

    gpasswd -a user1 sudo # Pois no arquivo /etc/sudoers

Ver redes wifi disponíveis:

    iwlist wlan0 scan | grep ESSID

Date:

    date +%Y # ano corrente
    date '+%d/%m/%Y %H:%M' # dia/mes/ano Hora:Minuto

Calculadora bc do linux:

    echo 2^3 | bc

crontab:

    crontab -e # cria as entradas
    contrab -l > meu_crontab.txt # faz backup
    crontab meu_crontab.txt # restaura backup    

Caminho em shell scripts (corrige problema de auto-localização do script):

    #!/bin/bash
    cd $(dirname $0)

Testando envio de e-mail com sendmail:
 
    # apt-get install sendmail
    sendmail 'Thiago Gomes'
    From: eu_teste@gmail.com   
    To: outro_teste@gmail.com
    Subject: Testando

    Minha mensagem vem aqui
    
    Ctrl+d

    tail /var/log/syslog # var ver log

O mesmo teste acima, mas com postfix:
    
    apt-get install postfix
    apt-get install mailutils
    echo "corpo do e-mail" | mail -s "titulo do email" user@example.com

O crontab envia por padrão e-mail para o dono do crontab, é possível enviar para outro e-mails:

    crontab -e
    MAILTO=user1@gmail.com,user2@gmail.com
    * * * * * /home/thiago/sites.sh

Exemplo sites.sh do professor:
    
    #!/bin/bash
    for site in dlcv.fflch.usp.br dlm.fflch.usp.br ; do
	if ! curl -s $site > /dev/null ; then
	  echo SITE OFFLINE: $site
	fi
    done

Minha modificação e sites.sh:

    #!/bin/bash
    cd $(dirname $0)
    while read site
        do
        if ! curl -s $site > /dev/null ; then
            echo SITE OFFLINE: $site
        fi
    done < sites.txt

Uso do rsync:

    rsync -razv thiago@cloud.fflch.usp.br:teste teste

Verifica se arquivo existe:

    if [ ! -e arquivo.txt ]; then 
      echo "arquivo.txt não existe"
    exit 1
fi

propriedade Sticky: em pastas, impede que outros usuários deletem ou renomeam arquivos dos quais não são donos:

    chmod o+t /home/thiago/tmp/
    