<?php
	include ('../conexaoBanco.php');
	
	$placa = $_POST['placa'];
	$marca = $_POST['marca'];
	$modelo = $_POST['modelo'];
	$ano = $_POST['ano'];


	if($marca != '')
		$pdo->query("UPDATE veiculo SET Marca = '$marca' WHERE Placa = $placa");

	if($modelo != '')
		$pdo->query("UPDATE veiculo SET Modelo = '$modelo' WHERE Placa = $placa");

	if($ano != '')
		$pdo->query("UPDATE veiculo SET AnoFabricacao = '$ano' WHERE Placa = $placa");
	
	echo ("<script>alert('Dados alterados com sucesso!');window.location.assign('../index.html');</script>");

?>