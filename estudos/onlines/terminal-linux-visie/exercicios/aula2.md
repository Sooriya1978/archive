Script:
    #!/bin/bash
    cd /home/news

    echo "atualizado em: $(date)" > boletim.txt

    for i in $(ls | grep .txt | grep -v boletim);
    do
       echo "copiando $i"
       cat $i >> boletim.txt
    done

