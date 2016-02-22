Ferramenta que substitui o ifconfig:

    ip addr show  
    ip addr show eth0

Capturar os pacotes que trafegam na eth0:

    tcpdump -i eth0 -s 0               # joga na tela
    tcpdump -i eth0 -s 0 -w saida.pcap  # joga no arquivo saida.pcap

Para descobrir um endereço físico de um dispositivo (conhecendo-se o ipv6 do mesmo) 
envia-se um *Neighbor Solicitation (NS)* e se recebe um *Neighbor Advertisement (NA)*.
No *NS* o Target é o ipv6 e o Source link-layer é o MAC do solicitante.
O requisitado responde o MAC no campo *Targert link-layer address*.


 
