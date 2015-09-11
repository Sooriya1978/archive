https://software.intel.com/en-us/non-commercial-software-development

-----------------
1) Dependency in a 32 bits machines:
apt-get install glibc-doc libc6-i386 lib32gcc1 g++ gcc build-essential libc6-dev  g++-multilib libc6-dev-i386 openjdk-7-jre openjdk-7-jre-headless

 Dependency in a 64 bits machines:
  sudo apt-get install ia32-libs 

2)
No .bashrc usuário:
	export LD_LIBRARY_PATH="/opt/intel/lib"
	export DYLD_LIBRARY_PATH="/opt/intel/lib"
	export MANPATH="/opt/intel/man"
	export PATH=/opt/intel/bin:$PATH

re-ler o bash sem reiniciar: source .bashrc


source /opt/intel/bin/compilervars.sh intel64

source ifortvars.sh ia32

ifort --version
------------------

source ifortvars.sh intel64

------------------
Opicional:
sudo apt-get -y install libx11-dev
