<?php
include_once('header.php');
if (!isset($_COOKIE['jimeluser'])) {
?>
	<div class="alert alert-dismissable alert-warning">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<h4>Atenção!</h4>
		<p>Você precisa estar logado para acessar esta página. Faça login <a href="login.php" class="alert-link">clicando aqui</a>.</p>
	</div><?php
	exit;
}

include_once('connect.php');
$db = new Database();

/* New/Edit athlete */
if ($_POST['action'] == 'new' || $_POST['action'] == 'edit') {
	$status = 1;
	$profile = 1;
  $staff = 0;
	if ($_POST['action'] == 'new') {	echo "<h1>Novo Usuário</h1>"; }
	if ($_POST['action'] == 'edit') {
		echo "<h1>Editando Usuário</h1>"; 
		
		$dados = $db->getUsers($_POST['id_user']);
		$count = $db->rowCount();
		$dados = $dados[0];
		
		$uname     = $dados['user_name'];
    $profile   = $dados['profile'];
		$fname     = $dados['firstname'];
		$lname     = $dados['lastname'];
		$email     = $dados['email'];
		$phone     = $dados['phone'];
		$birthdate = date("d/m/Y", strtotime($dados['birthdate']));
		$rg        = $dados['rg'];
		$cpf       = $dados['cpf'];
		$gender    = $dados['gender'];
		$status    = $dados['status'];
		$id_assoc  = $dados['id_association'];
    if ($dados['is_staff'] != NULL) { $staff = $dados['is_staff']; }
    
	} 
  ?>
  
	<form id="user-form" method="post" action="usuarios.php">
		<?php if ($_POST['id_user']) {?>
	  <input type="hidden" name="id_user" value="<?php echo $dados['id_user']; ?>" />
		<?php } ?>
		<?php if ($_COOKIE['jimeluser']['profile'] >= 3) { ?>
		<p class="mbl">
			<label class="radio pull-left"><input type="radio" id="profile" name="profile" value="1" data-toggle="radio" <?php if ($profile == 1) { echo "checked";} ?> />Representante</label>
			<label class="radio pull-left mll"><input type="radio" id="profile" name="profile" value="3" data-toggle="radio" <?php if ($profile == 3) { echo "checked";} ?> />Admin</label>
		</p>
		<p class="mbl clearfix right">
			<label class="checkbox pull-left"><input type="checkbox" id="staff" name="staff" value="1" data-toggle="checkbox" <?php if ($staff == 1) { echo "checked";} ?> />STAFF</label>
		</p>
		<?php } else { ?>
	  <input type="hidden" id="profile" name="profile" value="<?php echo $profile; ?>" />
	  <input type="hidden" id="staff" name="staff" value="<?php echo $staff; ?>" />
    <?php }?>

		<p class="mbl"><input type="text"     id="uname" name="uname" placeholder="User Name" class="form-control" <?php if ($_POST['id_user']) { print 'readonly="readonly"'; } ?> value="<?php echo $uname; ?>" /></p>
		<p class="mbl"><input type="text"     id="fname" name="fname" placeholder="Nome" class="form-control" value="<?php echo $fname; ?>" /></p>
		<p class="mbl"><input type="text"     id="lname" name="lname" placeholder="Sobrenome" class="form-control" value="<?php echo $lname; ?>" /></p>
		<p class="mbl"><input type="password" id="pwd"   name="pwd"   placeholder="Senha" class="form-control" value="" /></p>
		<p class="mbl"><input type="email"    id="email" name="email" placeholder="Email" class="form-control" value="<?php echo $email; ?>" /></p>
		<p class="mbl"><input type="phone"    id="phone" name="phone" placeholder="Telefone" class="form-control" value="<?php echo $phone; ?>" /></p>
		<p class="mbl"><input type="text"     id="bdate" name="bdate" placeholder="Data de Nascimento" class="form-control" value="<?php echo $birthdate; ?>" /></p>
		<p class="mbl clearfix">
			<label class="radio pull-left"><input type="radio" id="gender" name="gender" value="M" data-toggle="radio" <?php if ($gender == 'M') { echo "checked";} ?>>Masculino</label>
			<label class="radio pull-left mll"><input type="radio" id="gender" name="gender" value="F" data-toggle="radio" <?php if ($gender == 'F') { echo "checked";} ?>>Feminino</label>
		</p>

		<p class="mbl"><input type="text"     id="rg"    name="rg"    placeholder="RG" class="form-control" value="<?php echo $rg; ?>" /></p>
		<p class="mbl"><input type="text"     id="cpf"   name="cpf"   placeholder="CPF" class="form-control" value="<?php echo $cpf; ?>" /></p>

		<?php if ($_COOKIE['jimeluser']['profile'] >= 3) { ?>
		<p class="mbl"><select name="id_association" class="form-control"><option>< Selecione uma entidade ></option><?php
			$ents = $db->getEntities();
		  for ($i = 0; $i < $db->rowCount(); $i++) {
				$chk = '';
				if (isset($id_assoc) && ($ents[$i]['id_association'] == $id_assoc)) {
					$chk = 'selected';
				}
				echo "<option value='". $ents[$i]['id_association'] ."' $chk>". $ents[$i]['name'] ."</option>";
			} ?></select></p>
		<?php } else { ?>
	  <input type="hidden" id="id_association" name="id_association" value="<?php echo $id_assoc; ?>" />
    <?php }?>

		<?php if ($_COOKIE['jimeluser']['profile'] >= 3) { ?>
		<p class="mbl clearfix">
			<label class="radio pull-left"><input type="radio" id="status" name="status" value="1" data-toggle="radio" <?php if ($status == 1) { echo "checked";} ?>>Ativo</label>
			<label class="radio pull-left mll"><input type="radio" id="status" name="status" value="2" data-toggle="radio" <?php if ($status == 0) { echo "checked";} ?>>Inativo</label>
		</p>
		<?php } else { ?>
	  <input type="hidden" id="status" name="status" value="<?php echo $status; ?>" />
    <?php }?>
		
		<button type="submit" class="btn btn-primary btn-sm mrm pull-left" name="action" value="save">Salvar</button>
	</form>

	<?php if ($_COOKIE['jimeluser']['profile'] >= 3) { ?>
	<form class="pull-right" method="post" action="usuarios.php">
		<input type="hidden" name="id_user" value="<?php echo $dados['id_user']; ?>">
		<input type="hidden" name="action" value="del">
		<input type="hidden" name="name" value="<?php echo $fname ." ". $lname; ?>">
		<input type="submit"  class="btn btn-danger btn-sm pull-right" value="Excluir"/>
	</form>
  <?php }?>
	<?php
}
if ($_POST['action'] == 'save' && $_POST['id_user'] > 0) {
	$date = str_replace('/', '-', $_REQUEST['bdate']);
	$date = date('Y-m-d', strtotime($date));
	
	$u = array(
						 'id_user' => $_REQUEST['id_user'],
						 'fname' => $_REQUEST['fname'],
						 'lname' => $_REQUEST['lname'],
						 'pwd' => $_REQUEST['pwd'],
						 'email' => $_REQUEST['email'],
						 'bdate' => $date,
						 'rg' => $_REQUEST['rg'],
						 'cpf' => $_REQUEST['cpf'],
						 'id_association' => $_REQUEST['id_association'],
						 'phone' => $_REQUEST['phone'],
						 'is_staff' => $_REQUEST['staff'],
						 'profile' => $_REQUEST['profile'],
						 'gender' => $_REQUEST['gender'],
						 'status' => $_REQUEST['status']
						 );
  $dados = $db->updUser($u);
	if ($_COOKIE['jimeluser']['profile'] >= 3) {
		echo "<meta http-equiv='refresh' content='0; url=$base_pathusuarios.php'>";
	} else {
		echo "<meta http-equiv='refresh' content='0; url=$base_pathindex.php'>";
	}
}
elseif ($_POST['action'] == 'save') {
	$date = str_replace('/', '-', $_REQUEST['bdate']);
	$date = date('Y-m-d', strtotime($date));
	
	$u = array(
						 'uname' => $_REQUEST['uname'],
						 'fname' => $_REQUEST['fname'],
						 'lname' => $_REQUEST['lname'],
						 'pwd' => $_REQUEST['pwd'],
						 'email' => $_REQUEST['email'],
						 'bdate' => $date,
						 'rg' => $_REQUEST['rg'],
						 'cpf' => $_REQUEST['cpf'],
						 'id_association' => $_REQUEST['id_association'],
						 'phone' => $_REQUEST['phone'],
						 'is_staff' => $_REQUEST['staff'],
						 'profile' => $_REQUEST['profile'],
						 'gender' => $_REQUEST['gender'],
						 'status' => $_REQUEST['status']
						 );
						 
	include_once('connect.php');
	$conn = new Database();
	$dados = $db->addUser($u);
	echo "<meta http-equiv='refresh' content='0; url=$base_path/usuarios.php?h=". $dados ."'>";
}

