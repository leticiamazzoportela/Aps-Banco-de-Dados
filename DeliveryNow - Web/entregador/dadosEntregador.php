<?php
	include ('../conexaoBanco.php');
	
	$executa1 = $pdo->query("INSERT INTO entregador(idEntregador, Nome, HorarioEntrega) VALUES ('$_POST[ide]', '$_POST[nameE]', '$_POST[hora]')");

	$executa2 = $pdo->query("INSERT INTO telefone_entregador(Entregador_idEntregador, NroTelefone) VALUES ('$_POST[ide]', '$_POST[phone1]')");
	
	$aux = $_POST['phone2'];

	if($aux != '')
		$executa3 = $pdo->query("INSERT INTO telefone_entregador(Entregador_idEntregador, NroTelefone) VALUES ('$_POST[ide]', '$_POST[phone2]')");		

	if(($executa1 && $executa2) || $executa3) {
		echo ("<script>alert('Dados inseridos com sucesso!');window.location.assign('../index.html');</script>");
	}
	else{
		print_r($pdo->errorInfo());
	}
?>

