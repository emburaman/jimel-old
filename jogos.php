<?php
include_once('header.php');
if ($_COOKIE['jimeluser']['profile'] < 3) {
	echo "<span class='btn btn-danger'>Você não tem permissão para visualizar esta página.</span>";
	exit;
}

include_once('connect.php');
$db = new Database();

/* New/Edit game */
if ($_POST['action'] == 'new' || $_POST['action'] == 'edit') {
	$status = 1;
	$cat = $_POST['id_category'];
	
	if ($_POST['action'] == 'new') {
		echo "<h1>Novo Jogo</h1>";
		$idCategory  = $_REQUEST['id_category'];
	} 
	/* Edit */
	if ($_POST['action'] == 'edit') {
		echo "<a class='btn btn-default btn-wide pull-right' href='jogos.php'/>Voltar</a>
		      <h1>Editando Jogo</h1>"; 
	
		$dados = $db->getGame($_POST['id_game']);
		$idGame      = $dados[0]['id_game'];
		$idCategory  = $dados[0]['id_category'];
		$idTeamA     = $dados[0]['id_team_a'];
		$idTeamB     = $dados[0]['id_team_b'];
		$idGamePlace = $dados[0]['id_game_place'];
		$idGroup     = $dados[0]['id_group'];
		$time        = explode(" ", $dados[0]['date_time']);
		  $time      = $time[1];
	}	?>

	<form id="new-game" method="post" action="jogos.php">
		<input type="hidden" name="id_event" value="2" />
		<input type="hidden" name="id_category" value="<?php echo $idCategory; ?>" />
		<input type="hidden" name="id_game" value="<?php echo $idGame; ?>" />
		<p class="mbl"><label for="id_team_a">Equipe A:</label>
			<select name="id_team_a" class="form-control"><option disabled="disabled" selected="selected">< Selecione uma equipe ></option>
			<?php
			$lsTeamA = $db->getTeams(null, null, $idCategory);
			for ($i = 0; $i < $db->rowCount(); $i++) { 
				$chk = '';
				if ($lsTeamA[$i]['id'] == $idTeamA) { $chk = ' selected="selected"'; }
			?>
				<option value="<?php echo $lsTeamA[$i]['id']; ?>" <?php echo $chk; ?>><?php echo $lsTeamA[$i]['team_name']; ?></option>
			<?php } ?>
			</select>
		</p>

		<p class="mbl"><label for="id_team_a">Equipe B:</label>
			<select name="id_team_b" class="form-control"><option disabled="disabled" selected="selected">< Selecione uma equipe ></option>
			<?php
			$lsTeamB = $db->getTeams(null, null, $idCategory);
			for ($i = 0; $i < $db->rowCount(); $i++) { 
				$chk = '';
				if ($lsTeamB[$i]['id'] == $idTeamB) { $chk = ' selected="selected"'; }
			?>
				<option value="<?php echo $lsTeamB[$i]['id']; ?>" <?php echo $chk; ?>><?php echo $lsTeamB[$i]['team_name']; ?></option>
			<?php } ?>
			</select>
		</p>
		
		<p class="mbl"><label for="time">Horário:</label>
			<input type="time" name="time" class="form-control" value="<?php echo $time; ?>">
		</p>
	
		<p class="mbl"><label for="id_game_place">Quadra:</label>
			<select name="id_game_place" class="form-control"><option disabled="disabled" selected="selected">< Selecione uma quadra ></option>
			<?php
			$quadra = $db->getGamePlaces();
			for ($i = 0; $i < $db->rowCount(); $i++) { 
				$chk = '';
				if ($quadra[$i]['id_game_place'] == $idGamePlace) { $chk = ' selected="selected"'; }
			?>
				<option value="<?php echo $quadra[$i]['id_game_place']; ?>" <?php echo $chk; ?>><?php echo $quadra[$i]['name']; ?></option>
			<?php } ?>
			</select>
		</p>

		<p class="mbl"><label for="id_group">Grupo:</label>
			<select name="id_group" class="form-control"><option disabled="disabled" selected="selected">< Selecione um grupo (opcional) ></option>
			<?php
			$group = $db->getGroups($cat);
			for ($i = 0; $i < $db->rowCount(); $i++) { 
				$chk = '';
				if ($group[$i]['id_group'] == $idGroup) { $chk = ' selected="selected"'; }
			?>
				<option value="<?php echo $group[$i]['id_group']; ?>" <?php echo $chk; ?>><?php echo $group[$i]['id_group']; ?></option>
			<?php } ?>
			</select>
		</p>
		<button type="submit" class="btn btn-primary btn-wide mrm pull-left" name="action" value="save">Salvar</button>
	</form>
	<form class="pull-right" method="post" action="jogos.php">
		<input type="hidden" name="id_game" value="<?php echo $idGame; ?>">
		<input type="hidden" name="action" value="del">
		<input type="submit"  class="btn btn-danger btn-wide pull-right" value="Excluir"/>
	</form>

<?php
}
/* Saving */
if ($_POST['action'] == 'save' && $_POST['id_game'] > 0) {
	$arr = array(
						 'id_game'        => $_REQUEST['id_game'],
						 'id_team_a'      => $_REQUEST['id_team_a'],
						 'id_team_b'      => $_REQUEST['id_team_b'],
						 'id_category'    => $_REQUEST['id_category'],
						 'id_event'       => $_REQUEST['id_event'],
						 'date_time'      => '2014-08-16 '. $_REQUEST['time'],
						 'id_game_place'  => $_REQUEST['id_game_place'],
						 'id_group'       => $_REQUEST['id_group'],
						 );

	$dados = $db->updGame($arr);
	echo "<meta http-equiv='refresh' content='0; url=/jogos.php?h=". $_REQUEST['id_team'] ."'>";
}
elseif ($_POST['action'] == 'save') {
	$u = array(
						 'id_team_a'      => $_REQUEST['id_team_a'],
						 'id_team_b'      => $_REQUEST['id_team_b'],
						 'id_category'    => $_REQUEST['id_category'],
						 'id_event'       => $_REQUEST['id_event'],
						 'date_time'      => '2014-08-16 '. $_REQUEST['time'],
						 'id_game_place'  => $_REQUEST['id_game_place'],
						 'id_group'       => $_REQUEST['id_group'],
						 );
	
		$dados = $db->addGame($u);
		echo "<meta http-equiv='refresh' content='0; url=/jogos.php?h=". $dados ."'>";
}

