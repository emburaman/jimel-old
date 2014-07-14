<?php
include_once('header.php');
include_once('connect.php');

$db = new Database();

/* Fix sumula */
if ($_POST['action'] == 'fix') { 
	$motm = $_POST['motm'];
	$goals = $_POST['goals'];
	$owngoals = $_POST['own_goals'];
	$fouls = $_POST['fouls'];
	$yels = $_POST['yels'];
	$reds = $_POST['reds'];
	?>
	
	<div class="modal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">Editando <?php echo $_POST['athlete_name'];?></h4>
      </div>
      <div class="modal-body">
<form class="form-horizontal" method='post' id='sumula_<?php echo $_POST['id_subscription']; ?>'>
				<input type='hidden' name='action' value='fix_sumula'>
				<input type='hidden' name='id_subscription' value='<?php echo $_POST['id_subscription']; ?>'>
				<input type='hidden' name='id_game' value='<?php echo $_POST['id_game']; ?>'>
				
				<div class="form-group">
					<label class="col-md-3 control-label" for="score_type_motm">Craque do Jogo:</label>
					<div class="col-md-9"><input type="number"  name="score_type[motm]" placeholder="Gols" class="form-control col-md-6" value="<?php echo $motm; ?>" /></div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="score_type_goal">Gols:</label>
					<div class="col-md-9"><input type="number"  name="score_type[goal]" placeholder="Gols" class="form-control col-md-6" value="<?php echo $goals; ?>" /></div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="score_type_goal">Gols contra:</label>
					<div class="col-md-9"><input type="number"  name="score_type[own_goal]" placeholder="Gols Contra" class="form-control col-md-6" value="<?php echo $owngoals; ?>" /></div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="score_type_foul">Faltas:</label>
					<div class="col-md-9"><input type="number"  name="score_type[foul]" placeholder="Faltas" class="form-control" value="<?php echo $fouls; ?>" /></div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="score_type_yels">Cartões Amarelos:</label>
					<div class="col-md-9"><input type="number"  name="score_type[yels]" placeholder="Cartões Amarelos" class="form-control" value="<?php echo $yels; ?>" /></div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label" for="score_type_reds">Cartões Vermelhos:</label>
					<div class="col-md-9"><input type="number"  name="score_type[reds]" placeholder="Cartões Vermelhos" class="form-control" value="<?php echo $reds; ?>" /></div>
				</div>
				
			</div>
      <div class="modal-footer">
				<input type="submit"  class="btn btn-primary btn-wide pull-right" value="Salvar"/>
			</form>

			<form class="pull-left" method="post">
				<input type='hidden' name='id_game' value='<?php echo $_POST['id_game']; ?>'>
				<input type="hidden" name="action" value="edit">
				<input type="submit"  class="btn btn-default btn-wide pull-right" value="Cancelar"/>
			</form>      
      </div>
    </div>
  </div>
</div>
	
	<?php
}

if ($_POST['action'] == 'fix_sumula' && $_POST['id_subscription'] > 0 && $_POST['id_game'] > 0) {
	$new_score = $_POST['score_type'];

	$db->query('DELETE FROM es_score WHERE id_subscription = '. $_POST['id_subscription'] .' AND id_game = '. $_POST['id_game']);
	$db->execute();
	
	$newScore = $_POST['score_type'];
	foreach($new_score as $k => $v) {
		if ($k == 'goal') { $score_type = 1; }
		if ($k == 'own_goal') { $score_type = 6; }
		if ($k == 'foul') { $score_type = 2; }
		if ($k == 'yels') { $score_type = 4; }
		if ($k == 'reds') { $score_type = 3; }
		if ($k == 'motm') { $score_type = 7; }
		
		if($v > 0) {
			$db->query('INSERT INTO es_score (id_subscription, id_game, id_score_type, value, timestamp) VALUES (:id_subscription, :id_game, :id_score_type, :value, NOW())');
			$db->bind(':id_subscription', $_POST['id_subscription']);
			$db->bind(':id_game',         $_POST['id_game']);
			$db->bind(':value',           $v);
			$db->bind(':id_score_type',   $score_type);
			$db->execute();
		}
	}
}



