<?php
	include ('../conexaoBanco.php');
	
	$idCliente = $_POST['idCliente'];

	if($pdo->query("DELETE FROM cliente WHERE idCliente = $idCliente")){
		echo ("<script>alert('Dados removidos com sucesso!');window.location.assign('../index.html');</script>");
	}
	else{
		print "Falha na exclus�o";
	}

?>