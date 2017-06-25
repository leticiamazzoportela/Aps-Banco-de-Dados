<?php
	include ('../conexaoBanco.php');
	
	$placa = $_POST['placa'];

	if($pdo->query("DELETE FROM veiculo WHERE placa = $placa")){
		echo ("<script>alert('Dados removidos com sucesso!');window.location.assign('../index.html');</script>");
	}
	else{
		print "Falha na exclusão";
	}

?>