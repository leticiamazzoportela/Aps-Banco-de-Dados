<?php
	include ('conexaoBanco.php');
	
	$idCliente = $_POST['idCliente'];
	$Nome = $_POST['nome'];
	$Bairro = $_POST['bairro'];
	$Rua = $_POST['rua'];
	$Numero = $_POST['numero'];
	$Email = $_POST['email'];

	
	$pdo->query("UPDATE cliente SET Nome = '$Nome' WHERE idCliente = $idCliente");

	$pdo->query("UPDATE cliente SET Bairro = '$Bairro' WHERE idCliente = $idCliente");

	$pdo->query("UPDATE cliente SET Rua = '$Rua' WHERE idCliente = $idCliente");

	$pdo->query("UPDATE cliente SET Numero = '$Numero' WHERE idCliente = $idCliente");

	$pdo->query("UPDATE cliente SET Email = '$Email' WHERE idCliente = $idCliente");
	
	echo ("<script>alert('Dados alterados com sucesso!');window.location.assign('index.html');</script>");

?>