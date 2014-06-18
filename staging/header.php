<?php 
$deadline = mktime(23,59,59,7,27,2014);
$today    = time();
$base_path = "/staging";
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>JIMEL</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Loading Bootstrap --><link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- Loading Flat UI   --><link href="css/flat-ui.css" rel="stylesheet">
    <!-- Loading Custom UI --><link href="css/style.css" rel="stylesheet">
		<link rel="stylesheet" href="css/farbtastic.css" type="text/css" />
		
    <link rel="shortcut icon" href="images/favicon.ico">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
      <div class="btn btn-danger mbl col-md-12">Você está navegando no ambiente de homologação do sistema.</div>
    <div class="container">
			<nav class="navbar navbar-inverse" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-01">
						<span class="sr-only">Toggle navigation</span>
					</button>
					<a class="navbar-brand pull-left" href="/">JIMEL</a>

          <div class="navbar-right pull-right mrl">
          <?php if (!isset($_COOKIE['jimeluser'])) {?>
            <a href="login.php" class="btn btn-default navbar-btn btn-xs" type="button">Log in</a>
          <?php } else {?><form class='pull-right' method='post' action='usuarios.php'><input type='hidden' name='action' value='edit' />
            <p class="navbar-text salutation">Bem-vindo <button class='btn btn-inverse btn-xs plx prx' name='id_user' value='<?php print $_COOKIE['jimeluser']['id_user']; ?>'><?php print $_COOKIE['jimeluser']['firstname'];?></button> (<?php print $_COOKIE['jimeluser']['igreja'];?>) <a href="logout.php" class="btn btn-default navbar-btn btn-xs" type="button">Log out</a></p></form>
          <?php } ?>
          </div>

          <div class="collapse navbar-collapse pull-left" id="navbar-collapse-01">
            <ul class="nav navbar-nav">           
              <li><a href="atletas.php">Atletas</a></li>
              <li><a href="equipes.php">Equipes</a></li>
              
              <?php if ($_COOKIE['jimeluser']['profile'] == 3) :?>
              <li class="dropdown">
                <a href="#fakelink" class="dropdown-toggle" data-toggle="dropdown">Admin<span class="caret"></span></a>
                <span class="dropdown-arrow dropdown-arrow-inverse"></span>
                <ul class="dropdown-menu dropdown-inverse">
                  <li><a href="agenda.php">Agenda do Dia</a></li>
                  <li><a href="estatisticas.php">Estatísticas</a></li>
                  <li><a href="entidades.php">Entidades</a></li>
                  <li><a href="usuarios.php">Usuários</a></li>
                  <li><a href="jogos.php">Jogos</a></li>
                  <li><a href="classificacao.php">Classificação</a></li>
                  <!-- 
                  <li><a href="atletas.php">Eventos</a></li>
                  <li><a href="equipes.php">Categorias</a></li>
                  -->
                </ul>
              </li>
              <?php endif; ?>
            </ul>
          </div>
				</div>

			<!--
			</div>
					<form class="navbar-form navbar-right" action="#" role="search">
						<div class="form-group">
							<div class="input-group">
								<input class="form-control" id="navbarInput-01" type="search" placeholder="Search">
								<span class="input-group-btn">
									<button type="submit" class="btn"><span class="fui-search"></span></button>
								</span>            
							</div>
						</div>               
					</form>
				</div><!-- /.navbar-collapse -->
			</nav><!-- /navbar -->
			
			<?php
			
			function p($v) {
				print '<pre>';
				print_r($v);
				print '</pre>';
			}

if ($today > $deadline) {
	$closed = 1;
	echo '<div class="col-md-12 btn btn-danger mbl">Prazo para inscrições encerrado.</div>';
} else {
	$closed = 0;
}
			?>