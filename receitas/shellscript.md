Cabeçalho
  #!/bin/bash

Pegar horário atual:
  agora=$(date -d 'today' '+%Y.%m.%d.%H.%M.%S')

Exemplo de if (gt: maior que):
  if [ 2 -gt 1 ]; then
    echo 'Ola';
  fi

  if [ 2 -gt 1 ]; then
    echo 'Ola';
  fi
  elif [2 -gt 3]; then
    echo "eu de novo"
  elif [2 -gt 4]; then
    echo "eu de novo"
  else 
    echo "ixi"
  fi 

Exemplo de for:
  for i in *; do 
    echo "$i é um arquivo bacana"; 
  done

  for i in `ls`; do 
    echo "$i é um arquivo bacana"; 
  done

verifica se o arquivo especificado existe:
  if [ -e "dns.txt" ]; then 
    echo "The file dns.txt exists"; 
  fi

Exemplo usando Interface:
  zenity --info --text "ola mundo"

# echo mesma linha

    for i in $(ls); do echo -n "$i, "; done

# resolve problema do sepador de lista ser o espaço no for:

    IFS=$'\n'
    for i in $(ls); do echo $i; done
