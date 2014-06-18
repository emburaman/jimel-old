<?php
include_once('header.php');
$count = -1;

if ($_POST['action'] == 'chg') {
  $pwd = $_POST['password'];
  $rep = $_POST['re_password'];
  $err = '';
  if ($pwd == '' && $rep == '') {
    $err .= "<span class='btn btn-danger'>O par de senhas informadas não pode ser vazio. Tente novamente!</span>";
  } 
  elseif ($pwd <> $rep) {
    $err .= "<span class='btn btn-danger'>O par de senhas informadas não coincidem. Tente novamente!</span>";
  } 
  elseif (!preg_match_all('$\S*(?=\S{8,})(?=\S*[a-z])(?=\S*[A-Z])(?=\S*[\d])(?=\S*[\W])\S*$', $pwd)) {
    $err .= "<span class='btn btn-danger'>Sua senha não possui complexidade suficiente! <br/> Informe uma senha com no mínio 8 caracteres, sendo pelo menos: 
    <ul>
    <li>Uma letra minúscula</li>
    <li>Uma letra maiúscula</li>
    <li>Uma algarismo</li>
    <li>Uma caracter especial</li>
    </ul></span>";
  }
}

if ($_POST['action'] == 'login') {
	if ($_POST['username'] == "" || $_POST['password'] == "") {
		echo "<span class='btn btn-danger'>Preencha os campos corretamente.</span>";
	} 
	elseif (isset($_POST['username']) && isset($_POST['password'])) {
		include_once('connect.php');
		$db = new Database();
		$dados = $db->getUser($_POST['username'], $_POST['password']);
		$count = $db->rowCount();
	}
}

if ($count == 1 && $dados['chg_pwd'] == 0) {
	setcookie("jimeluser[id_user]", $dados['id_user'], time()+3600);
	setcookie("jimeluser[username]", $dados['user_name'], time()+3600);
	setcookie("jimeluser[firstname]", $dados['firstname'], time()+3600);
	setcookie("jimeluser[lastname]", $dados['lastname'], time()+3600);
	setcookie("jimeluser[profile]", $dados['profile'], time()+3600);
	setcookie("jimeluser[association]", $dados['id_association'], time()+3600);
	setcookie("jimeluser[igreja]", $dados['igreja'], time()+3600);
  
  echo "<meta http-equiv='refresh' content='0; url=$base_path/'>";
}
if (($count == 1 && $dados['chg_pwd'] > 0) || $_POST['action'] == 'chg') {
  echo "<h1>Redefina sua senha</h1>";
  
	if ($err != '') {
    echo $err ."<br /><br />";
  } else {
    echo "<span class='btn btn-warning'>Este é seu primeiro login, você precisa trocar sua senha para uma se seu único conhecimento.</span>";
  }
	?>
	<form action="login.php" method="post">
		<input type="hidden" name="username" value="<?php echo $_POST['username']; ?>" />
    <input type="hidden" name="action"   value="chg" />
		<p class="mbl"><input type="password" placeholder="Digite sua senha" class="form-control" name="password" /></p>
		<p class="mbl"><input type="password" placeholder="Repita sua senha" class="form-control" name="re_password" /></p>
		<p class="mbl"><input type="submit" class="btn btn-primary btn-wide mrm" value="Alterar"/></p>
	</form>
	<?php
}
/* ((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20}) */

if ($count == 0) {
	echo "<span class='btn btn-warning'>Não foi encontrado um usuário com o login e senha informados.</span>";
}
if ($count <= 0 && $_POST['action'] != 'chg') {
	?>
	<h1>Login</h1>
	<form action="login.php" method="post">
    <input type="hidden" name="action"   value="login" />
		<p class="mbl"><input type="text" placeholder="Digite seu login" class="form-control" name="username" /></p>
		<p class="mbl"><input type="password" placeholder="Digite sua senha" class="form-control" name="password" /></p>
		<p class="mbl">
		<input type="submit" class="btn btn-primary btn-wide mrm" value="Logar"/>
		<input type="reset"  class="btn btn-default btn-wide" value="Cancelar"/>
		</p>
	</form>
	<?php
}

include_once('bottom.php');
?>
