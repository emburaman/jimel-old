<?php
include_once('header.php');
if (!isset($_COOKIE['jimeluser'])) {
	echo "<span class='btn btn-danger'>Você não tem permissão para visualizar esta página.</span>";
	exit;
}

include_once('connect.php');
$db = new Database();

/* New/Edit athlete */
if ($_POST['action'] == 'new' || $_POST['action'] == 'edit') {
	$status = 1;
	if ($_POST['action'] == 'new') {	echo "<h1>Novo Atleta</h1>"; }
	if ($_POST['action'] == 'edit') {
		echo "<h1>Editando Atleta</h1>"; 
		
		$dados = $db->getAthlete($_POST['user']);
		$count = $db->rowCount();
		//print_r($dados);
		
		$fname = $dados['firstname'];
		$lname = $dados['lastname'];
		$email = $dados['email'];
		$birthdate = date("d/m/Y", strtotime($dados['birthdate']));
		$rg = $dados['rg'];
		$cpf = $dados['cpf'];
		$status = $dados['status'];
		$gender = $dados['gender'];
		$id_association = $dados['id_association'];
	}
}

$err = 0;
if ($_POST['action'] == 'save') {
	if ($_POST['user']) { $user = $_POST['user']; } else { $user = $_POST['email']; }
	
	$date = str_replace('/', '-', $_POST['bdate']);
	$date = date('Y-m-d', strtotime($date));
	
	$u = array(
						 'uname' => $_POST['email'],
						 'id_user' => $user,
						 'fname' => $_POST['fname'],
						 'lname' => $_POST['lname'],
						 'email' => $_POST['email'],
						 'bdate' => $date,
						 'rg' => $_POST['rg'],
						 'cpf' => $_POST['cpf'],
						 'id_association' => $_POST['id_association'],
						 'status' => $_POST['status'],
						 'gender' => $_POST['gender'],
						 'id_event' => $_POST['id_event']
						 );

	$fname = $_POST['fname'];
	$lname = $_POST['lname'];
	$email = $_POST['email'];
	$birthdate = $_POST['bdate'];
	$rg = $_POST['rg'];
	$cpf = $_POST['cpf'];
	$status = $_POST['status'];
	$gender = $_POST['gender'];
	$id_association = $_POST['id_association'];

  $errmsg = '';
	if ($u['fname'] == '') { 
		$err = 1; 
		$errmsg .= 'O campo Nome é requerido.<br />';
	} 
	if ($u['lname'] == '') { 
		$err = 1; 
		$errmsg .= 'O campo Sobrenome é requerido.<br />';
	} 
	if ($u['email'] == '') { 
		$err = 1; 
		$errmsg .= 'O campo Email é requerido.<br />';
	} elseif (!filter_var($u['email'], FILTER_VALIDATE_EMAIL)) {
		$err = 1; 
		$errmsg .= 'Você deve informar um email válido.<br />';
	}
	if ($u['bdate'] == '') { 
		$err = 1; 
		$errmsg .= 'O campo Data de Nascimento é requerido.<br />';
	} elseif (!preg_match('/(0[1-9]|[12][0-9]|3[01])[\/.](0[1-9]|1[012])[\/.](19|20)\d\d/', $_POST['bdate'])) {
		$err = 1; 
		$errmsg .= 'O formato da Data de Nascimento '. $_POST['bdate'] .' é inválido, informe no formato dd/mm/aaaa.<br />';
	}
	if ($u['gender'] == '') { 
		$err = 1; 
		$errmsg .= 'O campo Sexo é requerido.<br />';
	} 
	
	if ($errmsg <> '') {
		echo '<div class="btn btn-danger mbl">'. $errmsg .'</div>';
	}
}

