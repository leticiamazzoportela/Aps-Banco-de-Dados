<?php
	include ('../conexaoBanco.php');
	
	$executa1 = $pdo->query("INSERT INTO Veiculo(Placa, Marca, Modelo, AnoFabricacao) VALUES ('$_POST[placa]', '$_POST[marca]', '$_POST[modelo]', '$_POST[ano]')");
	
	if($executa1){
		echo ("<script>alert('Dados inseridos com sucesso!');window.location.assign('../index.html#veiculo');</script>");
	}
	else{
		print_r($pdo->errorInfo());
	}
?>
