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
    <div class="container">
			<nav class="navbar navbar-inverse" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-01">
						<span class="sr-only">Toggle navigation</span>
					</button>
					<a class="navbar-brand pull-left" href="/">JIMEL</a>

          <div class="navbar-right mll pull-right">
          <?php if (!isset($_COOKIE['jimeluser'])) {?>
            <a href="login.php" class="btn btn-default navbar-btn btn-xs" type="button">Log in</a>
          <?php } else {?>
            <p class="navbar-text salutation">Bem-vindo <?php print $_COOKIE['jimeluser']['firstname'];?>. <a href="logout.php" class="btn btn-default navbar-btn btn-xs" type="button">Log out</a></p>
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
			?>
