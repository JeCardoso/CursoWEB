<!DOCTYPE html>
<html>
<head>
	<title>Teste Submit</title>
</head>
<body>

<form action="index.php" method="get">
	<input type="text" name="nome">
	<input type="number" name="idade">
	<button type="Submit">Enviar</button>
</form>

<br />

<?php
	$vindo = $_GET();
	echo $vindo['nome'];
	echo $vindo['idade'];
	print_r($vindo);
  ?>

</body>
</html>