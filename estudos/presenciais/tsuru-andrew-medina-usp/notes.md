dicas de git:

    git log -p
    git blame arquivo.txt  

Adicionando o servidor de tsuru:

    tsuru target-list
    tsuru target-add usp api.apps.usp.br -s # -s: tsuru target-set usp
    
Removendo servidor:

    tsuru target-remove usp
    tsuru target-list
    
Adicionado/removendo usuário e time:

    tsuru user-create exemplo@usp.br
    tsuru login thiago.verissimo@usp.br
    tsuru team-create fflch
    tsuru team-remove fflch
    
Trabalhando com apps:

    tsuru app-create thiago-01 php
    tsuru app-list
    
Adicionado chave:

    tsuru key-add laptop_sti /home/thiago/.ssh/id_rsa.pub
