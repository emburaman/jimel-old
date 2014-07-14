<?php
include_once('header.php');

include_once('connect.php');
$db = new Database();

/* LIST GAMES */
if (empty($_POST)) {
	/* Get list of Categories */
	$categs = $db->getCategories();
	$cCount = $db->rowCount();

	/* List categories */
	echo "<h1><a name='top'></a>Classificação</h1>";
	for ($i = 0; $i < $cCount; $i++) {
		$id_cat = $categs[$i]['id_category'];
		?>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title"><a name='category_$id_cat'></a><?php print $categs[$i]['name']; ?></h3>
			</div>
			<div class="panel-body">
		<?php
		$db->query("SELECT * FROM es_group WHERE id_category = $id_cat");
		$groups = $db->resultset();
		
		for ($g = 0; $g<count($groups); $g++) {
		
	?>
	<table class="table table-striped table-hover table-condensed classificacao">
		<thead>
			<tr>
				<th width="1">#</th>
				<th>Grupo <?php echo $groups[$g]['id_group']; ?></th>
				<th class="sm" title="Pontos">P</th>
				<th class="sm">J</th>
				<th class="sm">V</th>
				<th class="sm">E</th>
				<th class="sm">D</th>
				<th class="sm">SG</th>
				<th class="sm">GP</th>
				<th class="sm">GC</th>
				<th class="sm">CV</th>
				<th class="sm">CA</th>
				<th class="sm">F</th>
			</tr>
		</thead>
	
		<tbody>
	<?php
		
		$stand = $db->getStandings($id_cat, $groups[$g]['id_group']);
		for ($s = 0; $s < count($stand); $s++) {
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
				<td class="sm"><?php echo $stand[$s]['goals_for']; ?></td>
				<td class="sm"><?php echo $stand[$s]['goals_against']; ?></td>
				<td class="sm"><?php echo $stand[$s]['reds']; ?></td>
				<td class="sm"><?php echo $stand[$s]['yellows']; ?></td>
				<td class="sm"><?php echo $stand[$s]['fouls']; ?></td>
			</tr>
		<?php
		}
?>
		</tbody>
	</table>
	<?php
		}
		?>
			</div>
		</div>
		<?php
	} 
}


include_once('bottom.php');
?>
