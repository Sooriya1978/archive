dicas de git:

    git log -p
    git blame arquivo.txt
    git push origin minha_branch_local:branch_remota

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

Adicionado/Removendo novas unidades para a aplicação:

    tsuru unit-add 2 -a thiago-01
    tsuru app-info -a thiago-01
    tsuru unit-remove 2 -a thiago-01
    
Parando ou ligando as unidades:

    tsuru app-stop -a thiago-01
    tsuru app-start -a thiago-01
    tsuru app-restart -a thiago-01

Assistindo log:
    
    tsuru app-log -a thiago-01
    
Acessando o shell:

    tsuru app-run "ls -lsa" -a thiago-01
    tsuru app-shell -a thiago-01