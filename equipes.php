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

/* GENERATE MASS DATA */ /*
if ($_REQUEST['action'] == 'mass') { 
	$start  = $_REQUEST['start_id'];
	$amount = $_REQUEST['amount'];
	
	$ents = $db->getEntities();
	$nume = $db->rowCount();

	$cats = $db->getCategories();
	$numc = $db->rowCount();

	for ($c = 0; $c < $numc; $c++) { 
		for ($e = 1; $e < $nume; $e++) { 
			for ($i = 0; $i < $amount; $i++) {
				$color = sprintf( "#%06X", mt_rand( 0, 0xFFFFFF ));
				
				$u = array(
									 'name'           => "Equipe ". $cats[$c]['name'] ." ". $start,
									 'color'          => $color,
									 'id_category'    => $cats[$c]['id_category'],
									 'id_association' => $ents[$e]['id_association'],
									 'id_event'       => 2,
									 'status'         => 1,
									 );
				$db->addTeams($u);
				//p($u['name'].'/'.$u['color'].'/'.$u['id_category'].'/'.$u['id_association'].'/'.$u['id_event'].'/'.$u['status']);
				$start++;
			}
		}
	}
	die("$start equipes criadas.");
}
/* ################## */



/* New/Edit athlete */
if ($_POST['action'] == 'new' || $_POST['action'] == 'edit' || $_POST['action'] == 'del') {
	$status = 1;
	if ($_POST['action'] == 'new') {
		echo "<h1>Nova Equipe</h1>";
		$color = '#FFFFFF';
	}
	/* Edit */
	if ($_POST['action'] == 'edit' || $_POST['action'] == 'del') {
		echo "<h1>Editando Equipe</h1>"; 
		
		$dados = $db->getTeam($_POST['id_team']);
		$count = $db->rowCount();
		$name           = $dados['team_name'];
		$category       = $dados['id_category'];
		$color          = $dados['color'];
		$status         = $dados['status'];
		$group          = $dados['id_group'];
		$id_association = $dados['entity_id'];
		
		/* Check if there is any athlete subscribed */
		$any = $db->getSubscribed($dados['id'], $dados['id_event']);
		$any = $db->rowCount();
	}
	if ($any > 0) {	?>
		<div class="alert alert-dismissable alert-info">
			<button type="button" class="close" data-dismiss="alert">×</button>
			<strong>Nota:</strong> <br />Existe pelo menos um atleta inscrito nesta equipe; para alterar a categoria deste time, primeiro remova os atletas.</div>
	<?php } ?>

	<form class="form-horizontal" method="post" action="equipes.php">
	  <input type="hidden" name="id_team" value="<?php echo $_POST['id_team']; ?>" />
		<?php if (($_POST['action'] == 'new' || $_POST['action'] == 'edit') && $_COOKIE['jimeluser']['profile'] < 3) { ?>
		<input type="hidden" name="id_association" value="<?php echo $_COOKIE['jimeluser']['association']; ?>" />
		<?php } ?>
		<?php if ($_COOKIE['jimeluser']['profile'] < 3) { ?>
		<input type="hidden" name="id_event" value="<?php echo $dados['id_event']; ?>" />
		<?php } ?>

		<fieldset>
		<div class="well bs-component">
			<div class="form-group"><label for="name" class="col-lg-2 control-label">Nome da Equipe</label>
				<div class="col-lg-10"><input type="text"  name="name" placeholder="Nome da Equipe" class="form-control" value="<?php echo $name; ?>" /></div>
			</div>

			<div class="form-group"><label for="name" class="col-lg-2 control-label" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Tooltip on bottom">Cor do Uniforme</label>
				<div class="col-lg-10"><input type="text" id ="color" name="color" placeholder="Escolha uma cor" class="color {hash:true} form-control" value="<?php echo $color; ?>" /></div>
			</div>
		
		<?php if ($_COOKIE['jimeluser']['profile'] >= 3) { ?>
			<div class="form-group"><label for="id_association" class="col-lg-2 control-label">Entidade</label>
				<div class="col-lg-10"><select name="id_association" class="form-control"><option>< Selecione uma entidade ></option><?php
			$conne = new Database();
			$ents = $conne->getEntities();
		  for ($i = 0; $i < $conne->rowCount(); $i++) {
				$chk = '';
				if (isset($id_association) && ($ents[$i]['id_association'] == $id_association)) {
					$chk = 'selected';
				}
				echo "<option value='". $ents[$i]['id_association'] ."' $chk>". $ents[$i]['name'] ."</option>";
			} ?></select></div>
			</div>
		<?php } ?>

		<?php
		if ($any > 0) {
			$dis = ' disabled="disabled"';  ?>
		<input type="hidden" name="id_category" value="<?php echo $dados['id_category']; ?>" />
		<?php } ?>
		<div class="form-group"><label for="id_category" class="col-lg-2 control-label">Categoria</label>
			<div class="col-lg-10"><select name="id_category" class="form-control" <?php echo $dis; ?>>
		<option>< Selecione uma categoria ></option><?php
		$connc = new Database();
		$cats = $connc->getCategories();
		for ($i = 0; $i < $connc->rowCount(); $i++) {
			$chk = '';
			if (isset($dados['id_category']) && ($cats[$i]['id_category'] == $dados['id_category'])) {
				$chk = 'selected';
			}
			echo "<option value='". $cats[$i]['id_category'] ."' $chk>". $cats[$i]['name'] ."</option>";
		} ?></select></div>
		</div>

		<?php if ($_COOKIE['jimeluser']['profile'] >= 3) { ?>
			<div class="form-group"><label for="id_event" class="col-lg-2 control-label">Evento</label>
				<div class="col-lg-10"><select name="id_event" class="form-control"><option>< Selecione um evento ></option><?php
			$connv = new Database();
			$evts = $connv->getEvents();
		  for ($i = 0; $i < $connv->rowCount(); $i++) {
				$chk = '';
				if (isset($dados['id_event']) && ($evts[$i]['id_event'] == $dados['id_event'])) {
					$chk = 'selected';
				}
				echo "<option value='". $evts[$i]['id_event'] ."' $chk>". $evts[$i]['name'] ."</option>";
			} ?></select></div>
			</div>
		<?php
		} else {
			echo '<input type="hidden" name="id_event" value="2" />';
		} ?>
    
		<?php if ($_COOKIE['jimeluser']['profile'] >= 3 && ($_POST['action'] == 'edit' || $_POST['action'] == 'del')) { ?>
			<div class="form-group"><label for="id_group" class="col-lg-2 control-label">Grupo</label>
				<div class="col-lg-10"><select name="id_group" class="form-control"><option>< Selecione um Grupo ></option><?php
			$db->query('SELECT * FROM es_group WHERE id_category = '. $dados['id_category']);
      $gp = $db->resultset();
		  for ($i = 0; $i < $db->rowCount(); $i++) {
				$chk = '';
				if (isset($group) && ($gp[$i]['id_group'] == $group)) {
					$chk = 'selected';
				}
				echo "<option value='". $gp[$i]['id_group'] ."' $chk>". $gp[$i]['id_group'] ."</option>";
			} ?></select></div>
			</div>
		<?php
		} else {
			echo '<input type="hidden" name="id_group" value="'. $group .'" />';
		} ?>

		<?php if ($_COOKIE['jimeluser']['profile'] >= 3) { ?>
		<div class="form-group"><label class="col-lg-2 control-label">Status</label>
			<div class="col-lg-10">
				<div class="radio"><label><input type="radio" name="status" value="1" data-toggle="radio" <?php if ($status == 1) { echo "checked";} ?>>Ativo</label></div>
				<div class="radio"><label><input type="radio" name="status" value="2" data-toggle="radio" <?php if ($status == 0) { echo "checked";} ?>>Inativo</label>
				</div>
			</div>
		</div>
		<?php } else { ?>
		<input type="hidden" name="status" value="<?php echo $status; ?>" />
		<?php } ?>

	</div>

			<button class="btn btn-primary btn-lg mrm pull-left" name="action" value="save"><span class="glyphicon glyphicon-floppy-disk fa-margin-right"></span>Salvar</button>
			<?php if ($_POST['action'] == 'edit' && $closed == 0) { ?>
			<button name="action" class="btn btn-danger btn-lg pull-right mll" value="del"><span class="fa fa-lg fa-trash-o fa-margin-right"></span>Excluir</button>
			<?php } ?>
			<button name="action" class="btn btn-default btn-lg pull-right" value="back"><span class="fa fa-lg fa-angle-left fa-margin-right"></span>Voltar</button>
		</fieldset>
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
						 'id_group'       => $_REQUEST['id_group'],
						 'status'         => $_REQUEST['status'],
						 );
	$dados = $db->updTeam($u);
	echo "<meta http-equiv='refresh' content='0; url=$base_path/equipes.php?h=". $_REQUEST['id_team'] ."'>";
}
elseif ($_POST['action'] == 'save') {
	$u = array(
						 'name'           => trim($_REQUEST['name']),
						 'color'          => $_REQUEST['color'],
						 'id_category'    => $_REQUEST['id_category'],
						 'id_association' => $_REQUEST['id_association'],
						 'id_event'       => $_REQUEST['id_event'],
						 'id_group'       => $_REQUEST['id_group'],
						 'status'         => $_REQUEST['status'],
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
		echo "<meta http-equiv='refresh' content='0; url=$base_path/equipes.php?h=". $dados ."'>";
	}
}

