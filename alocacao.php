<?php
include_once('header.php');

include_once('connect.php');
$db = new Database();
?>
<h1>Alocação de Quadras</h1>

<?php
<<<<<<< HEAD
=======
/*
foreach ($tcount as $k => $v) {
  for ($i = 0; $i < $v; $i++) {
    $name = "Equipe ". $cat[$k]['name'] ." ". ($i + 1);
    $id_a = $i + 10;
    $id_e = 2;
    $id_c = $k;
    $db->query('INSERT INTO es_team (name, id_association, id_event, id_category) VALUES (:name, :id_association, :id_event, :id_category)');
    $db->bind(':name',          $name);
    $db->bind(':id_association',$id_a);
    $db->bind(':id_event',      $id_e);
    $db->bind(':id_category',   $id_c);
    //$db->execute();
  }
}
*/
>>>>>>> 8f7be24e9db536ac0a6d3fed46f808ee5e24821a
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
<<<<<<< HEAD
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
=======

$allowed = array(
                  1 => array(1,2),
                  2 => array(1,2,3,4),
                  3 => array(3,4),
                  4 => array(5),
                  5 => array(5),
                  6 => array(5)
);

$time_slots = 17;

$db->query('SELECT t.group, t.id_category, COUNT(t.id_category) AS count FROM vw_teams As t group by t.id_category, t.group');
$all_groups = $db->resultset();
//p($all_groups);
/*
Array
(
    [0] => Array
        (
            [group] => A
            [id_category] => 1
            [count] => 3
        )
*/

/*
$db->query('SELECT * FROM vw_teams AS t ORDER BY t.id_category ASC, t.group ASC');
$rows = $db->resultset();
//p($rows);

/*
Array
(
    [0] => Array
        (
            [id] => 12
            [team_name] => Equipe Feminino 2
            [color] => 
            [status] => ATIVO
            [group] => A
            [entity_id] => 11
            [entity] => IMeL Embura
            [id_category] => 1
            [category] => Feminino
            [id_event] => 2
            [num_athletes] => 0
        )
*/
for($i = 0; $i < count($all_groups); $i++) {
  $id_c = $all_groups[$i]['id_category'];
  $id_g = $all_groups[$i]['group'];
  $db->query("SELECT id FROM vw_teams AS t WHERE t.id_category = $id_c AND t.group = '$id_g' ORDER BY t.id_category ASC, t.group ASC");
  $row = $db->resultset();
  for($a = 0; $a < count($row); $a++) {
    $arr[$a] = $row[$a]['id'];
  }
  $game = $db->combo($arr);
  foreach($game as $v) {
    $sq = $v['Sequence'];
    $games[$sq][$id_c][$id_g] = array($v['Team A'],$v['Team B']);
  }
}
//p($games);
$quadra = array();
$slot = 0;

for($r = 0; $r < count($games); $r++) {
  for($c = 1; $c <= count($games[$r]; $c++)) {
    for($a = 1; $a <= 5; $a++) {
    
    }
  }
}


//p($games);

>>>>>>> 8f7be24e9db536ac0a6d3fed46f808ee5e24821a

?>

  </tbody>
</table>
<?php

include_once('bottom.php');
?>
