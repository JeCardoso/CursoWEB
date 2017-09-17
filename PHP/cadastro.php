<!DOCTYPE html>
<html>
<head>
	<title>Teste PHP</title>
</head>
<body>
	<?php
		include_once('funcoes.php');
	?>

	<form action="funcoes.php" method="get">
		<input type="text" name="nome">
		<input type="number" name="idade">
		<input type="submit" value="enviar">
	</form>

</body>
</html>