<?php 
$deadline = mktime(23,59,59,7,27,2014);
$today    = time();
$base_path = "";

if ($_POST['print'] == 'print') { $p = 'print '; }
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>JIMEL 2014</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="css/bootswatch.min.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel="stylesheet" href="css/style.css">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../bower_components/html5shiv/dist/html5shiv.js"></script>
      <script src="../bower_components/respond/dest/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
		<a name="top"></a>

    <div class="container">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 id="clock" class="pull-right panel-title"></h3>
				<h3 class="panel-title">JIMEL</h3>
			</div>
		</div>
		
<?php
/*include_once('header.php');*/

include_once('connect.php');
$db = new Database();

/* LIST GAMES */
if ($_REQUEST['showCategory']) {
	$category = $_REQUEST['showCategory'];
}
/* Get list of Categories */
$categs = $db->getCategories($category);
$cCount = $db->rowCount();


?>
<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">Classificação</h3>
	</div>
	<div class="panel-body">
		<ul class="ticker">
<?php
/* List categories */
for ($i = 0; $i < $cCount; $i++) {
	$id_cat = $categs[$i]['id_category'];

	$w = '';
	if ($_REQUEST['showGroup']) {
		$group = $_REQUEST['showGroup'];
		$w = " AND id_group = '$group'";
	}
	$db->query("SELECT * FROM es_group WHERE id_category = $id_cat $w");
	$groups = $db->resultset();
	
	for ($g = 0; $g<count($groups); $g++) {
		$lines = 4;
		$l = 0;
	
?><li>
<table class="table table-striped table-hover table-condensed classificacao">
	<thead>
		<tr>
			<th colspan="2"><?php print $categs[$i]['name']; ?> | Grupo <?php echo $groups[$g]['id_group']; ?></th>
			<th class="sm" title="Pontos">P</th>
			<th class="sm">J</th>
			<th class="sm">V</th>
			<th class="sm">E</th>
			<th class="sm">D</th>
			<th class="sm">SG</th>
			<th class="sm mobile-hidden">GP</th>
			<th class="sm mobile-hidden">GC</th>
			<th class="sm mobile-hidden">CV</th>
			<th class="sm mobile-hidden">CA</th>
			<th class="sm mobile-hidden">F</th>
		</tr>
	</thead>

	<tbody>
<?php
	
	$stand = $db->getStandings($id_cat, $groups[$g]['id_group']);
	for ($s = 0; $s < count($stand); $s++) {
		$l++;
	?>
		<tr>
			<td><?php echo $s+1; ?>º</td>
			<td><?php echo $stand[$s]['team_name']; ?></td>
			<td class="sm highlight"><?php echo $stand[$s]['points']; ?></td>
			<td class="sm"><?php echo $stand[$s]['plays']; ?></td>
			<td class="sm"><?php echo $stand[$s]['wins']; ?></td>
			<td class="sm"><?php echo $stand[$s]['draws']; ?></td>
			<td class="sm"><?php echo $stand[$s]['losses']; ?></td>
			<td class="sm"><?php echo $stand[$s]['goals_balance']; ?></td>
			<td class="sm mobile-hidden"><?php echo $stand[$s]['goals_for']; ?></td>
			<td class="sm mobile-hidden"><?php echo $stand[$s]['goals_against']; ?></td>
			<td class="sm mobile-hidden"><?php echo $stand[$s]['reds']; ?></td>
			<td class="sm mobile-hidden"><?php echo $stand[$s]['yellows']; ?></td>
			<td class="sm mobile-hidden"><?php echo $stand[$s]['fouls']; ?></td>
		</tr>
	<?php
	}
	while ($l < $lines) { ?>
		<tr><td class="sm highlight" colspan="13">&nbsp;</td></tr><?php
		$l++;
	}
?>
	</tbody>
</table></li>
<?php
	}
} 
	?></ul>
		</div>
	</div>

	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Próximos Jogos</h3>
		</div>
		<div class="panel-body">
			<ul class="upcomming-ticker">
			<?php 
			$games = $db->getNextGames($categs[$i]['id_category']);
			$gCount = $db->rowCount();

				for ($g = 0; $g < $gCount; $g++) { ?>
				<li><table class="table table-striped table-hover table-condensed">
				<?php 
					$gId = $games[$g]['id_game'];
					$gTime = date("H:i", strtotime($games[$g]['date_time']));
					$gPlace = $games[$g]['quadra'];
					$gGroup = $games[$g]['id_group'];
					$gTeamA = $games[$g]['team_a'];
					$gEntityTeamA = $games[$g]['entity_a'];
					$gTeamB = $games[$g]['team_b'];
					$gEntityTeamB = $games[$g]['entity_b'];
					$gScrA = $games[$g]['score_a'];
					$gScrB = $games[$g]['score_b'];
		
					echo "<td>$gTime</td>";
					echo "<td align='right'>$gTeamA<br/><small>($gEntityTeamA)</small></td>";
					echo "<td>x</td>";
					echo "<td>$gTeamB<br/><small>($gEntityTeamB)</small></td>";
					echo "<td>$gPlace</td>";
					echo "</tr>";
				?>
				</table></li><?php		
				}
			
			?>
			</ul>
		</div>
	</div>
	<?php

include_once('bottom.php');
?>
