<?php
	include ('../conexaoBanco.php');
	
	$idCliente = $_POST['idCliente'];
	$Nome = $_POST['nome'];
	$Bairro = $_POST['bairro'];
	$Rua = $_POST['rua'];
	$Numero = $_POST['numero'];
	$Email = $_POST['email'];
	$phone1 = $_POST['phone1'];
	$phone2 = $_POST['phone2'];

	$executa= $pdo->query("SELECT * FROM telefone_cliente WHERE Cliente_idCliente = $idCliente");


		if($executa){
		$i = 0;
		foreach($executa as $resultado){
			if($i == 0)
				$n1 = $resultado['NroTelefone'];
			if($i == 1)
				$n2 = $resultado['NroTelefone'];
			$i++;
		}
	}

	if($Nome != '')
		$pdo->query("UPDATE cliente SET Nome = '$Nome' WHERE idCliente = $idCliente");
	
	if($Bairro != '')
		$pdo->query("UPDATE cliente SET Bairro = '$Bairro' WHERE idCliente = $idCliente");
	
	if($Rua != '')
		$pdo->query("UPDATE cliente SET Rua = '$Rua' WHERE idCliente = $idCliente");
	
	if($Numero != '')
		$pdo->query("UPDATE cliente SET Numero = '$Numero' WHERE idCliente = $idCliente");
	
	if($Email != '')
		$pdo->query("UPDATE cliente SET Email = '$Email' WHERE idCliente = $idCliente");

	if($phone1 != '')
		$pdo->query("UPDATE telefone_cliente SET NroTelefone = '$phone1' WHERE Cliente_idCliente = $idCliente  AND NroTelefone = $n1");

	if($phone2 != '')
		$pdo->query("UPDATE telefone_cliente SET NroTelefone = '$phone2' WHERE Cliente_idCliente = $idCliente AND NroTelefone = $n2");
	
	echo ("<script>alert('Dados alterados com sucesso!');window.location.assign('../index.html#cliente');</script>");

?>