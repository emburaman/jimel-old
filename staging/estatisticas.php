<?php
include_once('header.php');
if (!isset($_COOKIE['jimeluser']) || $_COOKIE['jimeluser'] < 3) {
	echo "<span class='btn btn-danger'>Você não tem permissão para visualizar esta página.</span>";
	exit;
} ?>

<h1>Estatísticas</h1>

<?php
include_once('connect.php');
$db = new Database();

$db->query('SELECT COUNT(id_team) AS num FROM es_team');
$db->execute();
$num = $db->resultset();
?>
<p><?php echo $num[0]['num']; 
if ($num[0]['num'] == 1) { ?> equipe cadastrada<?php } else { ?> equipes cadastradas<?php } ?>.</p>

<?php
$db->query('SELECT COUNT(*) AS total FROM es_athlete');
$num = $db->resultset();?>
<p><?php echo $num[0]['total']; 
if ($num == 1) { ?> atleta cadastrado<?php } else { ?> atletas cadastrados<?php } ?>.</p>
<?php

$db->query('SELECT a.name AS association FROM es_team AS e LEFT JOIN es_association AS a ON e.id_association = a.id_association GROUP BY association');
$db->execute();
$num = $db->rowCount();
$rows = $db->resultset();
?>
<p><?php echo $num; 
if ($num == 1) { ?> igreja participante <?php } else { ?> igrejas participantes<?php } ?>:<br />
<ul>
<?php
for ($i = 0; $i < count($rows); $i++) {
	echo "<li><small>". $rows[$i]['association'] ."</small></li>";
}
?>
</ul>
</p>
<?php


include_once('bottom.php');
?>
