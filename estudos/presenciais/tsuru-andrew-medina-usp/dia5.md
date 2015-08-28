Adicionando um novo 'virtualhost' na aplicação:

    tsuru cname-add thiagousp.com.br -a minha_app_favorita

# Lista pessoas no time:
   
    tsuru team-user-list fflch

# Adicione/Remover usuário do time fflch:

    tsuru team-user-add fflch user1@usp.br
    tsuru team-user-remove fflch user2@usp.br

# Dar autorização para o time eca na aplicação minhaapp:

    tsuru app-grant eca -a minhaapp
    tsuru app-revoke eca -a minhaapp

# Trocando owner da app:

    tsuru app-set-team-owner eca -a minhaapp_na_fflch

# Times que eu faço parte:

    tsuru team-list 
