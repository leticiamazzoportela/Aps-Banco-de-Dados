<?php
	include ('../conexaoBanco.php');

	$ide = $_POST['ide'];
	$nameE = $_POST['nameE'];
	$hora = $_POST['hora'];
	$phone1 = $_POST['phone1'];
	$phone2 = $_POST['phone2'];

	$executa= $pdo->query("SELECT * FROM telefone_entregador WHERE Entregador_idEntregador = $ide");

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

	if($nameE != '')
		$pdo->query("UPDATE entregador SET Nome = '$nameE' WHERE idEntregador = $ide");

	if($hora != '')
		$pdo->query("UPDATE entregador SET HorarioEntrega = '$hora' WHERE idEntregador = $ide");

	if($phone1 != '')
		$pdo->query("UPDATE telefone_entregador SET NroTelefone = '$phone1' WHERE Entregador_idEntregador = $ide  AND NroTelefone = $n1");

	if($phone2 != '')
		$pdo->query("UPDATE telefone_entregador SET NroTelefone = '$phone2' WHERE Entregador_idEntregador = $ide AND NroTelefone = $n2");
	
	//echo ("<script>alert('Dados alterados com sucesso!');window.location.assign('../index.html');</script>");

?>