if ($_POST['action'] == 'del') { ?>
	<h1>Excluir Usuário</h1>
	<div class="btn btn-danger mbl">Deseja realmente excluir o usuário <strong><?php echo $_POST['name']; ?></strong>? </br>Caso este usuário esteja associado a um atleta, o atleta associado também será removido.</div>
	<div class="clearfix">
	<input type="submit"  class="btn btn-default btn-wide pull-left" value="Não" onclick="javascript:history.back(-1);"/>
	<form class="pull-right" method="post" action="usuarios.php">
		<input type="hidden" name="id_user" value="<?php echo $_POST['id_user']; ?>">
		<input type="hidden" name="action" value="del_yes">
		<input type="submit"  class="btn btn-danger btn-wide pull-right" value="Excluir"/>
	</form>
	</div>

<?php
}

if ($_POST['action'] == 'del_yes') {
	print_r($_POST);
	$conn = new Database();
	$dados = $db->delUser($_POST['id_user']);
	echo "<meta http-equiv='refresh' content='0; url=$base_path/usuarios.php'>";
}

if (empty($_POST)) {
	/* List athletes */
	echo "<form class='pull-right' method='post' action='usuarios.php'><button class='btn btn-primary btn-sm' name='action' value='new'><span class='fui-plus'></span> Novo Usuário</button></form>";
	echo "<h1>Usuários</h1>";
	include_once('connect.php');
	$conn = new Database();
	if ($_COOKIE['jimeluser']['profile'] < 3) {
	  $dados = $db->getUsers($_COOKIE['jimeluser']['association']);
	} else {
		$dados = $db->getUsers();
	}
	$count = $db->rowCount();
	
	$prof = array(0 => 'Atleta',
								1 => 'Representante',
								2 => 'Representante',
								3 => 'Admin');
	
	?>
	<table class="table table-striped table-hover table-condensed">
		<thead>
			<tr>
				<th class="mobile-hidden">#</th>
				<th>Nome</th>
				<th class="mobile-hidden">Email</th>
				<th class="mobile-hidden">Fone</th>
				<th class="mobile-hidden">Igreja</th>
				<th class="mobile-hidden">Papel</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
	
		<tbody>
		<?php 
		echo "<form class='pull-right' method='post' action='usuarios.php'><input type='hidden' name='action' value='edit' />";
		for ($i = 0; $i < $count; $i++) {
			$rec = $i+1;
			echo "<tr><td class='mobile-hidden'>". $rec ."</td>";
			echo "<td>". $dados[$i]['firstname'] ." ". $dados[$i]['lastname'] ."</td>";
			echo "<td class='mobile-hidden'>". $dados[$i]['email'] ."</td>";
			echo "<td class='mobile-hidden'>". $dados[$i]['phone'] ."</td>";
			echo "<td class='mobile-hidden'>". $dados[$i]['church'] ."</td>";
			echo "<td class='mobile-hidden'>". $prof[$dados[$i]['profile']] ."</td>";
			if ($dados[$i]['is_staff'] > 0) { echo "<td>STAFF</td>"; } else { echo "<td></td>"; }
			echo "<td><button class='btn btn-primary btn-xs' name='id_user' value='". $dados[$i]['id_user'] ."'><span class='fui-new'></span> Editar</button></td>";		
			echo "</tr>";
		}
		echo "</form>";
	?>
		</tbody>
	</table>
<?php
}


include_once('bottom.php');
?>