if ($_POST['action'] == 'del') { ?>
	<h1>Excluir Atleta</h1>
	<div class="btn btn-danger mbl">Deseja realmente excluir o jogo nº<?php echo $_POST['id_game']; ?>?</div>
	<div class="clearfix">
	<input type="submit"  class="btn btn-default btn-wide pull-left" value="Não" onclick="javascript:history.back(-1);"/>
	<form class="pull-right" method="post" action="jogos.php">
		<input type="hidden" name="id_game" value="<?php echo $_POST['id_game']; ?>">
		<input type="hidden" name="action" value="del_yes">
		<input type="submit"  class="btn btn-danger btn-wide pull-right" value="Excluir"/>
	</form>
	</div>

<?php
}

if ($_POST['action'] == 'del_yes') {
	$db->delGame($_POST['id_game']);
	echo "<meta http-equiv='refresh' content='0; url=/jogos.php'>";
}

/* LIST GAMES */
if (empty($_POST)) {
	/* Get list of Categories */
	$categs = $db->getCategories();
	$cCount = $db->rowCount();

	/* List categories New Game Menu*/
	?>
		<form class='pull-right' method='post' action='jogos.php'>
		<input type='hidden' name="action" value='new'>
		<div class="dropdown">
		<button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Novo Jogo<span class="caret"></span></button>
		<span class="dropdown-arrow dropdown-arrow-inverse"></span>
		<ul class="dropdown-menu dropdown-inverse">
		<?php for ($c = 0; $c < count($categs); $c++) { ?>
			<li><button class='btn btn-xs btn-inverse' name='id_category' value='<?php echo $categs[$c]['id_category'] ?>'><?php echo $categs[$c]['name'] ?></button></li>
			<?php } ?>
		</ul>
	</div>
	</form>
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
					<th></th
					><th></th>
					<th></th>
					<th>Time B</th>
					<th>Quadra</th>
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
					$gTeamB = $games[$g]['team_b'];
					$gScrA = $games[$g]['score_a'];
					$gScrB = $games[$g]['score_b'];
		
					echo "<tr><td>$gId</td>";
					echo "<td>$gTime</td>";
					echo "<td>$gGroup</td>";
					echo "<td>$gTeamA</td>";
					echo "<td>$gScrA</td>";
					echo "<td>x</td>";
					echo "<td>$gScrB</td>";
					echo "<td>$gTeamB</td>";
					echo "<td>$gPlace</td>";
					echo "<td align='right'>";
					echo "<form class='pull-right' method='post' action='sumula.php'><input type='hidden' name='action' value='edit' />
								<button class='btn btn-primary btn-xs' name='id_game' value='". $gId ."'><span class='fui-user'></span> Súmula</button></form>";
					echo "<form class='pull-right' method='post' action='jogos.php'><input type='hidden' name='action' value='edit' />
								<button class='btn btn-primary btn-xs' name='id_game' value='". $gId ."'><span class='fui-new'></span> Editar</button></form>";
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
