<?php
include_once('header.php');
if (!isset($_COOKIE['jimeluser'])) { ?>
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
	if ($_POST['action'] == 'new') {
		echo "<h1>Nova Entidade</h1>";
		$color = '#FFFFFF';
	}
	/* Edit */
	if ($_POST['action'] == 'edit') {
		echo "<a class='btn btn-default btn-wide pull-right' href='entidades.php'/>Voltar</a>
		      <h1>Editando Entidade</h1>"; 
		
		$dados = $db->getAssociation($_POST['id_association']);
		$count = $db->rowCount();
	}
	?>
	<form method="post" action="entidades.php">
	  <input type="hidden" name="id_association" value="<?php echo $_POST['id_association']; ?>" />
	  <input type="hidden" name="type" value="1" />

		<p class="mbl"><input type="text"  name="name" placeholder="Nome da Equipe" class="form-control" value="<?php echo $dados[0]['name']; ?>" /></p>
		<p class="mbl"><select name="id_parent_association" class="form-control"><option>< Selecione uma entidade pai (opcional)></option><?php
			$ents = $db->getAssociation();
		  for ($i = 0; $i < $db->rowCount(); $i++) {
				if ($ents[$i]['id_association'] != $_POST['id_association']) { 
					$chk = '';
					if (isset($dados[0]['id_parent_association']) && ($ents[$i]['id_association'] == $dados[0]['id_parent_association'])) {
						$chk = 'selected';
					}
					echo "<option value='". $ents[$i]['id_association'] ."' $chk>". $ents[$i]['name'] ."</option>";
				}
			} ?></select></p>
		<button type="submit" class="btn btn-primary btn-wide mrm pull-left" name="action" value="save">Salvar</button>
	</form>
	
	<form class="pull-right" method="post" action="entidades.php">
	<?php if ($_POST['action'] == 'edit') { ?>
		<input type="hidden" name="id_association" value="<?php echo $_POST['id_association']; ?>">
		<input type="hidden" name="action" value="del">
		<input type="hidden" name="name" value="<?php echo $dados[0]['name']; ?>">
		<input type="submit"  class="btn btn-danger btn-wide pull-right" value="Excluir"/>
	<?php } ?>
	</form>
	<div id="colorpicker"></div>
	<?php
}
if ($_POST['action'] == 'save' && $_POST['id_association'] > 0) {
	$u = array(
						 'id_association' => $_REQUEST['id_association'],
						 'name'           => $_REQUEST['name'],
						 'type'           => $_REQUEST['type'],
						 'id_parent_association' => $_REQUEST['id_parent_association'],
						 );
	$dados = $db->updAssociation($u);
	echo "<meta http-equiv='refresh' content='0; url=$base_path/entidades.php?h=". $_REQUEST['id_association'] ."'>";
}
elseif ($_POST['action'] == 'save') {
	$u = array(
						 'id_association' => $_REQUEST['id_association'],
						 'name'           => $_REQUEST['name'],
						 'type'           => $_REQUEST['type'],
						 'id_parent_association' => $_REQUEST['id_parent_association'],
						 );
	if ($db->chkTeams($u['id_category'], $u['name'], $u['id_event'])) { ?>
		<h1>Nova Equipe</h1>
		<div class="btn btn-warning mbl">Já existe uma equipe chamada <strong><?php echo $u['name']; ?></strong> nesta categoria para sua igreja. Verifique a lista de equipes e tente novamente.</div>
		<div class="clearfix">
		<input type="submit"  class="btn btn-default btn-wide pull-left" value="Voltar" onclick="javascript:history.back(-1);"/>
		</div>
	
	<?php	
	} else {	
		$dados = $db->addTeams($u);
		echo "<meta http-equiv='refresh' content='0; url=$base_path/entidades.php?h=". $dados ."'>";
	}
}

if ($_POST['action'] == 'del') { ?>
	<h1>Excluir Atleta</h1>
	<div class="btn btn-danger mbl">Deseja realmente excluir a Equipe <strong><?php echo $_POST['name']; ?></strong>? A associação de atletas a esta equipe serão removidos.</div>
	<div class="clearfix">
	<input type="submit"  class="btn btn-default btn-wide pull-left" value="Não" onclick="javascript:history.back(-1);"/>
	<form class="pull-right" method="post" action="entidades.php">
		<input type="hidden" name="id_association" value="<?php echo $_POST['id_association']; ?>">
		<input type="hidden" name="action" value="del_yes">
		<input type="submit"  class="btn btn-danger btn-wide pull-right" value="Excluir"/>
	</form>
	</div>

<?php
}

if ($_POST['action'] == 'del_yes') {
	$dados = $db->delTeam($_POST['id_association']);
	echo "<meta http-equiv='refresh' content='0; url=$base_path/entidades.php'>";
}

if (empty($_POST) || $_POST['action'] == 'back') {
	/* List association */
	echo "<form class='pull-right' method='post' action='entidades.php'><button class='btn btn-primary' name='action' value='new'><span class='fui-plus'></span> Adicionar Entidade</button></form>";
	echo "<h1>Entidades</h1>";
  $dados = $db->getAssociation();
	$count = $db->rowCount();
	?>
	<table class="table table-striped table-hover table-condensed">
		<thead>
			<tr>
				<th class='mobile-hidden'>#</th>
				<th>Nome</th>
				<th class='mobile-hidden'>Entidade superior</th>
				<th></th>
			</tr>
		</thead>
	
		<tbody>
		<?php 
		for ($i = 0; $i < $count; $i++) {
			$rec = $i+1;
			echo "<tr><td class='mobile-hidden'>". $rec ."</td>";
			echo "<td>". $dados[$i]['name'] ."</td>";
			echo "<td class='mobile-hidden'>". $dados[$i]['parent'] ."</td>";
			echo "<td align='right'>";
			echo "<form class='pull-right' method='post' action='entidades.php'><input type='hidden' name='action' value='edit' />
						<button class='btn btn-primary btn-xs' name='id_association' value='". $dados[$i]['id_association'] ."'><span class='fui-new'></span> Editar</button></form>";
			echo "</td>";		
			echo "</tr>";
		}
		echo "</form>";
	?>
		</tbody>
	</table>
<?php
	echo "$count entidades listadas.";
}


include_once('bottom.php');
?>
