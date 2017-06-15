<?php
	include ('conexaoBanco.php');
	
	$executa1 = $pdo->query("INSERT INTO Veiculo(Placa, Marca, Modelo, AnoFabricacao) VALUES ('$_POST[placa]', '$_POST[marca]', '$_POST[modelo]', '$_POST[ano]')");
	//$executa1 = $pdo->query("INSERT INTO cliente(idCliente, Nome, Bairro, Rua, Numero, Email) VALUES ('$_POST[idCliente]', '$_POST[nome]', '$_POST[bairro]', '$_POST[rua]', '$_POST[numero]', '$_POST[email]')");

	//$executa2 = $pdo->query("INSERT INTO telefone_fornecedor(Fornecedor_CNPJ, NroTelefone) VALUES ('$_POST[cnpj]', '$_POST[phone1]')");
	
	if($executa1){
		echo ("<script>alert('Dados inseridos com sucesso!');window.location.assign('index.html');</script>");
	}
	else{
		print_r($pdo->errorInfo());
	}
?>
