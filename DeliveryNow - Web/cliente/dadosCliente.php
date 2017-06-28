<?php
	include ('../conexaoBanco.php');
	
	$executa1 = $pdo->query("INSERT INTO cliente(idCliente, Nome, Bairro, Rua, Numero, Email) VALUES ('$_POST[idCliente]', '$_POST[nome]', '$_POST[bairro]', '$_POST[rua]', '$_POST[numero]', '$_POST[email]')");
	
	$executa2 = $pdo->query("INSERT INTO telefone_cliente(Cliente_idCliente, NroTelefone) VALUES ('$_POST[idCliente]', '$_POST[phone1]')");
	
	$aux = $_POST['phone2'];

	if($aux != '')
		$executa3 = $pdo->query("INSERT INTO telefone_cliente(Cliente_idCliente, NroTelefone) VALUES ('$_POST[idCliente]', '$_POST[phone2]')");		

	if(($executa1 && $executa2) || $executa3) {
		echo ("<script>alert('Dados inseridos com sucesso!');window.location.assign('../index.html#cliente');</script>");
	}
	else{
		print_r($pdo->errorInfo());
	}
?>
