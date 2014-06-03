<?php
include_once('header.php');

include_once('connect.php');
$db = new Database();
?>
<h1>Alocação de Quadras</h1>

<?php
$cat   = array(
               1 => array('id' => 1, 'name' => 'Feminino',  'groups' => array('A','B'),                     'quadras' => array('B')),
               2 => array('id' => 2, 'name' => 'Senior',    'groups' => array('A','B','C','D','E','F','G'), 'quadras' => array('A','B','C','D','E')),
               3 => array('id' => 3, 'name' => 'Mirim',     'groups' => array('A'),                         'quadras' => array('A')),
               4 => array('id' => 4, 'name' => 'Junior',    'groups' => array('A','B'),                     'quadras' => array('C', 'D')),
               5 => array('id' => 5, 'name' => 'Master',    'groups' => array('A','B'),                     'quadras' => array('D')),
               6 => array('id' => 6, 'name' => 'Veteranos', 'groups' => array('A','B'),                     'quadras' => array('E'))
              );

$qua   = array('A','B','C','D','E');
$tcount = array(
                1 => 6,
                2 => 15,
                3 => 5,
                4 => 7,
                5 => 6,
                6 => 4,
               );
asort($tcount);

$teams = array(
               1 => array('A' => array(1, 2, 3), 'B' => array(4, 5, 6)),
               2 => array('A' => array(1,2,3),'B' => array(4,5,6),'C' => array(7,8,9),'D' => array(10,11,12),'E' => array(13,14,15) /*,'F' => array(21,22,23,24),'G' => array(25,26,27)*/),
               3 => array('A' => array(1, 2, 3, 4, 5)),
               4 => array('A' => array(1, 2, 3, 4), 'B' => array(5, 6, 7)),
               5 => array('A' => array(1, 2, 3), 'B' => array(4, 5, 6)),
               6 => array('A' => array(1, 2, 3, 4)),
              );

/* Generate Games */
$g = 0;
foreach ($tcount as $tk => $tv) {
  foreach($teams[$tk] as $k => $t) {
    $rows[$tk][$k] = $db->combo($t);
  }
}

$num_groups = 0;
for ($x = 1; $x <= count($rows); $x++) {
  $qcount = count($cat[$x]['quadras']);
  $gc = 0;
  
  echo "<div class='col-md-12 clearfix'>";
  foreach ($rows[$x] as $kc => $vc) {
    $num_groups++;
    print "<p class='col-md-3'>". $cat[$x]['name'] ." - Grupo ". $kc ."<br />";
    for ($y = 0; $y < count($vc); $y++) {
      print "<small>(". $vc[$y]['Sequence'] .")". $vc[$y]['Team A'] ." x ". $vc[$y]['Team B'] ."</small><br />";
      $g++;
      $gc++;
      $all_games[$g] = array('id_category' => $cat[$x]['id'], 'group' => $kc, 'team_a' => $vc[$y]['Team A'], 'team_b' => $vc[$y]['Team B'], 'sequence' => $vc[$y]['Sequence'], 'quadras' => $cat[$x]['quadras']);
    }
    echo "</p>";
  }
  echo "<p class='col-md-12 clearfix'><small>$gc Jogos na categoria ". $cat[$x]['name'] ."</small></p></div><hr class='col-md-12 clearfix' />";
  $gcount[$x] = $gc;
}
echo "$g Jogos";

/* Get overall number of groups */


/* Get categories sequence */
$i = 0;
foreach ($tcount as $k => $v) {
  $cat_seq[$i] = $k;
  $i++;
}
//p($gcount);
//p($cat_seq);
//p($num_groups);
//p($rows);

function cmp($a, $b) {
    return $a['sequence'] > $b['sequence'] ? 1 : -1;
}
usort($all_games,"cmp");
//p($all_games);
$last = end($all_games);

$iterations = array();
$int = 1;
$inttotal = 1;
for ($l = 0; $l < count($all_games); $l++) {
  if ($all_games[$l]['sequence'] == $int) {
    $inttotal++;
  } else {
    $int++;
    $inttotal = 1;
  }
  $iterations[$int] = $inttotal;
}
p($all_games);

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

$time_slots = 17;
$gseq = 1;
$slot = 0;
$line = 0;
//for($i = 1; $i <= $int; $i++) {
  for($a = 1; $a <= count($all_games); $a++) {
    $line++;
    if ($line == 1) { echo "<tr><td>". date("H:i", $time) ."</td>"; }
    echo "<td>(". $all_games[$a]['id_category'] .")". $all_games[$a]['team_a'] ." x ". $all_games[$a]['team_b'] ." [$a]</td>";
    /*
    foreach($qua as $v) {
      if(in_array($v, $all_games[$a]['quadras'])) {
      }
    }
    */
    if($line == 5) {
      echo "</tr>";
      $line = 0;
      $time = $time + $interval;
    }
  }
//}
/*

for($ts = 0; $ts < $time_slots; $ts++) {
  $curr_game = 0;
  echo "<tr>";
  if (date("H:i", $time) != '12:00' && date("H:i", $time) != '12:30') {
    print "<td>". date("H:i", $time) . "</td>";
    $q = 0;
    foreach($qua as $v) {
      $q++;
      echo "<td>";
      for($i = 1; $i <= count($all_games); $i++) {
        //p($all_games[$i]['quadras']);
        if(in_array($v, $all_games[$i]['quadras'])) {
          echo "sim";
        }
      }
      echo "</td>";
    }
  }
  $time += $interval;
  echo "</tr>";
}
*/

$pcount = 20;
//p($gcount);
//p($tcount);

?>

  </tbody>
</table>
<?php

include_once('bottom.php');
?>