if ($_POST['action'] == 'del') { ?>
	<div class="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> -->
					<h4 class="modal-title">Excluir Equipe?</h4>
				</div>
				<div class="modal-body">
					<p>Deseja realmente excluir a Equipe <strong><?php echo $_POST['name']; ?></strong>?</p>
					<p>Todos os dados de partidas referente a esta equipe serão perdidos. A associação de atletas a esta equipe serão removidos.</p>
				</div>
				<div class="modal-footer">
					<input type="submit"  class="btn btn-success pull-left" value="Não" onclick="javascript:history.back(-1);"/>
					<form class="pull-right" method="post" action="equipes.php">
						<input type="hidden" name="id_team" value="<?php echo $_POST['id_team']; ?>">
						<input type="hidden" name="action" value="del_yes">
						<input type="submit"  class="btn btn-danger pull-right" value="Sim"/>
					</form>
				</div>
			</div>
		</div>
	</div>
<?php
}

if ($_POST['action'] == 'del_yes') {
	$dados = $db->delTeam($_POST['id_team']);
	echo "<meta http-equiv='refresh' content='0; url=$base_path/equipes.php'>";
}

if (empty($_POST) || $_POST['action'] == 'back') {
	/* List athletes */
	if ($closed == 0) {
		echo "<form class='pull-right' method='post' action='equipes.php'><button class='btn btn-primary btn-lg' name='action' value='new'><span class='fa fa-plus fa-margin-right'></span> Adicionar Equipe</button></form>";
	}
	echo "<h1>Equipes</h1>";
	if ($_COOKIE['jimeluser']['profile'] < 3) {
	  $dados = $db->getTeams($_COOKIE['jimeluser']['association'], 2, null);
	} else {
	  $dados = $db->getTeams(null, 2, null);
	}
	$count = $db->rowCount();
	?>
	<table class="table table-striped table-hover">
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
			echo "<td class='mobile-hidden'><span class='btn btn-xs team-color' style='background-color: ". $dados[$i]['color'] ."'>&nbsp;&nbsp;&nbsp;</span></td>";
			echo "<td>". $dados[$i]['category'] ."</td>";
			echo "<td class='mobile-hidden'>". $dados[$i]['entity'] ."</td>";
			echo "<td align='right'>";
			echo "<form class='pull-right' method='post' action='escalacao.php'><input type='hidden' name='action' value='edit' />
						<button class='btn btn-info btn-xs mls' name='id_team' value='". $dados[$i]['id'] ."'><span class='fa fa-users fa-margin-right'></span>Escalação</button></form>";
			echo "<form class='pull-right' method='post' action='equipes.php'><input type='hidden' name='action' value='edit' />
						<button class='btn btn-info btn-xs' name='id_team' value='". $dados[$i]['id'] ."'><span class='fa fa-pencil fa-margin-right'></span>Editar</button></form>";
			echo "</td>";		
			echo "</tr>";
		}
		echo "</form>";
	?>
		</tbody>
	</table>
<?php
	echo "$count equipes listadas.";
}


include_once('bottom.php');
?>
