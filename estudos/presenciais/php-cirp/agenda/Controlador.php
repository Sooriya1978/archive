<?php
//Classe que renderiza os conteúdos das páginas
class Controlador{
  public $erros;
  public $htmls;
  public $template;

  public function __construct(){
    //Inicializa atributos com valores padrões
    $this->erros = array();
    $this->htmls = array();
    $this->template = 'template.html.php';
  }
  
  //Método que acumumula erros no array $erros
  public function erro($mensagem){
    $this->erros[] = $mensagem;
  }

  //Método que acrescenta conteúdo de html no array $htmls
  public function html($conteudo){
    $this->htmls[] = $conteudo;
  }
 
  //Método que exibe conteudo e erro usando o template
  public function show(){
    $htmlErros = '';
    $htmlExibir = '';

    if(!empty($this->erros)){
      $htmlErros=
      "<div class='erro'>"
        ."<ul>"
          ."<li>"
           . implode('<li></li>',$this->erros)
          ."</li>"
        ."</ul>"
      ."</div>"
      ;
     }

    //junta htmls em uma única string
    $htmlConteudo = implode('',$this->htmls);

    //template
    $htmlExibir = file_get_contents($this->template);

    //Substitui o {conteudo} do template pelos erros e conteúdos do html adicionado
    $htmlExibir = str_replace('{conteudo}',$htmlErros . $htmlConteudo, $htmlExibir);

    //Substitui o {usuario} do template pelo usuario logado e link sair, ou link para autenticar
    if($this->autenticado()) {
      $htmlExibir = str_replace('{usuario}',
      "<div>" . $_SESSION['usuario'] . " - <a href='sair.php'> Sair</a>" . "</div>"
      ,$htmlExibir);
    }
    else {
      $htmlExibir = str_replace('{usuario}',"<div><a href='logar.php'> Logar</a></div>" ,$htmlExibir);
    }
  
    //Exibi HTML no navegador
    print $htmlExibir;

    //Finaliza PHP
    exit;//pq?
  } //Fim do métod show()

  //método para Consultas
  public function sql($sql,&$linhas=array()){
    global $php_errormsg; //No php.ini ativar track_errors
    $php_errormsg = '';

    //@ joga erro em $php_errormsg
    @ $con = pg_connect("host=localhost dbname=agenda user=agenda password=agenda");
  
    //Se der erro, armazena mensagem
    if($php_errormsg != '') {
      $this->erro("Erro de conexão: {$php_errormsg}");
      return false;
    }
  
    //execute sql
    @ $rs = pq_query($con,$sql);
    if($php_errormsg != '') {
      $this->erro("Erro de query: {$php_errormsg}");
      return false;
    }
  
    $linhas = pg_fetch_all($rs); 
    if($php_errormsg != '') {
      $this->erro("Erro nos dados retornados: {$php_errormsg}");
      return false;
    }
    //fecha conexão com banco de dados
    @ pg_close($con);
    if($php_errormsg != '') {
      $this->erro("Erro ao fechar conexão: {$php_errormsg}");
      return false;
    }
    return true;
  } //Fim do método sql

  public function autenticado(){
    global $_SESSION;
    session_start();
    return ($_SESSION['usuario'] != '');
  }//fim do método autenticado

  //Métodos camposOK, $tipoAcao: login,filtro ou cadastro
  public function camposOK($tipoAcao){
    global $nome,$fone,$usuario,$senha,$filtro;
    $fone = trim($fone);
    $usuario = trim($usuario);
    $senha = trim($senha); 
    $filtro = trim($filtro);
    $nome = trim($nome);

    $formatoNome = "/^[a-zA-Z0-9áéíóúçãõêôÁÉÍÓÚÇÃÕÊÔ\\.]{1,50}$/";
    $formatoFone = "/^[0-9\ ]{1,20}$/";
    $formatoUsuario = "/^[a-zA-Z0-9]{1,10}$/";
    $formatoSenha = $formatoUsuario;
    $formatoNome = "/^[a-zA-Z0-9áéíóúçãõêôÁÉÍÓÚÇÃÕÊÔ\ \.]{1,50}$/";
    switch($tipoAcao) {
      case 'login':
        if(!preg_match($formatoUsuario,$usuario)){
          $this->erro("Usuário Inválido");
          //return false; 
          return true; 
        }
        if(!preg_match($formatoSenha,$senha)){
          $this->erro("Senha Inválida");
          //return false; 
          return true; 
        }
      break;
      case 'filtro':
        if(!preg_match($formatoFiltro,$filtro)){
          $this->erro("Filtro Inválido");
          return false; 
        }
      break;
      case 'cadastro':
        if(!preg_match($formatoNome,$nome)){
          $this->erro("Nome Inválido");
          return false; 
        }
        if(!preg_match($formatoFone,$fone)){
          $this->erro("Telefone Inválida");
          return false; 
        }
      break;
      default:
        $this->erro("Acão Inválida");
        return false;
      break;
    } //Fecha switch
  } //Fecha camposOK
} //Fecha Classe Controlador
 
$con = new Controlador();

?>  
