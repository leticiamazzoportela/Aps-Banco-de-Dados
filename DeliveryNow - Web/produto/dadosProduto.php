<?php
	include ('../conexaoBanco.php');
	
	$executa1 = $pdo->query("INSERT INTO produto(idProduto, NomeProduto, Fornecedor_CNPJ) VALUES ('$_POST[idp]', '$_POST[nomep]', '$_POST[cnpjF]')");		

	if($executa1) {
		echo ("<script>alert('Dados inseridos com sucesso!');window.location.assign('../index.html');</script>");
	}
	else{
		print_r($pdo->errorInfo());
	}
?>