if ($_POST['action'] == 'upd_sumula') {
	/*  ID_SCORE_TYPE
			-----------------
			1	Gol
			2	Falta
			3	Cartão Vermelho
			4	Cartão Amarelo
			5	Substituição
			6 Gol contra
			7 Votado como Craque do Jogo
	*/

	$db->query('INSERT INTO es_score (id_subscription, id_game, id_score_type, value, timestamp) VALUES (:id_subscription, :id_game, :id_score_type, 1, NOW())');
	$db->bind(':id_subscription', $_POST['id_subscription']);
	$db->bind(':id_game',         $_POST['id_game']);
	$db->bind(':id_score_type',   $_POST['id_score_type']);
	$db->execute();

}
if ($_POST['action'] == 'end') {
	$db->endGame($_POST['id_game'], $_POST['score_team_a'], $_POST['score_team_b'], $_POST['pastresult']);
	echo "<meta http-equiv='refresh' content='0; url=$base_path/jogos.php'>";
}


/* List a game */
$id = $_POST['id_game'];
$db->query('SELECT * FROM vw_games WHERE id_game ='. $id);
$game = $db->single();

$sql = 'SELECT ((COALESCE((SELECT SUM(result) FROM vw_score WHERE id_score_type = 1 AND id_game = '. $id .' AND id_team = '. $game['id_team_a'] .'),0)) + (COALESCE((SELECT SUM(result) FROM vw_score WHERE id_score_type = 6 AND id_game = '. $id .' AND id_team = '. $game['id_team_b'] .'),0))) AS placar FROM vw_score LIMIT 0,1';
$db->query($sql);
$scoreA = $db->single();

$sql = 'SELECT ((COALESCE((SELECT SUM(result) FROM vw_score WHERE id_score_type = 1 AND id_game = '. $id .' AND id_team = '. $game['id_team_b'] .'),0)) + (COALESCE((SELECT SUM(result) FROM vw_score WHERE id_score_type = 6 AND id_game = '. $id .' AND id_team = '. $game['id_team_a'] .'),0))) AS placar FROM vw_score LIMIT 0,1';
$db->query($sql);
$scoreB = $db->single();

if ($scoreA['placar'] == null) { $scoreA['placar'] = 0; }
if ($scoreB['placar'] == null) { $scoreB['placar'] = 0; }


$time = explode(" ", $game['date_time']);
$time = $time[1];
?>

<table class="table table-striped team-members">
	<tr class="teams">
		<td align="right"><h4><?php echo $game['team_a'];?></h4><?php echo $game['entity_a'];?></td>
		<td width="1"><span class="score btn btn-inverse "><?php echo $scoreA['placar'];?></span></td>
		<td align="center">x</td>
		<td width="1"><span class="score btn btn-inverse"><?php echo $scoreB['placar'];?></span></td>
		<td><h4><?php echo $game['team_b'];?></h4><?php echo $game['entity_a'];?></td>
	</tr>
	<tr>

<?php
$teams = array($game['id_team_a'],$game['id_team_b']);

$the_motm = $db->getMotm($id);

