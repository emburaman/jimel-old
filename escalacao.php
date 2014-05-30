<?php
include_once('header.php');
if (!isset($_COOKIE['jimeluser'])) {
	echo "<span class='btn btn-danger'>Você não tem permissão para visualizar esta página.</span>";
	exit;
}
?>
<a class="btn btn-default btn-wide pull-right" href="equipes.php"/>Voltar</a>
<h1>Escalação da Equipe</h1>

<?php
include_once('connect.php');
$db = new Database();

/* Adding athletes to the team */
$dados = $db->getTeam($_POST['id_team']);
$ss = $db->getSubscribed($dados['id'], $dados['id_event']);
$ss = $db->rowCount();

$err = '';
if ($_POST['action'] == 'add') {
	if ((count($_POST['athlete']) + $ss) > 12) {
		$err = "<span class='btn btn-danger'>Você está tentando escalar para este time mais atletas que o limite permitido de 12 atletas.</span>";
	} else {
		foreach($_POST['athlete'] as $id) {
			$a = array(
								 'id_athlete' => $id,
								 'id_team'    => $_POST['id_team'],
								 'status'     => 1,
								 'id_event'   => $_POST['id_event'],
								 );
			$d_add = $db->addSubscription($a);
		}
	}
}

/* Removing Athletes from the team */
if ($_POST['action'] == 'del') {
	$d_del = $db->delSubscription($_POST['subscription']);
}

/* Preparing Lists */
/* List Team */
$dados = $db->getTeam($_POST['id_team']);
$count = $db->rowCount();
$dadoss = $db->getSubscribed($dados['id'], $dados['id_event']);
$counts = $db->rowCount();

$cats = $db->getCategories($dados['id_category']);
$minAge = $cats[0]['min_age'];
$maxAge = $cats[0]['max_age'];
$gender = null;
if ($cats[0]['gender'] == 'F' || $cats[0]['gender'] == 'M') {
	$gender = $cats[0]['gender'];
}

$dadosa = $db->getAvailable($dados['entity_id'], $dados['id_event'], $minAge, $maxAge, $dados['id_category'], $gender);
$counta = $db->rowCount();
?>
<table class="table table-striped table-hover table-condensed">
	<thead>
		<tr>
			<th>Nome</th>
			<th>Cor</th>
			<th>Categoria</th>
			<th>Igreja</th>
			<th></th>
		</tr>
	</thead>

	<tbody>
	<?php 
	echo "<form class='pull-right' method='post' action='equipes.php'><input type='hidden' name='action' value='edit' />";
	echo "<td>". $dados['team_name'] ."</td>";
	echo "<td><span class='btn btn-xs' style='background-color:". $dados['color'] ."'>&nbsp;&nbsp;&nbsp;</span></td>";
	echo "<td>". $dados['category'] ."</td>";
	echo "<td>". $dados['entity'] ."</td>";
	echo "<td align='right'>
				<button class='btn btn-primary btn-xs' name='id_team' value='". $dados['id'] ."'><span class='fui-new'></span> Editar</button></td>";		
	echo "</tr>";
	echo "</form>";
?>
	</tbody>
</table>
<?php echo $err; ?>
<div class="col-lg-6">
  <h4>Atletas Disponíveis</h4>
	<?php if ($counts >= 12) { ?>
		<p class="small">Este time possui o máximo permitido de atletas inscritos.</p>
	<?php } ?>
	<form method="post" action="escalacao.php">
	<input type="hidden" name="id_team" value="<?php echo $dados['id']?>">
	<input type="hidden" name="id_event" value="<?php echo $dados['id_event']?>">
	<input type="hidden" name="action" value="add">
	<?php 
	if ($counta <= 0) {
		echo "<span class='btn btn-warning'>Não existe nenhum atleta disponível para ser escalado para esta equipe.</span>";
	}
	for ($i=0;$i<$counta;$i++) {
		echo '<label class="checkbox" for="'. $dadosa[$i]['id_athlete'] .'"><input type="checkbox" value="'. $dadosa[$i]['id_athlete'] .'" name="athlete['. $dadosa[$i]['id_athlete'] .']" data-toggle="checkbox">'. $dadosa[$i]['firstname'] .' '. $dadosa[$i]['lastname'] .' <sup>'. $dadosa[$i]['age'] .'</sup></label>'; 
	} 
	
	if ($counta > 0 && $counts < 12) {?>
		<input type="submit" class="btn btn-primary btn-wide mrm" value="Escalar"/>
	<?php } ?>
	</form>
</div>
<div class="escalacao col-lg-6">
  <h4>Atletas Escalados</h4>
	<?php if ($counts <= 0) { ?>
		<span class='btn btn-info'>Não existe nenhum atleta escalado para esta equipe.</span>
	<?php } elseif ($counts < 5) { ?>
		<p class="small">Este time ainda não possui o mínimo de atletas inscritos necessários para participar do Jimel.</p>
	<?php } ?>
	<form method="post" action="escalacao.php">
	<input type="hidden" name="id_team" value="<?php echo $dados['id']?>">
	<input type="hidden" name="id_event" value="<?php echo $dados['id_event']?>">
	<input type="hidden" name="action" value="del">
	<?php 
	for ($i=0;$i<$counts;$i++) { 
		echo '<label class="escalado checkbox" for="'. $dadoss[$i]['id_athlete'] .'"><input type="checkbox" value="'. $dadoss[$i]['id_subscription'] .'" name="subscription['. $i .']" data-toggle="checkbox">'. $dadoss[$i]['firstname'] .' '. $dadoss[$i]['lastname'] .' <sup>'. $dadoss[$i]['age'] .'</sup></label>'; 
	} 
	if ($counts > 0) {?>
		<input type="submit" class="btn btn-primary btn-wide mrm pull-right desescalar" disabled="disabled" value="Remover"/>
	<?php }	?>
	</form>
</div>
<?php



include_once('bottom.php');
?>
