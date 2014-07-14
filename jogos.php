<?php
include_once('header.php');
include_once('connect.php');
$db = new Database();

/* New/Edit game */
if ($_REQUEST['action'] == 'new' || $_REQUEST['action'] == 'edit') {
	$status = 1;
	$cat = $_REQUEST['id_category'];
	
	if ($_REQUEST['action'] == 'new') {
		echo "<h1>Novo Jogo</h1>";
		$idCategory  = $_REQUEST['id_category'];
	} 
	/* Edit */
	if ($_REQUEST['action'] == 'edit') {
		echo "<h1>Editando Jogo</h1>"; 
	
		$dados = $db->getGame($_REQUEST['id_game']);
		$idGame      = $dados[0]['id_game'];
		$idCategory  = $dados[0]['id_category'];
		$idTeamA     = $dados[0]['id_team_a'];
		$idTeamB     = $dados[0]['id_team_b'];
		$idGamePlace = $dados[0]['id_game_place'];
		$idGroup     = $dados[0]['id_group'];
		$sequence    = $dados[0]['sequence'];
		$time        = explode(" ", $dados[0]['date_time']);
		$time      = $time[1];

		$cat = $idCategory;
	}	
	?>

	<form class="form-horizontal" id="new-game" method="post" action="jogos.php">
		<input type="hidden" name="id_event" value="2" />
		<input type="hidden" name="id_category" value="<?php echo $idCategory; ?>" />
		<input type="hidden" name="sequence" value="<?php echo $sequence; ?>" />
		<input type="hidden" name="id_game" value="<?php echo $idGame; ?>" />

		<fieldset>
		<div class="well bs-component">
			<div class="form-group"><label for="id_team_a" class="col-lg-2 control-label">Equipe A</label>
				<div class="col-lg-10"><select name="id_team_a" class="form-control"><option disabled="disabled" selected="selected">< Selecione uma equipe ></option>
			<?php
			$lsTeamA = $db->getTeams(null, null, $idCategory, 'id_group ASC');
			for ($i = 0; $i < $db->rowCount(); $i++) { 
				$chk = '';
				if ($lsTeamA[$i]['id'] == $idTeamA) { $chk = ' selected="selected"'; }
			?>
				<option value="<?php echo $lsTeamA[$i]['id']; ?>" <?php echo $chk; ?>><?php echo $lsTeamA[$i]['id_group'] .' - '. $lsTeamA[$i]['team_name']; ?> (<?php echo $lsTeamA[$i]['entity']; ?>)</option>
			<?php } ?>
			</select></div>
			</div>
		
			<div class="form-group"><label for="id_team_b" class="col-lg-2 control-label">Equipe B</label>
				<div class="col-lg-10"><select name="id_team_b" class="form-control"><option disabled="disabled" selected="selected">< Selecione uma equipe ></option>
			<?php
			$lsTeamB = $db->getTeams(null, null, $idCategory, 'id_group ASC');
			for ($i = 0; $i < $db->rowCount(); $i++) { 
				$chk = '';
				if ($lsTeamB[$i]['id'] == $idTeamB) { $chk = ' selected="selected"'; }
			?>
				<option value="<?php echo $lsTeamB[$i]['id']; ?>" <?php echo $chk; ?>><?php echo $lsTeamB[$i]['id_group'] .' - '. $lsTeamB[$i]['team_name']; ?> (<?php echo $lsTeamB[$i]['entity']; ?>)</option>
			<?php } ?>
			</select></div>
			</div>
		
			<div class="form-group"><label for="time" class="col-lg-2 control-label">Horário</label>
				<div class="col-lg-10"><input type="time" name="time" class="form-control" value="<?php echo $time; ?>"></div>
			</div>
	
			<div class="form-group"><label for="id_game_place" class="col-lg-2 control-label">Quadra</label>
				<div class="col-lg-10"><select name="id_game_place" class="form-control"><option disabled="disabled" selected="selected">< Selecione uma quadra ></option>
			<?php
			$quadra = $db->getGamePlaces();
			for ($i = 0; $i < $db->rowCount(); $i++) { 
				$chk = '';
				if ($quadra[$i]['id_game_place'] == $idGamePlace) { $chk = ' selected="selected"'; }
			?>
				<option value="<?php echo $quadra[$i]['id_game_place']; ?>" <?php echo $chk; ?>><?php echo $quadra[$i]['name']; ?></option>
			<?php } ?>
			</select></div>
			</div>

			<div class="form-group"><label for="id_group" class="col-lg-2 control-label">Grupo</label>
				<div class="col-lg-10"><select name="id_group" class="form-control"><option disabled="disabled" selected="selected">< Selecione um grupo (opcional) ></option>
			<?php
			$group = $db->getGroups($cat);
			for ($i = 0; $i < $db->rowCount(); $i++) { 
				$chk = '';
				if ($group[$i]['id_group'] == $idGroup) { $chk = ' selected="selected"'; }
			?>
				<option value="<?php echo $group[$i]['id_group']; ?>" <?php echo $chk; ?>><?php echo $group[$i]['id_group']; ?></option>
			<?php } ?>
			</select></div>
			</div>
		</div>
		
		<button type="submit" class="btn btn-success btn-lg pull-left" name="action" value="save">Salvar</button>
		<button type="submit" class="btn btn-danger btn-lg mll pull-right" name="action" value="del">Excluir</button>
		<a class='btn btn-default btn-lg pull-right' href='jogos.php'/><span class='fa fa-lg fa-angle-left fa-margin-right'></span> Voltar</a>
	</form>

<?php
}
/* Saving */
if ($_REQUEST['action'] == 'save' && $_REQUEST['id_game'] > 0) {
	$arr = array(
						 'id_game'        => $_REQUEST['id_game'],
						 'id_team_a'      => $_REQUEST['id_team_a'],
						 'id_team_b'      => $_REQUEST['id_team_b'],
						 'id_category'    => $_REQUEST['id_category'],
						 'id_event'       => $_REQUEST['id_event'],
						 'date_time'      => '2014-08-16 '. $_REQUEST['time'],
						 'id_game_place'  => $_REQUEST['id_game_place'],
						 'id_group'       => $_REQUEST['id_group'],
						 'sequence'       => $_REQUEST['sequence'],
						 );

	$dados = $db->updGame($arr);
	echo "<meta http-equiv='refresh' content='0; url=$base_path/jogos.php'>";
}
elseif ($_REQUEST['action'] == 'save') {
	$u = array(
						 'id_team_a'      => $_REQUEST['id_team_a'],
						 'id_team_b'      => $_REQUEST['id_team_b'],
						 'id_category'    => $_REQUEST['id_category'],
						 'id_event'       => $_REQUEST['id_event'],
						 'date_time'      => '2014-08-16 '. $_REQUEST['time'],
						 'id_game_place'  => $_REQUEST['id_game_place'],
						 'id_group'       => $_REQUEST['id_group'],
						 'sequence'       => $_REQUEST['sequence'],
						 );
		$dados = $db->addGame($u);
		echo "<meta http-equiv='refresh' content='0; url=$base_path/jogos.php'>";
}

