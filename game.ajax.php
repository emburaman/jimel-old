<?php
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
$arr = $_POST;
$db->query('INSERT INTO es_score (id_subscription, id_game, id_score_type, value, timestamp) VALUES (:id_subscription, :id_game, :id_score_type, 1, NOW())');
$db->bind($arr['id_subscription']);
$db->bind($arr['id_game']);
$db->bind($arr['id_score_type']);
$db->execute();
?>