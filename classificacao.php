<?php
include_once('header.php');
if ($_COOKIE['jimeluser']['profile'] < 3) {
	echo "<span class='btn btn-danger'>Você não tem permissão para visualizar esta página.</span>";
	exit;
}

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
		echo "<h4><a name='category_$id_cat'></a>". $categs[$i]['name'] ."</h4>";
		
		$db->query("SELECT * FROM es_group WHERE id_category = $id_cat");
		$groups = $db->resultset();
		
		for ($g = 0; $g<count($groups); $g++) {
		
	?>
	<table class="table table-striped table-hover table-condensed classificacao">
		<thead>
			<tr>
				<th width="1">#</th>
				<th>Equipe</th>
				<th class="sm">Grupo</th>
				<th class="sm">Pontos</th>
				<th class="sm">Jogos</th>
				<th class="sm">Vitórias</th>
				<th class="sm">Empates</th>
				<th class="sm">Derrotas</th>
				<th class="sm">Gols Marcados</th>
				<th class="sm">Gols Sofridos</th>
				<th class="sm">Cartões Vermelhos</th>
				<th class="sm">Cartões Amarelos</th>
				<th class="sm">Faltas</th>
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
				<td class="sm"><?php echo $stand[$s]['grupo']; ?></td>
				<td class="sm highlight"><?php echo $stand[$s]['points']; ?></td>
				<td class="sm"><?php echo $stand[$s]['plays']; ?></td>
				<td class="sm"><?php echo $stand[$s]['wins']; ?></td>
				<td class="sm"><?php echo $stand[$s]['draws']; ?></td>
				<td class="sm"><?php echo $stand[$s]['losses']; ?></td>
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
	} 
}


include_once('bottom.php');
?>
