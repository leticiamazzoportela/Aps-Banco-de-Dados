<?php
	include ('conexaoBanco.php');
	
	$CNPJ = $_POST['cnpj'];
	$Nome = $_POST['nome'];
	$Bairro = $_POST['bairro'];
	$Rua = $_POST['rua'];
	$Numero = $_POST['num'];
	$Email = $_POST['email'];

	
	$pdo->query("UPDATE fornecedor SET Nome = '$Nome' WHERE CNPJ = $CNPJ");

	$pdo->query("UPDATE fornecedor SET Bairro = '$Bairro' WHERE CNPJ = $CNPJ");

	$pdo->query("UPDATE fornecedor SET Rua = '$Rua' WHERE CNPJ = $CNPJ");

	$pdo->query("UPDATE fornecedor SET Numero = '$Numero' WHERE CNPJ = $CNPJ");

	$pdo->query("UPDATE fornecedor SET Email = '$Email' WHERE CNPJ = $CNPJ");
	
	echo ("<script>alert('Dados alterados com sucesso!');window.location.assign('index.html');</script>");

?>