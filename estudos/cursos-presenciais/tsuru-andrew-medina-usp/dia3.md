Apagando o banco:

    tsuru service-unbind mysql-thiago-01 -a thiago-01
    tsuru service-remove mysql-thiago-01

Exemplo Java:

    https://github.com/andrewsmedina/tsuru-java-sample.git

Adicionado o projeto na pasta existente:

    git remote show origin
    git remote add tsuru git@repo.apps.usp.br:thiago-java.git
    tsuru app-run 'env | grep PORT' -a thiago-java

Configurações adicionais em Procfile (na raiz do projeto):

    web: mvn jetty:run

Deployando:

    git add Procfile
    git commit -m 'Procfile criado'
    git push tsuru master

Configurações adicionais em tsuru.yml (na raiz do projeto):

    hooks:
      build:
        - mvn package

    healthcheck:
      path: /
      status: 200
      match: .*Hello.*

Boas práticas para aplicação em Nuvem:

    http://12factor.net/

Dicas de deploy:

    tsuru app-deploy-list -a thiago-01
    tsuru app-deploy-rollback 10.883...:v3 -a thiago-java

deploy sem versionar com git:

    tsuru app-deploy . -a thiago-java
