Subir um server local:

    https://github.com/tsuru/tsuru-bootstrap
    vagrant up

Em um segundo instalar o docker e mudar o socket:

    instala docker
    vim /etc/default/docker
    DOCKER_OPTS="-H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock"

Adicionar um novo node tsuru-server:

    tsuru-admin docker-node-add --register address=http://192.168.50.100:2375