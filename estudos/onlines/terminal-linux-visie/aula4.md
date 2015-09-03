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