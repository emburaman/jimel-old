<?php
include_once('header.php');

include_once('connect.php');
$db = new Database();
?>
<h1>Alocação de Quadras</h1>

<?php
/*
foreach ($tcount as $k => $v) {
  for ($i = 0; $i < $v; $i++) {
    $name = "Equipe ". $cat[$k]['name'] ." ". ($i + 1);
    $id_a = $i + 10;
    $id_e = 2;
    $id_c = $k;
    $db->query('INSERT INTO es_team (name, id_association, id_event, id_category) VALUES (:name, :id_association, :id_event, :id_category)');
    $db->bind(':name',          $name);
    $db->bind(':id_association',$id_a);
    $db->bind(':id_event',      $id_e);
    $db->bind(':id_category',   $id_c);
    //$db->execute();
  }
}
*/
$qua   = array('A','B','C','D','E');

?>
<table class="table table-striped table-hover table-condensed table-bordered">
  <thead>
    <tr>
      <th>Horário</th>
      <?php
      foreach ($qua as $v) {
        print "<th>Quadra $v</th>";
      }
      ?>
    </tr>
  </thead>
  <tbody>
<?php
$time = mktime(9, 0, 0, 8, 16, 2014);
$interval = /*time() + */ (30 * 60); // 30 minutos * 60 segundos

$allowed = array(
                  1 => array(1,2),
                  2 => array(1,2,3,4),
                  3 => array(3,4),
                  4 => array(5),
                  5 => array(5),
                  6 => array(5)
);

$time_slots = 17;

$db->query('SELECT t.group, t.id_category, COUNT(t.id_category) AS count FROM vw_teams As t group by t.id_category, t.group');
$all_groups = $db->resultset();
//p($all_groups);
/*
Array
(
    [0] => Array
        (
            [group] => A
            [id_category] => 1
            [count] => 3
        )
*/

/*
$db->query('SELECT * FROM vw_teams AS t ORDER BY t.id_category ASC, t.group ASC');
$rows = $db->resultset();
//p($rows);

/*
Array
(
    [0] => Array
        (
            [id] => 12
            [team_name] => Equipe Feminino 2
            [color] => 
            [status] => ATIVO
            [group] => A
            [entity_id] => 11
            [entity] => IMeL Embura
            [id_category] => 1
            [category] => Feminino
            [id_event] => 2
            [num_athletes] => 0
        )
*/
for($i = 0; $i < count($all_groups); $i++) {
  $id_c = $all_groups[$i]['id_category'];
  $id_g = $all_groups[$i]['group'];
  $db->query("SELECT id FROM vw_teams AS t WHERE t.id_category = $id_c AND t.group = '$id_g' ORDER BY t.id_category ASC, t.group ASC");
  $row = $db->resultset();
  for($a = 0; $a < count($row); $a++) {
    $arr[$a] = $row[$a]['id'];
  }
  $game = $db->combo($arr);
  foreach($game as $v) {
    $sq = $v['Sequence'];
    $games[$sq][$id_c][$id_g] = array($v['Team A'],$v['Team B']);
  }
}
//p($games);
$quadra = array();
$slot = 0;

for($r = 0; $r < count($games); $r++) {
  for($c = 1; $c <= count($games[$r]; $c++)) {
    for($a = 1; $a <= 5; $a++) {
    
    }
  }
}


//p($games);


?>

  </tbody>
</table>
<?php

include_once('bottom.php');
?>
