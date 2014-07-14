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

?>
<a class="btn btn-default btn-lg pull-right" href="equipes.php"/><span class="fa fa-lg fa-angle-left fa-margin-right"></span> Voltar</a>
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
		$err = "<div class='alert alert-dismissable alert-danger'>
  <button type='button' class='close' data-dismiss='alert'>×</button>
  <p><strong>Oh-oh!</strong></p><p>Você está tentando escalar para este time mais atletas que o limite permitido de 12 atletas.</p></div>";
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
				<button class='btn btn-info btn-xs' name='id_team' value='". $dados['id'] ."'><span class='fa fa-pencil fa-margin-right'></span> Editar</button></td>";		
	echo "</tr>";
	echo "</form>";
?>
	</tbody>
</table>
<?php echo $err; ?>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
  <h4>Atletas Disponíveis</h4>
	<?php if ($counts >= 12) { ?>
	<div class='alert alert-dismissable alert-success'>
		<button type='button' class='close' data-dismiss='alert'>×</button>
		<p><strong>Parabéns!</strong> A escalação do seu time está completa e com o máximo de 12 atletas permitidos.</p>
		<p class="small">Se houverem mais atletas disponíveis nesta categoria, considere criar um novo time e escale os atletas novamente.</p></div>
	<?php } ?>
	<form method="post" action="escalacao.php">
	<input type="hidden" name="id_team" value="<?php echo $dados['id']?>">
	<input type="hidden" name="id_event" value="<?php echo $dados['id_event']?>">
	<input type="hidden" name="action" value="add">
	<?php 
	if ($counta <= 0 && $counts < 12 ) {
		if ($counts > 0) { $o = "outro"; }
		echo "<div class='alert alert-dismissable alert-info'>
  <button type='button' class='close' data-dismiss='alert'>×</button>
  <p><strong>Nota:</strong></p><p>Não existe nenhum $o atleta disponível para ser escalado para esta equipe.</p></div>";
	}
	for ($i=0;$i<$counta;$i++) {
		echo '<label class="checkbox" for="'. $dadosa[$i]['id_athlete'] .'"><input type="checkbox" value="'. $dadosa[$i]['id_athlete'] .'" name="athlete['. $dadosa[$i]['id_athlete'] .']" data-toggle="checkbox"><strong>'. $dadosa[$i]['jersey_num'] .'</strong>&nbsp;&nbsp;'. $dadosa[$i]['firstname'] .' '. $dadosa[$i]['lastname'] .'</label>'; 
	} 
	
	if ($counta > 0 && $counts < 12) {?>
		<button type="submit" class="btn btn-info btn-lg col-lg-12 col-md-12 col-sm-12 col-xs-12">Escalar <span class='fa fa-hand-o-right fa-margin-left'></span></button>
	<?php } ?>
	</form>
</div>
<div class="escalacao col-lg-6 col-md-6 col-sm-6 col-xs-6">
  <h4>Atletas Escalados</h4>
	<?php if ($counts <= 0) { ?>
	<div class='alert alert-dismissable alert-warning'>
	  <button type='button' class='close' data-dismiss='alert'>×</button>
  	<p><strong>Oops!</strong></p><p>Não existe nenhum atleta escalado para esta equipe.</p></div>
	<?php } elseif ($counts < 5) { ?>
	<div class='alert alert-dismissable alert-info'>
	  <button type='button' class='close' data-dismiss='alert'>×</button>
  	<p><strong>Opa!</strong> Este time ainda não possui o mínimo de 5 atletas inscritos necessários para participar do Jimel.</p></div>
	<?php } ?>
	<form method="post" action="escalacao.php">
	<input type="hidden" name="id_team" value="<?php echo $dados['id']?>">
	<input type="hidden" name="id_event" value="<?php echo $dados['id_event']?>">
	<input type="hidden" name="action" value="del">
	<?php 
	for ($i=0;$i<$counts;$i++) { 
		echo '<label class="escalado checkbox" for="'. $dadoss[$i]['id_athlete'] .'"><input type="checkbox" value="'. $dadoss[$i]['id_subscription'] .'" name="subscription['. $i .']" data-toggle="checkbox"><strong>'. $dadoss[$i]['jersey_num'] .'</strong>&nbsp;&nbsp;'. $dadoss[$i]['firstname'] .' '. $dadoss[$i]['lastname'] .'</label>'; 
	} 
	if ($counts > 0) {?>
		<button type="submit" class="btn btn-warning btn-lg desescalar col-lg-12 col-md-12 col-sm-12 col-xs-12" disabled="disabled"><span class='fa fa-hand-o-left fa-margin-right'></span> Remover</button>
		<?php }	?>
	</form>
</div>
<?php



include_once('bottom.php');
?>