foreach($teams as $x => $t) { 
	$subs = $db->getSubscribed($t, 2);
	
	if ($x > 0) { echo '<td></td>'; }
?>
		<td colspan="2" valign="top">
			<table class="table table-hover team sumula"><?php 
			for ($a = 0; $a < count($subs); $a++) { 
				$score = $db->getScore($id, $subs[$a]['id_subscription']);

				$gols  = 0;
				$golsc = 0;
				$fouls = 0;
				$reds  = 0;
				$yels  = 0;
				$motm  = 0;
				for ($i = 0; $i < count($score); $i++) {
					if ($score[$i]['id_score_type'] == 1) { $gols  = $score[$i]['result']; }
					if ($score[$i]['id_score_type'] == 6) { $golsc = $score[$i]['result']; }
					if ($score[$i]['id_score_type'] == 2) { $fouls = $score[$i]['result']; }
					if ($score[$i]['id_score_type'] == 3) { $reds  = $score[$i]['result']; }
					if ($score[$i]['id_score_type'] == 4) { $yels  = $score[$i]['result']; }
					if ($score[$i]['id_score_type'] == 7) { $motm  = $score[$i]['result']; }
				}
				$pastteamresult[$x]['id_team'] = $t;
				
				?>
				<tr>
					<td><strong class="pull-right"><?php echo $subs[$a]['jersey_num']; ?></strong></td>
					<td class='athlete'><?php echo $subs[$a]['firstname'] .' '. $subs[$a]['lastname']; ?> <?php
					if ($game['is_finished'] == 1 && $subs[$a]['id_subscription'] == $the_motm['id_subscription']) { ?><span class="fa fa-star"></span><?php } ?></td>
					<td><span class='pull-right'>
					<form method='post' id='sumula_<?php echo $subs[$a]['id_subscription']; ?>'>
						<input type='hidden' name='action' value='upd_sumula'>
						<input type='hidden' name='id_subscription' value='<?php echo $subs[$a]['id_subscription']; ?>'>
						<input type='hidden' name='id_game' value='<?php echo $id; ?>'>

						<input type='hidden' name='athlete_name' value='<?php echo $subs[$a]['firstname'] .' '. $subs[$a]['lastname']; ?>'>
						<input type='hidden' name='goals' value='<?php echo $gols; ?>'>
						<input type='hidden' name='own_goals' value='<?php echo $golsc; ?>'>
						<input type='hidden' name='fouls' value='<?php echo $fouls; ?>'>
						<input type='hidden' name='yels' value='<?php echo $yels; ?>'>
						<input type='hidden' name='reds' value='<?php echo $reds; ?>'>
						<input type='hidden' name='motm' value='<?php echo $motm; ?>'>
						
						<?php if ($game['is_finished'] != 1) { ?>
							<button name="id_score_type" class='btn btn-sm btn-success' value='7' title="Craque do Jogo"><span class="fa fa-star"></span>
								<?php if ($motm > 0 && $_COOKIE['jimeluser']['profile'] == 3) { ?><span class='total'><?php echo $motm; ?></span><?php } ?></button>
						<?php } ?>
						
						<?php if ($_COOKIE['jimeluser']['profile'] == 3) { ?>
							<button name="id_score_type" class='btn btn-xs btn-link goal' value='1' title="Gol"><span class="sprite goal"></span>
								<?php if ($gols > 0) { ?><span class='total'><?php echo $gols; ?></span><?php } ?></button>
							<button name="id_score_type" class='btn btn-xs btn-link goal' value='6' title="Gol Contra"><span class="sprite own-goal"></span>
								<?php if ($golsc > 0) { ?><span class='total'><?php echo $golsc; ?></span><?php } ?></button>
							<button name="id_score_type" class='btn btn-xs btn-link foul' value='2' title="Falta"><span class="sprite foul"></span>
								<?php if ($fouls > 0) { ?><span class='total'><?php echo $fouls; ?></span><?php } ?></button>
							<button name="id_score_type" class='btn btn-xs btn-link card-red' value='3' title="Cartão Vermelho"><span class="sprite red-card"></span>
								<?php if ($reds > 0) { ?><span class='total'><?php echo $reds; ?></span><?php } ?></button>
							<button name="id_score_type" class='btn btn-xs btn-link card-yellow' value='4' title="Cartão Amarelo"><span class="sprite yellow-card"></span>
								<?php if ($yels > 0) { ?><span class='total'><?php echo $yels; ?></span><?php } ?></button>
							<button name="action" class='btn btn-sm btn-info' value='fix'><span class="fa fa-lg fa-pencil"></span></button>
						<?php } ?>
					</form></span>
					</td>
				</tr>
				<?php
			}
			?></table>
		</td>
	<?php } ?>
	</tr>
</table>
<hr />
<?php if ($_COOKIE['jimeluser']['profile'] == 3) { ?>
<p class="">
<form class="pull-left" method="post" action="sumula_print.php">
	<input type='hidden' name='id_game' value='<?php echo $_POST['id_game']; ?>'>
	<input type="hidden" name="print" value="print">
	<input type="submit"  class="btn btn-default btn-lg pull-right" value="Imprimir Súmula"/>
</form>

<form class="pull-right" method="post" action="sumula.php">
	<input type="hidden" name="id_game" value="<?php echo $_POST['id_game']; ?>">
	<input type="hidden" name="action" value="end">
	<input type="hidden" name="score_team_a" value="<?php echo $scoreA['placar'];?>">
	<input type="hidden" name="score_team_b" value="<?php echo $scoreB['placar'];?>">
	<input type="submit"  class="btn btn-primary btn-lg pull-right" value="Finalizar Jogo"/>
</form>
</p>
<?php } ?>
<?php include_once('bottom.php'); ?>