if ($_REQUEST['action'] == 'del') { ?>
<div class="alert alert-dismissable alert-danger">
  <h4>Excluir Jogo!</h4>
  <p>Deseja realmente excluir o jogo nº<?php echo $_REQUEST['id_game']; ?>?</p>
</div>
	<div class="clearfix">
	<input type="submit"  class="btn btn-default btn-wide pull-left" value="Não" onclick="javascript:history.back(-1);"/>
	<form class="pull-right" method="post" action="jogos.php">
		<input type="hidden" name="id_game" value="<?php echo $_REQUEST['id_game']; ?>">
		<input type="hidden" name="action" value="del_yes">
		<input type="submit"  class="btn btn-danger btn-wide pull-right" value="Sim"/>
	</form>
	</div>
<?php
}

if ($_REQUEST['action'] == 'del_yes') {
	$db->delGame($_REQUEST['id_game']);
	echo "<meta http-equiv='refresh' content='0; url=$base_path/jogos.php'>";
}

/* LIST GAMES */
if (empty($_REQUEST)) {
	/* Get list of Categories */
	$categs = $db->getCategories();
	$cCount = $db->rowCount();

	/* List categories New Game Menu*/
	?>

<div class="btn-group pull-right">
  <button type="button" class="btn btn-info">Novo Jogo</button>
  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
  <ul class="dropdown-menu">
		<?php for ($c = 0; $c < count($categs); $c++) { ?>
		<li><a href="jogos.php?action=new&id_category=<?php echo $categs[$c]['id_category'] ?>"><?php echo $categs[$c]['name'] ?></a></li>
		<?php } ?>
  </ul>
</div>
	<?php
	echo "<h1><a name='top'></a>Jogos</h1>";
	
	for ($i = 0; $i < $cCount; $i++) {
		echo "<h4><a name='category_". $categs[$i]['id_category'] ."'></a>". $categs[$i]['name'] ."</h4>";
		?>
		<table class="table table-striped table-hover table-condensed">
			<thead>
				<tr>
					<th>#</th>
					<th>Horário</th>
					<th>Grupo</th>
					<th>Time A</th>
					<th></th><th></th>
					<th></th>
					<th>Time B</th>
					<th>Quadra</th>
					<th></th>
				</tr>
			</thead>
		
			<tbody>
			<?php 
			$games = $db->getGames($categs[$i]['id_category']);
			$gCount = $db->rowCount();

				for ($g = 0; $g < $gCount; $g++) {
					$gId = $games[$g]['id_game'];
					$gTime = date("d/m/Y h:i", strtotime($games[$g]['date_time']));
					$gPlace = $games[$g]['quadra'];
					$gGroup = $games[$g]['id_group'];
					$gTeamA = $games[$g]['team_a'];
					$gEntityTeamA = $games[$g]['entity_a'];
					$gTeamB = $games[$g]['team_b'];
					$gEntityTeamB = $games[$g]['entity_b'];
					$gScrA = $games[$g]['score_a'];
					$gScrB = $games[$g]['score_b'];
		
					echo "<tr><td>$gId</td>";
					echo "<td>$gTime</td>";
					echo "<td>$gGroup</td>";
					echo "<td>$gTeamA <small>($gEntityTeamA)</small></td>";
					echo "<td>$gScrA</td>";
					echo "<td>x</td>";
					echo "<td>$gScrB</td>";
					echo "<td>$gTeamB <small>($gEntityTeamB)</small></td>";
					echo "<td>$gPlace</td>";

					echo "<td align='right'>";
					if (isset($_COOKIE['jimeluser']) && $_COOKIE['jimeluser']['profile'] >= 3) { 
						echo "<form class='pull-right' method='post' action='sumula.php'><input type='hidden' name='action' value='edit' />
									<button class='btn btn-info btn-xs mls' name='id_game' value='". $gId ."'><span class='fa fa-lg fa-file-text-o fa-margin-right'></span> Súmula</button></form>";
						echo "<form class='pull-right' method='post' action='jogos.php'><input type='hidden' name='action' value='edit' />
									<button class='btn btn-info btn-xs' name='id_game' value='". $gId ."'><span class='fa fa-lg fa-pencil fa-margin-right'></span> Editar</button></form>";
					} else {
						echo "<form class='pull-right' method='post' action='sumula.php'><input type='hidden' name='action' value='edit' />
									<button class='btn btn-info btn-xs mls' name='id_game' value='". $gId ."'><span class='fa fa-lg fa-star-o fa-margin-right'></span> Votar</button></form>";
					}
					echo "</td>";
					echo "</tr>";
				}
				echo "</form>";
			?>
			</tbody>
		</table>
		<?php		
		echo "<a href='#category_". $categs[$i]['id_category'] ."' class='btn btn-default'>Início da Categoria</a> <a href='#top' class='btn btn-default'>Topo</a>";
		echo "<hr />";
	}
}

include_once('bottom.php');
?>
