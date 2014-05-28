<?php
include_once('header.php');
if (!isset($_COOKIE['jimeluser'])) {
	echo "<span class='btn btn-danger'>Você não tem permissão para visualizar esta página.</span>";
	exit;
}

include_once('connect.php');

/* New/Edit athlete */
if ($_POST['action'] == 'new' || $_POST['action'] == 'edit') {
	$status = 1;
	if ($_POST['action'] == 'new') {
		echo "<h1>Nova Equipe</h1>";
		$color = '#FFFFFF';
	}
	/* Edit */
	if ($_POST['action'] == 'edit') {
		echo "<a class='btn btn-default btn-wide pull-right' href='equipes.php'/>Voltar</a>
		      <h1>Editando Equipe</h1>"; 
		
		$conn = new Database();
		$dados = $conn->getTeam($_POST['id_team']);
		$count = $conn->rowCount();

		$name           = $dados['team_name'];
		$category       = $dados['id_category'];
		$color          = $dados['color'];
		$status         = $dados['status'];
		$id_association = $dados['entity_id'];
	}
	?>
	<form method="post" action="equipes.php">
	  <input type="hidden" name="id_team" value="<?php echo $_POST['id_team']; ?>" />

		<?php if (($_POST['action'] == 'new' || $_POST['action'] == 'edit') && $_COOKIE['jimeluser']['profile'] < 3) { ?>
		<input type="hidden" name="id_association" value="<?php echo $_COOKIE['jimeluser']['association']; ?>" />
		<?php } ?>


		<?php if ($_COOKIE['jimeluser']['profile'] < 3) { ?>
		<input type="hidden" name="id_event" value="<?php echo $dados['id_event']; ?>" />
		<?php } ?>
		<p class="mbl"><input type="text"  name="name" placeholder="Nome da Equipe" class="form-control" value="<?php echo $name; ?>" /></p>
		<p class="mbl"><input type="text" id ="color" name="color" placeholder="Escolha uma cor" class="form-control" value="<?php echo $color; ?>" /></p>
		
		<?php if ($_COOKIE['jimeluser']['profile'] >= 3) { ?>
		<p class="mbl"><select name="id_association" class="form-control"><option>< Selecione uma entidade ></option><?php
			$conne = new Database();
			$ents = $conne->getEntities();
		  for ($i = 0; $i < $conne->rowCount(); $i++) {
				$chk = '';
				if (isset($id_association) && ($ents[$i]['id_association'] == $id_association)) {
					$chk = 'selected';
				}
				echo "<option value='". $ents[$i]['id_association'] ."' $chk>". $ents[$i]['name'] ."</option>";
			} ?></select></p>
		<?php } ?>

		<p class="mbl"><select name="id_category" class="form-control"><option>< Selecione uma categoria ></option><?php
			$connc = new Database();
			$cats = $connc->getCategories();
		  for ($i = 0; $i < $connc->rowCount(); $i++) {
				$chk = '';
				if (isset($dados['id_category']) && ($cats[$i]['id_category'] == $dados['id_category'])) {
					$chk = 'selected';
				}
				echo "<option value='". $cats[$i]['id_category'] ."' $chk>". $cats[$i]['name'] ."</option>";
			} ?></select></p>

		<?php if ($_COOKIE['jimeluser']['profile'] >= 3) { ?>
		<p class="mbl"><select name="id_event" class="form-control"><option>< Selecione um evento ></option><?php
			$connv = new Database();
			$evts = $connv->getEvents();
		  for ($i = 0; $i < $connv->rowCount(); $i++) {
				$chk = '';
				if (isset($dados['id_event']) && ($evts[$i]['id_event'] == $dados['id_event'])) {
					$chk = 'selected';
				}
				echo "<option value='". $evts[$i]['id_event'] ."' $chk>". $evts[$i]['name'] ."</option>";
			} ?></select></p>
		<?php
		} else {
			echo '<input type="hidden" name="id_event" value="2" />';
		} ?>

		<?php if ($_COOKIE['jimeluser']['profile'] >= 3) { ?>
		<p class="mbl clearfix">
			<label class="radio pull-left"><input type="radio" name="status" value="1" data-toggle="radio" <?php if ($status == 1) { echo "checked";} ?>>Ativo</label>
			<label class="radio pull-left mll"><input type="radio" name="status" value="2" data-toggle="radio" <?php if ($status == 0) { echo "checked";} ?>>Inativo</label>
		</p>
		<?php } else { ?>
		<input type="hidden" name="status" value="<?php echo $status; ?>" />
		<?php } ?>

		<button type="submit" class="btn btn-primary btn-wide mrm pull-left" name="action" value="save">Salvar</button>
	</form>
	<form class="pull-right" method="post" action="equipes.php">
		<input type="hidden" name="id_team" value="<?php echo $_POST['id_team']; ?>">
		<input type="hidden" name="action" value="del">
		<input type="hidden" name="name" value="<?php echo $name; ?>">
		<input type="submit"  class="btn btn-danger btn-wide pull-right" value="Excluir"/>
	</form>
	<div id="colorpicker"></div>
	<?php
}
if ($_POST['action'] == 'save' && $_POST['id_team'] > 0) {
	$u = array(
						 'id_team'        => $_REQUEST['id_team'],
						 'name'           => $_REQUEST['name'],
						 'color'          => $_REQUEST['color'],
						 'id_category'    => $_REQUEST['id_category'],
						 'id_association' => $_REQUEST['id_association'],
						 'id_event'       => $_REQUEST['id_event'],
						 'status'         => $_REQUEST['status'],
						 );

	include_once('connect.php');
	$conn = new Database();
	$dados = $conn->updTeam($u);
	echo "<meta http-equiv='refresh' content='0; url=/equipes.php?h=". $_REQUEST['id_team'] ."'>";
}
elseif ($_POST['action'] == 'save') {
	$u = array(
						 'name'           => trim($_REQUEST['name']),
						 'color'          => $_REQUEST['color'],
						 'id_category'    => $_REQUEST['id_category'],
						 'id_association' => $_REQUEST['id_association'],
						 'id_event'       => $_REQUEST['id_event'],
						 'status'         => $_REQUEST['status'],
						 );
	include_once('connect.php');
	$conn = new Database();
	if ($conn->chkTeams($u['id_category'], $u['name'], $u['id_event'])) { ?>
		<h1>Nova Equipe</h1>
		<div class="btn btn-warning mbl">Já existe uma equipe chamada <strong><?php echo $u['name']; ?></strong> nesta categoria para sua igreja. Verifique a lista de equipes e tente novamente.</div>
		<div class="clearfix">
		<input type="submit"  class="btn btn-default btn-wide pull-left" value="Voltar" onclick="javascript:history.back(-1);"/>
		</div>
	
	<?php	
	} else {	
		$dados = $conn->addTeams($u);
		echo "<meta http-equiv='refresh' content='0; url=/equipes.php?h=". $dados ."'>";
	}
}

