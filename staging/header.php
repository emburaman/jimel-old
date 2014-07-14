<?php 
$deadline = mktime(23,59,59,7,27,2014);
$today    = time();
$base_path = "/staging";

if ($_POST['print'] == 'print') { $p = 'print '; }
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>JIMEL 2014</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css" media="screen">
    <link rel="stylesheet" href="css/bootswatch.min.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel="stylesheet" href="css/style.css">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../bower_components/html5shiv/dist/html5shiv.js"></script>
      <script src="../bower_components/respond/dest/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
	<a name="top"></a>

    <div class="container">
      <!-- Navbar
      ================================================== -->
      <div class="bs-docs-section clearfix">
        <div class="row">
          <div class="col-lg-12">
            <div class="bs-component">
              <div class="navbar navbar-inverse">
                <div class="navbar-header">
                  <!-- Menu button for mobile -->
                  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand" href="./">JIMEL</a>
                </div>
                
                <div class="navbar-collapse collapse navbar-responsive-collapse">
                  <ul class="nav navbar-nav">
                    <li><a href="atletas.php"><span class="fa fa-lg fa-users fa-margin-right"></span> Atletas</a></li>
                    <li><a href="equipes.php"><span class="fa fa-lg fa-shield fa-margin-right"></span> Equipes</a></li>

										<?php if ($_COOKIE['jimeluser']['profile'] == 3) { ?>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-lg fa-sliders fa-margin-right"></span> Admin <b class="caret"></b></a>
                      <ul class="dropdown-menu">
												<li><a href="agenda.php">Agenda do Dia</a></li>
												<li><a href="estatisticas.php">Estatísticas</a></li>

                        <li class="divider"></li>
                        <li class="dropdown-header">Resultados</li>
												<li><a href="jogos.php">Jogos</a></li>
												<li><a href="classificacao.php">Classificação</a></li>

                        <li class="divider"></li>
                        <li class="dropdown-header">Gerenciamento</li>
												<li><a href="entidades.php">Entidades</a></li>
												<li><a href="categorias.php">Categorias</a></li>
												<li><a href="usuarios.php">Usuários</a></li>
                      </ul>
                    </li>
										<?php } ?>
                  </ul>
                  <ul class="nav navbar-nav navbar-right">

									<?php if (!isset($_COOKIE['jimeluser'])) {?>
										<li><a href="login.php" class="" type="button"><span class="fa fa-lg fa-lock fa-margin-right"></span> Log in</a></li>
									<?php } else {?>
										<li><a>Bem-vindo, <strong><?php print $_COOKIE['jimeluser']['firstname'];?></strong> (<?php print $_COOKIE['jimeluser']['igreja'];?>)</a></li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-lg fa-cog"></span> <b class="caret"></b></a>
                      <ul class="dropdown-menu">
												<form class='pull-right' method='post' action='usuarios.php'><input type='hidden' name='action' value='edit' />
                        <li><button class='btn btn-link' name='id_user' value='<?php print $_COOKIE['jimeluser']['id_user']; ?>'>Meu Perfil</button></li></form>
                        <li class="divider"></li>
												<li><a href="logout.php">Log out</a></li>
                      </ul>
                    </li>
									<?php } ?>
                  </ul>
                </div>
              </div>
            </div><!-- /example -->

          </div>
        </div>
      </div>
			
    <div>
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
