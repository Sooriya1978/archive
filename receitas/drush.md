Instalando Drupal

    drush dl drupal
    cd drupal-version
    drush si --db-url=mysql://dbuser:dbpassword@193.169.0.4:3306/dbname

Atualizar senha

   drush upwd 5385361 --password='oauth'

Desabilitar módulo views em massa

   Criar um arquivo com a lista:
   ls /sites/all/modules > /tmp/lista.txt 
   for i in $(cat /tmp/lista | grep fflch.usp.br); do drush dis views -l http://$i --yes; done

Atualizar versões dos módulos (para teste)
 -for i in $(ls);do drush dl $i --yes; done

Atualizar banco de dados depois de atualização: 
 -ls /sites/all/modules > /tmp/lista.txt 
 -for i in $(cat /tmp/lista | grep fflch.usp.br); do drush updb -l http://$i -y; done

Criar lista de módulos que não são do core
 -drush pml --no-core --type=module --status="enabled" --pipe > /tmp/modules.txt

#Listar módulos e themas desabilidados:
 drush pm-list --no-core --status="disabled,not installed" --pipe -l http://modelod7.fflch.usp.br

#Habilitar módulos e themas desabilitados
 drush en `drush pm-list --status="disabled,not installed" --pipe -l http://grafica.fflch.usp.br` -l http://grafica.fflch.usp.br 

Desabilitar módulos que não são do core
 -for module in $(cat /tmp/modules.txt); do drush -y dis $module; done 
 - para ativar, trocar 'dis' por 'en'

Atualizar core
 -drush up

Atualizar banco
 -drush updb 

Tema padrão
 -drush -l http://site.com  vset theme_default bartik

//Atualização dos sites em drupal
for i in $(ls sites/ | grep -v all | grep -v default); do 
drush en update -l http://$i --yes ;
drush vset site_offline 1 -l http://$i --always-set ;
drush up -l http://$i --yes;
drush dis update -l http://$i --yes;
drush cc -l http://$i all;
drush vset site_offline 0 -l http://$i --always-set;
done

// Versão que só atualiza os módulos
for i in $(ls sites/ | grep -v all | grep -v default); do
echo "-------------Atualizando $i ---------------------"
drush en update -l http://$i --yes ;
drush vset site_offline 1 -l http://$i --always-set ;
drush up --no-core -l http://$i --yes;
drush dis update -l http://$i --yes;
drush cc -l http://$i all;
drush vset site_offline 0 -l http://$i --always-set;
done
