<?php
	include ('../conexaoBanco.php');
	
	$idProduto = $_POST['idp'];
	$Nome = $_POST['nomep'];
	$CnpjF = $_POST['cnpjF'];

	$executa= $pdo->query("SELECT * FROM produto WHERE idProduto = $idProduto");

	if($Nome != '')
		$pdo->query("UPDATE produto SET NomeProduto = '$Nome' WHERE idProduto = $idProduto");
	
	if($CnpjF != '')
		$pdo->query("UPDATE produto SET Fornecedor_CNPJ = '$CnpjF' WHERE idProduto = $idProduto");
	
	//echo ("<script>alert('Dados alterados com sucesso!');window.location.assign('../index.html');</script>");

?>