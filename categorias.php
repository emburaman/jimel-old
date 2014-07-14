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

/* New/Edit */
if ($_POST['action'] == 'new' || $_POST['action'] == 'edit') {
	$status = 1;
	if ($_POST['action'] == 'new') {
		echo "<h1>Nova Categoria</h1>";
		$color = '#FFFFFF';
	}
	/* Edit */
	if ($_POST['action'] == 'edit') {
		if ($_POST['id_category'] > 0 && $_POST['id_group'] != "") {
			$db->query('INSERT INTO es_group (id_category, id_group) VALUES (:id_category, :id_group)');
			$db->bind(':id_category', $_POST['id_category']);
			$db->bind(':id_group',    $_POST['id_group']);
			$db->execute();
		}
		if ($_POST['del_id_cat_group'] > 0) {
			$db->query('DELETE FROM es_group WHERE id_cat_group = '. $_POST['del_id_cat_group']);
			$db->execute();
		}
		echo "<a class='btn btn-default btn-wide pull-right' href='categorias.php'/>Voltar</a>
		      <h1>Editando Categoria</h1>"; 
		
		$db->query('SELECT * FROM es_category WHERE id_category = '. $_POST['id_category']);
		$dados = $db->resultset();
		$count = $db->rowCount();
	}

	?>
	<form method="post" action="categorias.php">
	  <input type="hidden" name="id_category" value="<?php echo $_POST['id_category']; ?>" />

		<p class="mbl"><input type="text"  name="name" placeholder="Nome da Equipe" class="form-control" value="<?php echo $dados[0]['name']; ?>" /></p>
		<button type="submit" class="btn btn-primary btn-wide mrm pull-left" name="action" value="save">Salvar</button>
	</form>
	
	<form class="pull-right" method="post" action="categorias.php">
	<?php if ($_POST['action'] == 'edit') { ?>
		<input type="hidden" name="id_category" value="<?php echo $_POST['id_category']; ?>">
		<input type="hidden" name="action" value="del">
		<input type="hidden" name="name" value="<?php echo $dados[0]['name']; ?>">
		<input type="submit"  class="btn btn-danger btn-wide pull-right" value="Excluir"/>
	<?php } ?>
	</form>
	
	<div class="clearfix"></div>
	<h5>Grupos desta Caegoria</h5>
	<table class="table table-striped table-hover table-condensed">
		<thead>
			<tr>
				<th class='mobile-hidden'>#</th>
				<th>Nome do Grupo</th>
				<th></th>
			</tr>
		</thead>
	
		<tbody>
	<?php
	$db->query('SELECT * FROM es_group WHERE id_category = '. $_POST['id_category']);
	$grupo = $db->resultset();

	for ($i = 0; $i < count($grupo); $i++) {
		$rec = $i+1;
		echo "<tr><td class='mobile-hidden'>". $rec ."</td>";
		echo "<td>". $grupo[$i]['id_group'] ."</td>";
		echo "<td align='right'>";
		echo "<form class='pull-right' method='post' action='categorias.php'><input type='hidden' name='action' value='edit' />
					<input type='hidden' name='id_category' value='". $grupo[$i]['id_category'] ."' />
					<button class='btn btn-danger btn-xs' name='del_id_cat_group' value='". $grupo[$i]['id_cat_group'] ."'><span class='fui-trash'></span> Excluir</button></form>";
		echo "</td>";		
		echo "</tr>";
	}
	echo "</form>";
	?>
		</tbody>
	</table>
	<?php
	echo "<form class='pull-right' method='post' action='categorias.php'><input type='hidden' name='action' value='new_group' />
				<input type='hidden' name='cat_name' value='". $dados[0]['name'] ."' />
				<button class='btn btn-primary btn-xs' name='id_category' value='". $_POST['id_category'] ."'><span class='fui-plus'></span> Adicionar Grupo</button></form>";
	echo "$i grupos listados.";
}
/* Category Groups */
if ($_POST['action'] == 'new_group' && $_POST['id_category'] > 0) {
	echo "<a class='btn btn-default btn-wide pull-right' href='categorias.php'/>Voltar</a>
				<h1>Novo Grupo na Categoria ". $_POST['cat_name'] ."</h1>"; 
	?>
	<form method="post" action="categorias.php">
	  <input type="hidden" name="id_category" value="<?php echo $_POST['id_category']; ?>" />

		<p class="mbl"><input type="text"  name="id_group" placeholder="Grupo" class="form-control" value="" /></p>
		<button type="submit" class="btn btn-primary btn-wide mrm pull-left" name="action" value="edit">Salvar</button>
	</form>
<?php	
}

