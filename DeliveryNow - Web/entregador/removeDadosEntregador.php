<?php
	include ('../conexaoBanco.php');
	
	$ide = $_POST['ide'];

	if($pdo->query("DELETE FROM entregador WHERE idEntregador = $ide") && $pdo->query("DELETE FROM telefone_entregador WHERE Entregador_idEntregador = $ide")){
		echo ("<script>alert('Dados removidos com sucesso!');window.location.assign('../index.html');</script>");
	}
	else{
		print "Falha na exclusão";
	}

?>