dicas de git:

    git log -p
    git blame arquivo.txt  

Adicionando o servidor de tsuru:

    tsuru target-list
    tsuru target-add usp api.apps.usp.br -s # -s: tsuru target-set usp
    
Removendo servidor:

    tsuru target-remove usp
    tsuru target-list
    
Adicionado usuário:

    tsuru user-create exemplo@usp.br
    tsuru login thiago.verissimo@usp.br
