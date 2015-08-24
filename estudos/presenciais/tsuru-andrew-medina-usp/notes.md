dicas de git:

    git log -p
    git blame arquivo.txt  

Subir um server local:

    https://github.com/tsuru/tsuru-bootstrap
    https://github.com/tsuru/now

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

Adicionado chave:

    tsuru key-add laptop_sti /home/thiago/.ssh/id_rsa.pub
    tsuru key-list
    
Trabalhando com apps:

    tsuru app-create thiago-01 php
    tsuru app-list
    tsuru app-info -a thiago-01
    git clone git@repo.apps.usp.br:thiago-01.git