if ($_POST['action'] == 'del') { ?>
	<h1>Excluir Atleta</h1>
	<div class="btn btn-danger mbl">Deseja realmente excluir a Equipe <strong><?php echo $_POST['name']; ?></strong>? A associação de atletas a esta equipe serão removidos.</div>
	<div class="clearfix">
	<input type="submit"  class="btn btn-default btn-wide pull-left" value="Não" onclick="javascript:history.back(-1);"/>
	<form class="pull-right" method="post" action="equipes.php">
		<input type="hidden" name="id_team" value="<?php echo $_POST['id_team']; ?>">
		<input type="hidden" name="action" value="del_yes">
		<input type="submit"  class="btn btn-danger btn-wide pull-right" value="Excluir"/>
	</form>
	</div>

<?php
}

if ($_POST['action'] == 'del_yes') {
	$conn = new Database();
	$dados = $conn->delTeam($_POST['id_team']);
	echo "<meta http-equiv='refresh' content='0; url=/equipes.php'>";
}

if (empty($_POST)) {
	/* List athletes */
	echo "<form class='pull-right' method='post' action='equipes.php'><button class='btn btn-primary' name='action' value='new'><span class='fui-plus'></span> Adicionar Equipe</button></form>";
	echo "<h1>Equipes</h1>";
	include_once('connect.php');
	$conn = new Database();
	if ($_COOKIE['jimeluser']['profile'] < 3) {
	  $dados = $conn->getTeams($_COOKIE['jimeluser']['association'], 2, null);
	} else {
	  //$dados = $conn->getTeams();
	  $dados = $conn->getTeams(null, 2, null);
	}
	$count = $conn->rowCount();
	?>
	<table class="table table-striped table-hover table-condensed">
		<thead>
			<tr>
				<th class='mobile-hidden'>#</th>
				<th>Nome</th>
				<th class='mobile-hidden'>Atletas</th>
				<th class='mobile-hidden'>Cor</th>
				<th>Categoria</th>
				<th class='mobile-hidden'>Igreja</th>
				<th></th>
			</tr>
		</thead>
	
		<tbody>
		<?php 
		for ($i = 0; $i < $count; $i++) {
			$rec = $i+1;
			echo "<tr><td class='mobile-hidden'>". $rec ."</td>";
			echo "<td>". $dados[$i]['team_name'] ."</td>";
			echo "<td class='mobile-hidden'>". $dados[$i]['num_athletes'] ."</td>";
			echo "<td class='mobile-hidden'><span class='btn btn-xs team-color' style='background-color:". $dados[$i]['color'] ."'>&nbsp;&nbsp;&nbsp;</span></td>";
			echo "<td>". $dados[$i]['category'] ."</td>";
			echo "<td class='mobile-hidden'>". $dados[$i]['entity'] ."</td>";
			echo "<td align='right'>";
			echo "<form class='pull-right' method='post' action='escalacao.php'><input type='hidden' name='action' value='edit' />
						<button class='btn btn-primary btn-xs' name='id_team' value='". $dados[$i]['id'] ."'><span class='fui-user'></span> Escalação</button></form>";
			echo "<form class='pull-right' method='post' action='equipes.php'><input type='hidden' name='action' value='edit' />
						<button class='btn btn-primary btn-xs' name='id_team' value='". $dados[$i]['id'] ."'><span class='fui-new'></span> Editar</button></form>";
			echo "</td>";		
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
