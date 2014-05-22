  <?php
  include_once('header.php');
  include_once('connect.php');
  
/*
  $arrA = array('A','B','C');
  $arrB = array('A','B','C','D');
  $arrC = array(39,34,14,29,26,38);
  
  function combo($arr) {
    $count = count($arr);
    $combo = array();
    $id = 0;
    
    for ($i = 0; $i < $count; $i++) {
      for ($x = $i+1; $x < $count; $x++) {
        $combo[$id] = array ('Team A' => $arr[$i], 'Team B' => $arr[$x]);
        $id++;
      }
    }
    return $combo;
  }
  */

  $db = new Database();

  /*
  $games = combo($arrC);
  for ($i = 0; $i < count($games); $i++) {
    print $db->addGame($games[$i]['Team A'], $games[$i]['Team B'], '2014-08-16 08:30:00');
    print " => ". $games[$i]['Team A'] ." x ". $games[$i]['Team B'] ."</br>";
  }
  */
if ($_POST['action'] == 'upd_sumula') {
	/*  ID_SCORE_TYPE
			-----------------
			1	Gol
			2	Falta
			3	Cartão Vermelho
			4	Cartão Amarelo
			5	Substituição
	*/

	$db->query('INSERT INTO es_score (id_subscription, id_game, id_score_type, value, timestamp) VALUES (:id_subscription, :id_game, :id_score_type, 1, NOW())');
	$db->bind(':id_subscription', $_POST['id_subscription']);
	$db->bind(':id_game',         $_POST['id_game']);
	$db->bind(':id_score_type',   $_POST['id_score_type']);
	$db->execute();

}
if ($_POST['action'] == 'fix') {
	echo '<a class="btn btn-default btn-wide pull-right" href="javascript:history.back(-1);"/>Voltar</a>';
	
}

if ($_POST['action'] != 'fix') {

  /* List a game */
  $id = $_POST['id_game'];
  $db->query('SELECT * FROM vw_games WHERE id_game ='. $id);
  $game = $db->single();
	
	$db->query('SELECT SUM(result) AS placar FROM jimel.vw_score WHERE id_score_type = 1 AND id_game = '. $id .' AND id_team = '. $game['id_team_a']);
	$scoreA = $db->single();
	$db->query('SELECT SUM(result) AS placar FROM jimel.vw_score WHERE id_score_type = 1 AND id_game = '. $id .' AND id_team = '. $game['id_team_b']);
	$scoreB = $db->single();
	
	if ($scoreA['placar'] == null) { $scoreA['placar'] = 0; }
	if ($scoreB['placar'] == null) { $scoreB['placar'] = 0; }
  ?>
  
  <table class="team-members">
    <tr class="teams">
      <td align="right"><h4><?php echo $game['team_a'];?></h4></td>
      <td width="1"><span class="score"><?php echo $scoreA['placar'];?></span></td>
      <td align="center">x</td>
      <td width="1"><span class="score"><?php echo $scoreB['placar'];?></span></td>
      <td><h4><?php echo $game['team_b'];?></h4></td>
    </tr>
  
  <?php
  $teamA = $db->getSubscribed($game['id_team_a'],2);
  $teamB = $db->getSubscribed($game['id_team_b'],2);
  ?>
    <tr>
      <td colspan="2" valign="top"><ul class="team team-a"><?php 
        for ($a = 0; $a < count($teamA); $a++) { 
					$score = $db->getScore($id, $teamA[$a]['id_subscription']);

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
          <li>
          <span class='athlete'><?php echo $teamA[$a]['firstname']; ?> <?php echo $teamA[$a]['lastname']; ?></span>
          <span class='pull-right'>
					<form method='post' id='sumula_<?php echo $teamA[$a]['id_subscription']; ?>'>
						<input type='hidden' name='action' value='upd_sumula'>
						<input type='hidden' name='id_subscription' value='<?php echo $teamA[$a]['id_subscription']; ?>'>
						<input type='hidden' name='id_game' value='<?php echo $id; ?>'>
						<button name="id_score_type" class='btn btn-xs btn-default goal' value='1'>Gols
							<?php if ($gols > 0) { ?><span class='total'><?php echo $gols; ?></span><?php } ?></button>
						<button name="id_score_type" class='btn btn-xs btn-inverse foul' value='2'>&nbsp;
							<?php if ($fouls > 0) { ?><span class='total'><?php echo $fouls; ?></span><?php } ?></button>
						<button name="id_score_type" class='btn btn-xs btn-danger card-red' value='3'>&nbsp;
							<?php if ($reds > 0) { ?><span class='total'><?php echo $reds; ?></span><?php } ?></button>
						<button name="id_score_type" class='btn btn-xs btn-warning card-yellow' value='4'>&nbsp;
							<?php if ($yels > 0) { ?><span class='total'><?php echo $yels; ?></span><?php } ?></button>
						<!--<button name="id_score_type" class='btn btn-xs btn-info subs' value='5'>></button> -->
						<button name="action" class='btn btn-xs btn-primary fui-new' value='fix'></button>
          </form>
					
          </span>
          </li>
					<?php
        }
        ?></ul>
      </td>
      <td></td>
      <td colspan="2" valign="top"><ul class="team team-b"><?php 
        for ($b = 0; $b < count($teamB); $b++) { 
					$score = $db->getScore($id, $teamB[$b]['id_subscription']);

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
          <li>
          <span class='athlete'><?php echo $teamB[$b]['firstname']; ?> <?php echo $teamB[$b]['lastname']; ?></span>
          <span class='pull-right'>
					<form method='post' id='sumula_<?php echo $teamB[$b]['id_subscription']; ?>'>
						<input type='hidden' name='action' value='upd_sumula'>
						<input type='hidden' name='id_subscription' value='<?php echo $teamB[$b]['id_subscription']; ?>'>
						<input type='hidden' name='id_game' value='<?php echo $id; ?>'>
						<button name="id_score_type" class='btn btn-xs btn-default goal' value='1'>Gols
							<?php if ($gols > 0) { ?><span class='total'><?php echo $gols; ?></span><?php } ?></button>
						<button name="id_score_type" class='btn btn-xs btn-inverse foul' value='2'>&nbsp;
							<?php if ($fouls > 0) { ?><span class='total'><?php echo $fouls; ?></span><?php } ?></button>
						<button name="id_score_type" class='btn btn-xs btn-danger card-red' value='3'>&nbsp;
							<?php if ($reds > 0) { ?><span class='total'><?php echo $reds; ?></span><?php } ?></button>
						<button name="id_score_type" class='btn btn-xs btn-warning card-yellow' value='4'>&nbsp;
							<?php if ($yels > 0) { ?><span class='total'><?php echo $yels; ?></span><?php } ?></button>
						<!--<button name="id_score_type" class='btn btn-xs btn-info subs' value='5'>></button> -->
						<button name="action" class='btn btn-xs btn-primary fui-new' value='fix'></button>
          </form>
          </span>
          </li>
					<?php
        }
        ?></ul>
      </td>
    </tr>
  
  </table>
<?php } ?>  
<?php include_once('bottom.php'); ?>
