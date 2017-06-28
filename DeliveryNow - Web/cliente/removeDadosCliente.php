<?php
	include ('../conexaoBanco.php');
	
	$idCliente = $_POST['idCliente'];

	if($pdo->query("DELETE FROM cliente WHERE idCliente = $idCliente") && $pdo->query("DELETE FROM telefone_cliente WHERE Cliente_idCliente = $idCliente")){
		echo ("<script>alert('Dados removidos com sucesso!');window.location.assign('../index.html#cliente');</script>");
	}
	else{
		print "Falha na exclusão";
	}

?>