<?php
	$pdo =new PDO ("mysql: host=localhost; dbname=deliverynow", "root", "");
	if (!$pdo){
		die ('Erro ao criar conexão');
	}
?>