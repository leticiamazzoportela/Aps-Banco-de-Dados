<?php
	include ('../conexaoBanco.php');
	
	$idp = $_POST['idProduto'];

	if($pdo->query("DELETE FROM produto WHERE idProduto = $idp")){
		echo ("<script>alert('Dados removidos com sucesso!');window.location.assign('../index.html');</script>");
	}
	else{
		print "Falha na exclusão";
	}

?>