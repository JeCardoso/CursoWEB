<?php 
	class Veiculo{

		/* 
			public (var) - acesso dentro da classe ou externo.

			private - acesso apenas dentro da classe, as filhas não herdam

			protected - acesso apenas dentro da classe e as filhas herdam

		*/

		public $placa;
		private $cor;
		protected $tipo;

		/*
			construct - construtor ao inicializar um objeto
			destruct - construtor ao destruir um objeto
		*/
		function __construct(){
			echo 'Veiculo construido <br/>';
		}


		function __destruct(){
			echo 'Veiculo destruido <br/>';
		}

		public function getCor(){
			return $this->placa;
		}
		
		public function setCor($cor){
			$this->cor = $cor;
		}

	}

	class Carro extends Veiculo
	{
		public function exibirTipo(){
			echo $this->tipo;
		}
	}

	$veiculoPublic = new Veiculo();
	$veiculoPublic->placa = 'BMW';
	echo $veiculoPublic->placa;

	$veiculoPrivate = new Veiculo();
	$veiculoPrivate->setCor('azul');
	echo $veiculoPrivate->getCor();

	$veiculoProtected = new Carro();
	$veiculoProtected->exibirTipo();

 ?>