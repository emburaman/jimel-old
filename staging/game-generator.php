<?php
include_once('header.php');
if ($_COOKIE['jimeluser']['profile'] < 3) {
	echo "<span class='btn btn-danger'>Você não tem permissão para visualizar esta página.</span>";
	exit;
}

include_once('connect.php');
$db = new Database();

/* Generate Games */
//if ($_POST['action'] == 'new' || $_POST['action'] == 'generate') {
	$db->groupMatches(2, array(378,385,383,381), 'A');
	$db->groupMatches(2, array(379,384,391), 'B');
	$db->groupMatches(2, array(382,398,380), 'C');

//}
?>

	<form method="post" action="equipes.php">
	  <input type="hidden" name="id_team" value="<?php echo $_POST['id_team']; ?>" />
		<p class="mbl"><input type="text" id ="color" name="color" placeholder="Escolha uma cor" class="form-control" value="<?php echo $color; ?>" /></p>
		<p class="mbl clearfix">
			<label class="radio pull-left"><input type="radio" name="status" value="1" data-toggle="radio" <?php if ($status == 1) { echo "checked";} ?>>Ativo</label>
			<label class="radio pull-left mll"><input type="radio" name="status" value="2" data-toggle="radio" <?php if ($status == 0) { echo "checked";} ?>>Inativo</label>
		</p>
		<button type="submit" class="btn btn-primary btn-wide mrm pull-left" name="action" value="generate">Salvar</button>
	</form>
	<form class="pull-right" method="post" action="equipes.php">
		<input type="hidden" name="id_team" value="<?php echo $_POST['id_team']; ?>">
		<input type="hidden" name="action" value="del">
		<input type="hidden" name="name" value="<?php echo $name; ?>">
		<input type="submit"  class="btn btn-danger btn-wide pull-right" value="Excluir"/>
	</form>

<?php
include_once('bottom.php');
?>
