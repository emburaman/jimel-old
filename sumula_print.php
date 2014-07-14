<?php
function p($v) {
	print '<pre>';
	print_r($v);
	print '</pre>';
}
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>JIMEL</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Loading Bootstrap --><link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- Loading Flat UI   --><link href="css/flat-ui.css" rel="stylesheet">
    <!-- Loading Custom UI --><link href="css/style.css" rel="stylesheet">
		<link rel="stylesheet" href="css/farbtastic.css" type="text/css" />
		
    <link rel="shortcut icon" href="images/favicon.ico">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="sumula"><?php

include_once('connect.php');

$db = new Database();

/* List a game */
$id = $_POST['id_game'];
$db->query('SELECT * FROM vw_games WHERE id_game ='. $id);
$game = $db->single();

$db->query('SELECT SUM(result) AS placar FROM vw_score WHERE id_score_type = 1 AND id_game = '. $id .' AND id_team = '. $game['id_team_a']);
$scoreA = $db->single();
$db->query('SELECT SUM(result) AS placar FROM vw_score WHERE id_score_type = 1 AND id_game = '. $id .' AND id_team = '. $game['id_team_b']);
$scoreB = $db->single();

if ($scoreA['placar'] == null) { $scoreA['placar'] = 0; }
if ($scoreB['placar'] == null) { $scoreB['placar'] = 0; }


$time = explode(" ", $game['date_time']);
$time = $time[1];
?>
<div class="sumula">

<hr class="field-color cat_<?php print $game['id_category']; ?>" />

<table class="teams">
	<tr class="teams">
		<td align="right"><h4><?php echo $game['team_a'];?></h4><?php echo $game['entity_a'];?></td>
		<td width="1"><span class="score btn btn-inverse "><?php echo $scoreA['placar'];?></span></td>
		<td align="center">x</td>
		<td width="1"><span class="score btn btn-inverse"><?php echo $scoreB['placar'];?></span></td>
		<td><h4><?php echo $game['team_b'];?></h4><?php echo $game['entity_a'];?></td>
	</tr>
</table>

<table class="game-data">
	<tr>
		<td><small>Jogo Nº</small><h5><?php print $game['id_game']; ?></h5></td>
		<td><small>Categoria</small><h5><?php print $game['category']; ?></h5></td>
		<td><small>Horário</small><h5><?php print $time; ?></h5></td>
		<td><small>Quadra</small><h5><?php print $game['quadra']; ?></h5></td>
	</tr>
	<tr>
		<td colspan="2" width="50%"><small>Árbitro</small><h5>&nbsp;</h5></td>
		<td colspan="2"><small>Assinatura</small><h5>&nbsp;</h5></td>
	</tr>
	<tr>
		<td colspan="2"><small>Mesário</small><h5>&nbsp;</h5></td>
		<td colspan="2"><small>Assinatura</small><h5>&nbsp;</h5></td>
	</tr>
</table>

<table class="team-members">
	<tr>

<?php
$teams = array($game['id_team_a'],$game['id_team_b']);

foreach($teams as $x => $t) { 
	$subs = $db->getSubscribed($t, 2);
	
	if ($x > 0) { echo '<td></td>'; }
?>
		<td colspan="2" valign="top">
			<table class="game-data team">
				<tr>
					<th>Nº</th>
					<th>Jogadores</th>
					<th width="1">Gols</th>
					<th colspan="5">Faltas</th>
					<th>Am.</th>
					<th>Ver.</th>
					<th width="1">Faltas&nbsp;Coletivas</th>
				</tr>
			
			<?php 
			for ($a = 0; $a < count($subs); $a++) { 
				$score = $db->getScore($id, $subs[$a]['id_subscription']);

				$gols  = 0;
				$fouls = 0;
				$reds  = 0;
				$yels  = 0;
				for ($i = 0; $i < count($score); $i++) {
					if ($score[$i]['id_score_type'] == 1) { $gols  = $score[$i]['result']; }
					if ($score[$i]['id_score_type'] == 2) { $fouls = $score[$i]['result']; }
					if ($score[$i]['id_score_type'] == 3) { $reds  = $score[$i]['result']; }
					if ($score[$i]['id_score_type'] == 4) { $yels  = $score[$i]['result']; }
				}
				?>
				<tr>
					<td width="1"><strong class="pull-right"><?php echo $subs[$a]['jersey_num']; ?></strong></td>
					<td class='athlete'><?php echo $subs[$a]['firstname'] .' '. $subs[$a]['lastname']; ?></td>
					<td></td>
					<td class="min-col">1</td>
					<td class="min-col">2</td>
					<td class="min-col">3</td>
					<td class="min-col">4</td>
					<td class="min-col"></td>
					<td></td>
					<td></td>
					<?php if ($a == 0) {?>
					<td rowspan="12" align="center">
					<table class="fouls">
						<tr>
							<th>1º</th>
							<th>2º</th>
						</tr>
						<tr><td>1</td><td>1</td></tr>
						<tr><td>2</td><td>2</td></tr>
						<tr><td>3</td><td>3</td></tr>
						<tr><td>4</td><td>4</td></tr>
						<tr><td>&nbsp;</td><td>&nbsp;</td></tr>
					</table>
					
					</td>
					<?php }?>
				</tr>
				<?php
			}
			if ($a < 12) {
				for ($b = $a; $b < 12; $b++) { ?>
					<tr>
						<td></td>
						<td class='athlete'></td>
					<td></td>
					<td class="min-col">1</td>
					<td class="min-col">2</td>
					<td class="min-col">3</td>
					<td class="min-col">4</td>
					<td class="min-col"></td>
					<td></td>
					<td></td>
					</tr>
				<?php
				}
			}
			?>
					<tr>
						<td colspan="12">Assinatura do Capitão<br><br></td>
					</tr>
				</table>
		</td>
	<?php } ?>
	</tr>
</table>
</div>

<?php include_once('bottom.php'); ?>