/* Category */
if ($_POST['action'] == 'save' && $_POST['id_category'] > 0) {
	$u = array(
						 'id_category' => $_REQUEST['id_category'],
						 'name'           => $_REQUEST['name'],
						 'type'           => $_REQUEST['type'],
						 'id_parent_association' => $_REQUEST['id_parent_association'],
						 );
	$dados = $db->updAssociation($u);
	echo "<meta http-equiv='refresh' content='0; url=$base_path/categorias.php?h=". $_REQUEST['id_category'] ."'>";
}
elseif ($_POST['action'] == 'save') {
	$u = array(
						 'id_category' => $_REQUEST['id_category'],
						 'name'           => $_REQUEST['name'],
						 'type'           => $_REQUEST['type'],
						 'id_parent_association' => $_REQUEST['id_parent_association'],
						 );
	if ($db->chkTeams($u['id_category'], $u['name'], $u['id_event'])) { ?>
		<h1>Nova Equipe</h1>
		<div class="btn btn-warning mbl">Já existe uma equipe chamada <strong><?php echo $u['name']; ?></strong> nesta categoria para sua igreja. Verifique a lista de equipes e tente novamente.</div>
		<div class="clearfix">
		<input type="submit"  class="btn btn-default btn-wide pull-left" value="Voltar" onclick="javascript:history.back(-1);"/>
		</div>
	
	<?php	
	} else {	
		$dados = $db->addTeams($u);
		echo "<meta http-equiv='refresh' content='0; url=$base_path/categorias.php?h=". $dados ."'>";
	}
}

if ($_POST['action'] == 'del') { ?>
	<h1>Excluir Atleta</h1>
	<div class="btn btn-danger mbl">Deseja realmente excluir a Equipe <strong><?php echo $_POST['name']; ?></strong>? A associação de atletas a esta equipe serão removidos.</div>
	<div class="clearfix">
	<input type="submit"  class="btn btn-default btn-wide pull-left" value="Não" onclick="javascript:history.back(-1);"/>
	<form class="pull-right" method="post" action="categorias.php">
		<input type="hidden" name="id_category" value="<?php echo $_POST['id_category']; ?>">
		<input type="hidden" name="action" value="del_yes">
		<input type="submit"  class="btn btn-danger btn-wide pull-right" value="Excluir"/>
	</form>
	</div>

<?php
}

if ($_POST['action'] == 'del_yes') {
	$dados = $db->delTeam($_POST['id_category']);
	echo "<meta http-equiv='refresh' content='0; url=$base_path/categorias.php'>";
}

if (empty($_POST) || $_POST['action'] == 'back') {
	/* List  */
	echo "<form class='pull-right' method='post' action='categorias.php'><button class='btn btn-primary' name='action' value='new'><span class='fui-plus'></span> Adicionar Caegoria</button></form>";
	echo "<h1>Categorias</h1>";
  $db->query('SELECT * FROM es_category ORDER BY name ASC');
	$dados = $db->resultset();
	
	?>
	<table class="table table-striped table-hover table-condensed">
		<thead>
			<tr>
				<th class='mobile-hidden'>#</th>
				<th>Categoria</th>
				<th>Gênero</th>
				<th>Idade Mínima</th>
				<th>Idade Máxima</th>
				<th>Grupos</th>
				<th></th>
			</tr>
		</thead>
	
		<tbody>
		<?php 
		for ($i = 0; $i < count($dados); $i++) {
			$rec = $i+1;
			echo "<tr><td class='mobile-hidden'>". $rec ."</td>";
			echo "<td>". $dados[$i]['name'] ."</td>";
			echo "<td>". $dados[$i]['gender'] ."</td>";
			echo "<td>". $dados[$i]['min_age'] ."</td>";
			echo "<td>". $dados[$i]['max_age'] ."</td>";
			
			$db->query('SELECT * FROM es_group WHERE id_category = '. $dados[$i]['id_category']);
			$db->execute();
			$count = $db->rowCount();
			
			echo "<td>". $count ."</td>";
			echo "<td align='right'>";
			echo "<form class='pull-right' method='post' action='categorias.php'><input type='hidden' name='action' value='edit' />
						<button class='btn btn-primary btn-xs' name='id_category' value='". $dados[$i]['id_category'] ."'><span class='fui-new'></span> Editar</button></form>";
			echo "</td>";		
			echo "</tr>";
		}
		echo "</form>";
	?>
		</tbody>
	</table>
<?php
	echo "$i categorias listadas.";
}


include_once('bottom.php');
?>
