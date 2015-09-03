Inicia um projeto bare:

    mkdir projeto
    cd projeto
    git init --base

Inserir o seguinte hook:

    vim hooks/update
    #!/bin/sh
    pwd
    whoami
    echo "GIT_DIR: $GIT_DIR"
    echo 1: $1
    echo 2: $2
    echo 3: $3
    
Atualiza a pasta de produção automaticamente:

    #!/bin/bash
    cd ~
    GIT_DIR='.git'
    if [ "$1" == 'refs/heads/prod' ]; then
      cd prod
      git pull origin prod
    fi