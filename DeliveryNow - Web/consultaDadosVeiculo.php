<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="css/freelancer.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

</head>
<body id="page-top" class="index">
<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="index.html">Delivery Now</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="index.html"></a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
</body>
</html>
<?php
	include ('conexaoBanco.php');

	$executa= $pdo->query("SELECT * FROM veiculo");
	
	if($executa){
		foreach($executa as $resultado){
			echo "<section id='portfolio'>";
			echo "<div class=container>";
			echo		"<div class=row>";
			echo			"<div class=col-lg-12 text-center>";
			echo				"<h4>Veículo</h4>";
									print "placa: ".$resultado['Placa'].";"."<br>";
									print "marca: ".$resultado['Marca'].";"."<br>";
									print "modelo: ".$resultado['Modelo'].";"."\t";
									print "ano: ".$resultado['AnoFabricacao'].";"."\t";
			echo			"</div>";
			echo		"</div>";
			echo	"</div>";
			echo "</section>";
        
		}
	}
	else if(count($executa) == 0){
		echo "<script> alert('Não existem itens cadastrados'); window.location.assign('index.html'); </script>";
		print_r($pdo->errorInfo());
	}

?>