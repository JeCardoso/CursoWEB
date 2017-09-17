<?php

	/* Cookie de sessão por 1 hora mesmo fechando */
	setcookie("nome", "Jean", time()+3600);

	/* Cookie de sessão por 1 mês mesmo fechando */
	setcookie("cor", "red", time() + 3600 * 24 * 7 * 4);

	/* Recuperar cookie  */
	echo $_COOKIE['nome'];

?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body bgcolor=" <?= $_COOKIE['cor']; ?> ">

</body>
</html>