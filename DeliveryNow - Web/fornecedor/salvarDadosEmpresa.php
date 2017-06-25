<?php
	include ('../conexaoBanco.php');
	
	$CNPJ = $_POST['cnpj'];
	$Nome = $_POST['nome'];
	$Bairro = $_POST['bairro'];
	$Rua = $_POST['rua'];
	$Numero = $_POST['num'];
	$Email = $_POST['email'];
	$phone1 = $_POST['phone1'];
	$phone2 = $_POST['phone2'];

	$executa= $pdo->query("SELECT * FROM telefone_fornecedor WHERE Fornecedor_CNPJ = $CNPJ");


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
		$pdo->query("UPDATE fornecedor SET Nome = '$Nome' WHERE CNPJ = $CNPJ");
	
	if($Bairro != '')
		$pdo->query("UPDATE fornecedor SET Bairro = '$Bairro' WHERE CNPJ = $CNPJ");
	
	if($Rua != '')
		$pdo->query("UPDATE fornecedor SET Rua = '$Rua' WHERE CNPJ = $CNPJ");
	
	if($Numero != '')
		$pdo->query("UPDATE fornecedor SET Numero = '$Numero' WHERE CNPJ = $CNPJ");
	
	if($Email != '')
		$pdo->query("UPDATE fornecedor SET Email = '$Email' WHERE CNPJ = $CNPJ");

	if($phone1 != '')
		$pdo->query("UPDATE telefone_fornecedor SET NroTelefone = '$phone1' WHERE Fornecedor_CNPJ = $CNPJ  AND NroTelefone = $n1");

	if($phone2 != '')
		$pdo->query("UPDATE telefone_fornecedor SET NroTelefone = '$phone2' WHERE Fornecedor_CNPJ = $CNPJ AND NroTelefone = $n2");
	
	//echo ("<script>alert('Dados alterados com sucesso!');window.location.assign('../index.html');</script>");

?>
?>