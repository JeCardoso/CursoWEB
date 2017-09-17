<?php

	/* 	** Tratamento formulários **

		* Variavel inicializada ou nula *
		isset($var);

		* Variavel vazia, nula ou 0 *
		empty($var);
		
		* Variavel é numérica *
		isnumeric($var);

	*/

	if(isset($_GET['nome']) && empty($_GET['nome'])){
		echo $_GET['nome'];
	}

	if(isset($_GET['idade']) && empty($_GET['idade']) && is_numeric($_GET['idade'])){
		echo $_GET['idade'];
	}


	/* 	** Tratamento Strings **

		* Primeira letra maiúscula *
		ucfirst($var);

		* String toda maiúscula *
	    strtoupper($var);

	    * String toda minúscula *
	    strtolower($var);

	    * Quantidade de letras numa String *
	    strlen($var);

	    * Selecionar parte de uma string *
	    substr($var, $primeira_string = 0, $qntd_string = 7);

	    * Substituir parte de uma string *
	    str_replace(substituida, substituta, $var);
	
	*/

	$palavraTeste = "cabeLeireiro";
    ucfirst($palavraTeste);
    strtoupper($palavraTeste);
    strtolower($palavraTeste);
    strlen($palavraTeste);
    substr($palavraTeste, 0, 7);
    str_replace(".", ",", $palavraTeste);


    /*    ** Datas **

    	*Datas atuais*
		date("d/m/Y"); date("Y/m/d"); 
		date("d-m-Y"); 
		date("d/m/Y H:i"); date("d/m/Y h:i");
	
		*Converte data para timestamp*	
		strtotime($data);		
    
    */
	echo $data = date("d/m/Y H:i");

	$data_inicial = strtotime(2015-04-02);
	$data_final = strtotime(2015-04-05);
	$diferença = $data_final - $data_inicial;
	$diaSegundos = 24*60*60;
	$diferenca_dias = $diferença / $diaSegundos;

	/* 	  ** Arrays **
	
		* Vizualizar Array *
		var_export($array);
		var_dump($array);
		print_r($array);

		* Declaração array *
		$array = array(); ou $array = array('a', 'b'); ou array(0=>'a', 1=>'b', 2=>'c');

	    * verifica se a variável é um vetor *
		isarray($variavel);

		* verifica se existe a variavel num vetor *
		in_array('string_procurada', $array);

		* Cria novo array usando apenas chaves de um outro array *
		array_keys($array);

		* Ordena chaves do array e mantem índices *
		sort(array);

		* Ordena chaves do array e índices acompanham as chaves *
		asort(array);

		* Conta o número total de elementos num vetor *
		count($array);

		* Mistura dois arrays em um *
		array_merge($array1, $array2);

		* Separa elementos contidos na variavel a partir de uma caractere bomba e joga num vetor *
		explode('string_bomba', $string);

		* Junta elementos contidos no vetor, em uma string separada por um caractere *
		implode('$string_separacao', $array);

	*/


 ?>