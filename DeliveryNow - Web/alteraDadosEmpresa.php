<?php
	include ('conexaoBanco.php');

	$CNPJ = $_['CNPJ'];

	$busca = $pdo->query("SELECT * FROM tabela WHERE id = $id"); 
	
	if($busca){
		foreach($busca as $resultado){
			echo "<section id='portfolio'>";
			echo "<div class=container>";
			echo		"<div class=row>";
			echo			"<div class=col-lg-12 text-center>";
			echo				"<h4>Fornecedor</h4>";
									print "CNPJ: ".$resultado['CNPJ'].";"."<br>";
									print "Nome: ".$resultado['Nome'].";"."<br>";
									print "Bairro: ".$resultado['Bairro'].";"."\t";
									print "Rua: ".$resultado['Rua'].";"."\t";
									print "Numero: ".$resultado['Numero'].";"."<br>";
									print "Email: ".$resultado['Email']."<br><br>";
			echo			"</div>";
			echo		"</div>";
			echo	"</div>";
			echo "</section>";
		}
	}
	
?>
<HTML>
	<form method="POST" action="salvar.php">

		<input type="text" value="<?php echo $row['campo']; ?>" name="campo" />
		<input type="hidden" value="<?php echo $id; ?>" name="id" />
	
		<input type="submit" value="editar" />

	</form>
</HTML>