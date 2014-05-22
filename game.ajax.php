<?php
include_once('connect.php');

$db = new Database();
$arr = $_POST;
$db->query('INSERT INTO es_score (id_subscription, id_game, id_score_type, value, timestamp) VALUES (:id_subscription, :id_game, :id_score_type, 1, NOW())');
$db->bind($arr['id_subscription']);
$db->bind($arr['id_game']);
$db->bind($arr['id_score_type']);
$db->execute();
?>