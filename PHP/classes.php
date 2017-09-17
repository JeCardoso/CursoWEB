<?php

	// Classe Mãe
	class Pessoa{
		// Atributos
		var $nome;

		// Getters e Setters
		function setNome($nome){
			$this->nome = $nome;
		}

		function getNome(){
			return $this->nome.'<br />';
		}

		//Métodos
		function falar(){
			echo 'Eu sou Pessoa <br/>';
		}
	}

	
	class Aluno extends Pessoa
	{
		//Atributos
		var $escola;

		// Getters e Setters
		function setEscola($escola){
			$this->escola = $escola;
		}

		function getEscola(){
			return $this->escola.'<br />';
		}

		// Métodos
		// Polimorfismo e Herança
		function falar(){
			echo 'Eu sou Aluno <br/>';
		}
	}

	$pessoa = new Pessoa();

	$pessoa->setNome('Jean');

	echo $pessoa->getNome();

	$aluno = new Aluno();

	$aluno->setNome('Jean');

	echo $aluno->getNome();
	echo $aluno->getEscola();

	$pessoa->falar();
	$aluno->falar();


?>