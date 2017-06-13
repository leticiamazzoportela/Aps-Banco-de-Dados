<?php
	include ('conexaoBanco.php');
	
	$CNPJ = $_POST['cnpj'];

	if($pdo->query("DELETE FROM fornecedor WHERE CNPJ = $CNPJ")){
		print "Removido com sucesso";
	}
	else{
		print "Falha na exclusão";
	}

	/*$pdo->query("DELETE FROM fornecedor WHERE Bairro = '$Bairro' WHERE CNPJ = $CNPJ");

	$pdo->query("DELETE FROM fornecedor WHERE Rua = '$Rua' WHERE CNPJ = $CNPJ");

	$pdo->query("DELETE FROM fornecedor WHERE Numero = '$Numero' WHERE CNPJ = $CNPJ");

	$pdo->query("DELETE FROM fornecedor WHERE Email = '$Email' WHERE CNPJ = $CNPJ");*/

?>