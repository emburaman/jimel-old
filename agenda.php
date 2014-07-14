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
?>
<h1>Agenda de Jogos</h1>

<?php
$qua   = array('A','B','C','D','E');

?>
<table class="table table-hover table-condensed table-bordered schedule">
  <thead>
    <tr>
      <th>Horário</th>
      <?php
      foreach ($qua as $v) {
        print "<th>Quadra $v</th>";
      }
      ?>
			<th>Staff em Quadra</th>
    </tr>
  </thead>
  <tbody>
<?php
$db->query('SELECT * FROM vw_games ORDER BY date_time ASC, quadra ASC');
$rows = $db->resultset();

$time = mktime(9, 0, 0, 8, 16, 2014);
$interval = /*time() + */ (30 * 60); // 30 minutos * 60 segundos
$time_slots = 21;

for ($i = 0; $i < count($rows); $i++) {
	$t = 0;
	$stf = array();
	foreach ($qua as $v) {
		$qry = "SELECT * FROM vw_games WHERE date_time = '". date("Y-m-d H:i:s", $time) ."' AND quadra = '$v'";
		$db->query($qry);
		$game = $db->resultset();
		
		if (count($game) > 0) {
			$db->query("SELECT * from vw_athletes WHERE is_staff = 1 AND id_team IN (". $game[0]['id_team_a'] .",". $game[0]['id_team_b'] .")");
			$staff = $db->resultset();
			for ($f = 0; $f < count($staff); $f++) {
				$stf[$f]['id_athlete'] = $staff[$f]['id_athlete'];
				$stf[$f]['firstname'] = $staff[$f]['firstname'];
				$stf[$f]['lastname'] = $staff[$f]['lastname'];
			}
		}
	
		if ($t == 0) {
			print "<tr><td>". date("H:i", $time) ."</td>";
		}
		print "<td class='". strtolower($game[0]['category']) ."'>";
		if (count($game) > 0) {
			print "<p>". $game[0]['team_a'] ."</p><p>x</p><p>". $game[0]['team_b'] ."</p>";
			echo "<form class='pull-right' method='post' action='sumula.php'><input type='hidden' name='action' value='edit' /><button class='btn btn-primary btn-xs' name='id_game' value='". $game[0]['id_game'] ."'><span class='fui-user'></span> Súmula</button></form>";
		}
		print "</td>";
		$t++;
	}
	print "<td>";
	if (count($stf) > 0) {
		for($f = 0; $f < count($stf); $f++) { print $stf[$f]['firstname'] ." ". $stf[$f]['lastname'] ."<br/>"; }
	}
	print "</td>";
	print "</tr>";
	$time += $interval;

	$time_slots--;
	if($time_slots <= 0) { break; }
}
?>

  </tbody>
</table>
<?php

include_once('bottom.php');
?>
