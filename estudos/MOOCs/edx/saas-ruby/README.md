
# Onde aprender tuby:
http://www.saasbook.info/students

# Configurando o c9: 
https://github.com/saasbook/courseware/wiki/Setting-up-Cloud9

# Vídeos 
https://vimeo.com/channels/saastv

# ?
https://www.mentive.co/courses/1?utm_campaign=cs169-1x&utm_medium=video&utm_source=edxcoursepage

# Ubuntu
curl -sSL https://get.rvm.io | bash -s stable --ruby=2.2.2
curl -fsSL c9setup.saasbook.info | bash --login

Or if you want to see what it does before running it, you can replace the second line above with this two-step process, inspecting the file after step 1:
curl -fsSL c9setup.saasbook.info > setup.sh
…inspect the file…
bash --login setup.sh

# update: 
If you have a computer on which you can install Ubuntu Linux version 14.04, whether your own or in Amazon's cloud (see below), switch to the superuser (root) account, install RVM (Ruby Version Manager), and then our setup script:
curl -sSL https://get.rvm.io | bash -s stable --ruby=2.2.2
curl -fsSL c9setup.saasbook.info | bash --login

Or if you want to see what it does before running it, you can replace the second line above with this two-step process, inspecting the file after step 1:
curl -fsSL c9setup.saasbook.info > setup.sh
…inspect the file…
bash --login setup.sh
