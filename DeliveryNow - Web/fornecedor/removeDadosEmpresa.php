<?php
	include ('../conexaoBanco.php');
	
	$CNPJ = $_POST['cnpj'];

	if($pdo->query("DELETE FROM fornecedor WHERE CNPJ = $CNPJ") && $pdo->query("DELETE FROM telefone_fornecedor WHERE Fornecedor_CNPJ = $CNPJ")){
		echo ("<script>alert('Dados removidos com sucesso!');window.location.assign('../index.html#portfolio');</script>");
	}
	else{
		print "Falha na exclusão";
	}

?>