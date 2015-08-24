Subir um server local:

    https://github.com/tsuru/tsuru-bootstrap
    vagrant up

Em um segundo instalar o docker e mudar o socket:

    instala docker
    vim /etc/default/docker
    DOCKER_OPTS="-H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock"

Criando/Apagando pool:

    tsuru-admin pool-remove usp
    tsuru-admin pool-add usp

Adicionar um novo node tsuru-server:

    tsuru-admin docker-node-add pool=usp --register address=http://192.168.50.101:2375
