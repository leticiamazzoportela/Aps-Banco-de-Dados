<?php
	include ('../conexaoBanco.php');
	
	$executa1 = $pdo->query("INSERT INTO fornecedor(CNPJ, Nome, Bairro, Rua, Numero, Email) VALUES ('$_POST[cnpj]', '$_POST[nome]', '$_POST[bairro]', '$_POST[rua]', '$_POST[num]', '$_POST[email]')");

	$executa2 = $pdo->query("INSERT INTO telefone_fornecedor(Fornecedor_CNPJ, NroTelefone) VALUES ('$_POST[cnpj]', '$_POST[phone1]')");

	$aux = $_POST['phone2'];
	
	if($aux != '')
		$executa3 = $pdo->query("INSERT INTO telefone_fornecedor(Fornecedor_CNPJ, NroTelefone) VALUES ('$_POST[cnpj]', '$_POST[phone2]')");		

	if(($executa1 && $executa2) || $executa3) {
		echo ("<script>alert('Dados inseridos com sucesso!');window.location.assign('../index.html#portfolio');</script>");
	}
	else{
		print_r($pdo->errorInfo());
	}
?>
