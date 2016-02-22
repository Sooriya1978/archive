Conceitos:

 - Neighbor Discovery: como um nó descobre MAC-Address dos vizinhos no mesmo enlace, 
   ao tentar enviar um pacote a uma máquina desconhecida. 

  1. Neighbor Solicitation (NS): nó solicitante envia NS aos nós do mesmo enlace pertencetes
     ao grupo multicast solicited-node. Campos do NS:  Target (ipv6 de destino),
     source link-layer address (mac-address do solicitante).

  2. Neighbor Advertisement(NA): respota do nó dono do ipv6 solicitado. 
     Devolve o Mac-address no campo Target link-layer address.  

O CORE é um emuldador de rede: topologia, servidores, switches e roteadores.

 - Abrir arquivo de topologia NSNA.imn;
 - Inicie a simulação;

Exercícios:

Colete os pacotes da interface eth0 do n1HostA com tcpdump pelo CORE: 
 
   1. No n1HostA: tcpdump -i eth0 -s 0 
   2. No n2HostB: ping6 2001:db8::10

Colete os pacotes da interface eth0 do n1HostA com tcpdump pelo terminal: 
 
   1. (novo ifconfig) ip addr show
   2. sudo tcpdump -i n1.eth0.24 -s 0 
   2. No n2HostB: ping6 2001:db8::10

Colete os pacotes da interface eth0 do n1HostA com tcpdump pelo terminal
salvando arquivo (binário) e abrindo no wireshark: 
 
   1. (novo ifconfig) ip addr show
   2. sudo tcpdump -i n1.eth0.24 -s 0 -w log.pcap 
   2. No n2HostB: ping6 2001:db8::10

Colete os pacotes da interface eth0 do n1HostA com WireShark: 
 
   1. (novo ifconfig) ip addr show
   2. Selecione a inteface no WireShark
   2. No n2HostB: ping6 2001:db8::10

No WireShark explorar as mensagens NS e NA.


 
