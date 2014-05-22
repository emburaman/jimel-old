<?php
include_once('header.php');
$count = -1;

if (!empty($_POST)) {
	if ($_POST['username'] == "" || $_POST['password'] == "") {
		echo "<span class='btn btn-danger'>Preencha os campos corretamente.</span>";
	} 
	elseif (isset($_POST['username']) && isset($_POST['password'])) {
		include_once('connect.php');
		$conn = new Database();
		$dados = $conn->getUser($_POST['username'], $_POST['password']);
		$count = $conn->rowCount();
	}
}

if ($count == 1) {
	setcookie("jimeluser[username]", $dados['user_name'], time()+3600);
	setcookie("jimeluser[firstname]", $dados['firstname'], time()+3600);
	setcookie("jimeluser[lastname]", $dados['lastname'], time()+3600);
	setcookie("jimeluser[profile]", $dados['profile'], time()+3600);
	setcookie("jimeluser[association]", $dados['id_association'], time()+3600);
	?><meta http-equiv="refresh" content="0; url=/"><?php
}
if ($count == 0) {
	echo "<span class='btn btn-warning'>Não foi encontrado um usuário com o login e senha informados.</span>";
}
if ($count <= 0) {
	?>
	<h1>Login</h1>
	<form action="login.php" method="post">
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
