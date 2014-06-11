<?php
include_once('header.php');

include_once('connect.php');
$db = new Database();
?>
<h1>Alocação de Quadras</h1>

<?php
$qua   = array('A','B','C','D','E');

?>
<table class="table table-striped table-hover table-condensed table-bordered">
  <thead>
    <tr>
      <th>Horário</th>
      <?php
      foreach ($qua as $v) {
        print "<th>Quadra $v</th>";
      }
      ?>
    </tr>
  </thead>
  <tbody>
<?php
$time = mktime(9, 0, 0, 8, 16, 2014);
$interval = /*time() + */ (30 * 60); // 30 minutos * 60 segundos
$time_slots = 18;

$qtd_teams = array( 1 => 7,
										2 => 17,
										3 => 6,
										4 => 4,
										5 => 6,
										6 => 4);

$teams_per_group = array(
										1 => 4,
										2 => 3,
										3 => 3,
										4 => 4,
										5 => 3,
										6 => 4);

$allowed_categories = array(
										'A' => array(2), 
										'B' => array(2), 
										'C' => array(1,4), 
										'D' => array(1,5,6), 
										'E' => array(3,5,6)
										);


/* Generate Games */ /*
foreach($teams_per_group as $k => $v) {
	$db->query("SELECT t.group AS grupo FROM vw_teams AS t WHERE t.id_category = $k GROUP BY grupo");
	$groups = $db->resultset();
	for($g = 0; $g < count($groups); $g++) {
		$qry = "SELECT id FROM vw_teams As t WHERE id_category = $k AND t.group ='". $groups[$g]['grupo'] ."' ORDER BY id";
		$db->query($qry);
		$teams = $db->resultset();
		$tt = array();
		for ($t = 0; $t < count($teams); $t++) {
			$tt[$t] = $teams[$t]['id'];
		}
		$db->groupMatches(2, $tt, $groups[$g]['grupo']);
	}
}
*/
//$db->getGames();
$db->query('UPDATE es_game SET alloc = 0');
$db->execute();


$cc = 0;
$skip_check = array();

for($t = 0; $t < $time_slots; $t++) {
	$skip = array();
	print "<tr><td>". date("H:i", $time) ."</td>";
	if(date("H:i", $time) == "12:00" || date("H:i", $time) == "12:30") {
		print "<td colspan='5'>almoço</td>";
	} else {
		foreach ($qua as $v) {
			$inn = '';
			if(count($skip_check) > 0) {
				foreach($skip_check as $id) {
					if ($inn <> '') { $inn .= ','; }
					$inn .= $id;
				}
			}
			if(count($skip) > 0) {
				foreach($skip as $id) {
					if ($inn <> '') { $inn .= ','; }
					$inn .= $id;
				}
			}
			if ($inn != '') {
				$inn = "(id_team_a NOT IN ($inn) AND id_team_b NOT IN ($inn)) AND";
			}
			
			$db->query("SELECT * FROM es_game_place WHERE name = '$v'");
			$id_game_place = $db->single();
			$id_game_place = $id_game_place['id_game_place'];
			$cc++;
			$in = "";
			foreach($allowed_categories[$v] as $c) {
				if ($in <> "") { $in .= ","; }
				$in .= "$c";
			}
			$qry = "SELECT * FROM vw_games WHERE $inn id_category IN ($in) AND alloc = 0 ORDER BY sequence ASC LIMIT 1";
			$db->query($qry);
			$game = $db->resultset();
			if(count($game) > 0) {
				array_push($skip, $game[0]['id_team_a']);
				array_push($skip, $game[0]['id_team_b']);
			}
			
			if (count($game) == 0) { 
				print "<td>";
				print "</td>";
			} else {
				print "<td>";
				print "<p>". $game[0]['team_a'] ."</p><p>x</p><p>". $game[0]['team_b'] ."</p>";
				print "</td>";
				$qry = "UPDATE es_game SET date_time = '". date('Y-m-d H:i:s', $time) ."', id_game_place = $id_game_place, alloc = 1 WHERE id_game = ". $game[0]['id_game'];
				$db->query($qry);
				$db->execute();
			}
		}
	}
	$time += $interval;
	$skip_check = $skip;
	print "</tr>";
}

?>

  </tbody>
</table>
<?php

include_once('bottom.php');
?>