if ($_POST['action'] == 'new' || $_POST['action'] == 'edit' || $err > 0) {
	?>
	<form method="post" action="atletas.php">
	  <input type="hidden" name="id_user" value="<?php echo $dados['id_user']; ?>" />
	  <input type="hidden" name="id_event" value="2" />

		<?php if (($_POST['action'] == 'new' || $_POST['action'] == 'edit') && $_COOKIE['jimeluser']['profile'] < 3) { ?>
		<input type="hidden" name="id_association" value="<?php echo $_COOKIE['jimeluser']['association']; ?>" />
		<?php } ?>

		<p class="mbl"><input type="text"  name="fname" placeholder="Nome" class="form-control" value="<?php echo $fname; ?>" /></p>
		<p class="mbl"><input type="text"  name="lname" placeholder="Sobrenome" class="form-control" value="<?php echo $lname; ?>" /></p>
		<p class="mbl"><input type="email" name="email" placeholder="Email" class="form-control" value="<?php echo $email; ?>" /></p>
		<p class="mbl"><input type="text"  name="bdate" placeholder="Data de Nascimento" class="form-control" value="<?php echo $birthdate; ?>" /></p>
		<p class="mbl"><input type="text"  name="rg" placeholder="RG" class="form-control" value="<?php echo $rg; ?>" /></p>
		<p class="mbl"><input type="text"  name="cpf" placeholder="CPF" class="form-control" value="<?php echo $cpf; ?>" /></p>
		<p class="mbl clearfix">
			<label class="radio pull-left"><input type="radio" id="gender" name="gender" value="M" data-toggle="radio" <?php if ($gender == 'M') { echo "checked";} ?>>Masculino</label>
			<label class="radio pull-left mll"><input type="radio" id="gender" name="gender" value="F" data-toggle="radio" <?php if ($gender == 'F') { echo "checked";} ?>>Feminino</label>
		</p>

		<?php if ($_COOKIE['jimeluser']['profile'] >= 3) { ?>
		<p class="mbl"><select name="id_association" class="form-control"><option>< Selecione uma entidade ></option><?php
			$ents = $db->getEntities();
		  for ($i = 0; $i < $db->rowCount(); $i++) {
				$chk = '';
				if (isset($dados['id_association']) && ($ents[$i]['id_association'] == $dados['id_association'])) {
					$chk = 'selected';
				}
				echo "<option value='". $ents[$i]['id_association'] ."' $chk>". $ents[$i]['name'] ."</option>";
			} ?></select></p>
		<?php } ?>

		<?php if ($_COOKIE['jimeluser']['profile'] >= 3) { ?>
		<p class="mbl clearfix">
			<label class="radio pull-left"><input type="radio" name="status" value="1" data-toggle="radio" <?php if ($status == 1) { echo "checked";} ?>>Ativo</label>
			<label class="radio pull-left mll"><input type="radio" name="status" value="2" data-toggle="radio" <?php if ($status == 0) { echo "checked";} ?>>Inativo</label>
		</p>
		<?php } else { ?>
		<input type="hidden" name="status" value="<?php echo $status; ?>" />
		<?php } ?>
		
		<button type="submit" class="btn btn-primary btn-sm mrm pull-left" name="action" value="save">Salvar</button>
	</form>
	<form class="pull-right" method="post" action="atletas.php">
		<input type="hidden" name="id_user" value="<?php echo $dados['id_user']; ?>">
		<input type="hidden" name="action" value="del">
		<input type="hidden" name="name" value="<?php echo $fname ." ". $lname; ?>">
		<input type="submit"  class="btn btn-danger btn-sm pull-right" value="Excluir"/>
	</form>
	<?php
}
if ($err <= 0 && $_POST['action'] == 'save' && $_POST['id_user'] > 0) {
	$dados = $db->updAthlete($u);
	echo "<meta http-equiv='refresh' content='0; url=/atletas.php?h=". $_REQUEST['id_user'] ."'>";
}
elseif ($err <= 0 && $_POST['action'] == 'save') {
	$dados = $db->addAthlete($u);
	echo "<meta http-equiv='refresh' content='0; url=/atletas.php?h=". $dados ."'>";
}

if ($_POST['action'] == 'del') { ?>
	<h1>Excluir Atleta</h1>
	<div class="btn btn-danger mbl">Deseja realmente excluir o atleta <strong><?php echo $_POST['name']; ?></strong>?</div>
	<div class="clearfix">
	<input type="submit"  class="btn btn-default btn-wide pull-left" value="Não" onclick="javascript:history.back(-1);"/>
	<form class="pull-right" method="post" action="atletas.php">
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
	$dados = $conn->delAthlete($_POST['id_user']);
	echo "<meta http-equiv='refresh' content='0; url=/atletas.php'>";
}

if (empty($_POST)) {
	/* List athletes */
	echo "<form class='pull-right' method='post' action='atletas.php'><button class='btn btn-primary btn-sm' name='action' value='new'><span class='fui-plus'></span> Novo Atleta</button></form>";
	echo "<h1>Atletas</h1>";
	include_once('connect.php');
	$conn = new Database();
	if ($_COOKIE['jimeluser']['profile'] < 3) {
	  $dados = $conn->getAthletes($_COOKIE['jimeluser']['association']);
	} else {
		$dados = $conn->getAthletes();
	}
	$count = $conn->rowCount();
	?>
	<table class="table table-striped table-hover table-condensed">
		<thead>
			<tr>
				<th class='mobile-hidden'>#</th>
				<th>Nome</th>
				<th class='mobile-hidden'>Email</th>
				<th class='mobile-hidden'>Data de Nascimento</th>
				<th>Idade</th>
				<th></th>
			</tr>
		</thead>
	
		<tbody>
		<?php 
		echo "<form class='pull-right' method='post' action='atletas.php'><input type='hidden' name='action' value='edit' />";
		for ($i = 0; $i < $count; $i++) {
			$rec = $i+1;
			echo "<tr><td class='mobile-hidden'>". $rec ."</td>";
			echo "<td>". $dados[$i]['firstname'] ." ". $dados[$i]['lastname'] ."</td>";
			echo "<td class='mobile-hidden'>". $dados[$i]['email'] ."</td>";
			
			$newDate = date("d-m-Y", strtotime($dados[$i]['birthdate']));
			echo "<td class='mobile-hidden'>$newDate</td>";
			echo "<td>". $dados[$i]['age'] ."</td>";
			echo "<td><button class='btn btn-primary btn-xs' name='user' value='". $dados[$i]['id_user'] ."'><span class='fui-new'></span> Editar</button></td>";		
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
