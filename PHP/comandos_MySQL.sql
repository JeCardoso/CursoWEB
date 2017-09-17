*** Comandos MySQL ***

/*		**Tipos de dados ** 

	Texto:
		Text - grande quantidade de texto
		Varchar - tamanho variável de 0 a 255 caracteres
		Char - tamanho fixo de 0 a 255 caracteres

	Números:
		Int - armazena valores numéricos inteiros
		Float - armazena valores numéricos com frações

	Data e Hora:
		Date - armazena uma data
		Time - armazena uma hora
		Datetime - armazena a combinação de data e hora
	
	Elementos:
		not null - não aceita nulos
		unsigned - sem negativos dobra o número de positivos
		default - valor padrão
		auto_increment - incrementar essa coluna automaticamente
		primary key - chave primária
		
*/



** Banco de Dados **
/* Criar banco de dados */
create database db_teste;

/* Apagar banco de dados */
drop database db_teste;

/* Selecionar banco de dados */
use db_teste; 



** Tabelas **
/* Criar tabela */
create table tabela_teste(
	id int not null auto_increment primary key,
	nome varchar(20) not null,
	idade int(2) not null,
	data_nascimento date default 08/11/1994 not null,
	idade_total float(8,2) not null )

/* Criar tabela relacionada */
create table tabela_teste_filha(
	id int not null auto_increment primary key,
	teste_id int not null,
	foreign key(teste_id) references tabela_teste(id)
)

/* Apagar Tabelas */
drop table tabela_teste;

/* Renomear Tabela */
rename table tabela_teste to tabela_teste;

/* Alterar tabela */
alter table tabela_teste add column nome int not null; /* adicionar coluna*/
alter table tabela_teste change nome altera_nome varchar(12) null; /* mudar nome-valor coluna*/
alter table tabela_teste drop nome; /* Apagar a coluna */



** Registros **
/* Inserir registros na tabela */
insert into tabela_teste values ('Jean',22,'19941108',23.5);
insert into tabela_teste(nome, idade,data_nascimento,idade_total) values ('Jean',22,'19941108',23.5);

/* Atualizar registros */
update tabela_teste set nome = 'jean', idade = 15 where id = 2;

/* Deletar registros */
delete from tabela_teste where idade > 30;



** Seleção de dados **
/*
	WHERE
	Operadores Relacionais
		Igual(=), diferente(!=), maior(>), maior ou igual(>=), menor(<), menor ou igual(<=)
		Nulo(is null), Não nulo(is not null), intervalo de valores(between), valor parcial(like)
	Operadores Lógicos
		e(and), ou(or), negar(not)
*/

/* Selecionar dados */
select * from tabela_teste where idade > 18 and idade_total > 18.5 or nome = 'Jean';

/* Apelido de tabela */
select APELIDO.campo from TABELA APELIDO;

/* Apelido de Campos (AS) */
select CAMPO as APELIDO from TABELA;
	
/* Unir resultados de consultas */
select * from tabela union select * from tabela_teste; /* Não retorna registros duplicados */
select * from tabela union all select * from tabela_teste; /* Retorna registros duplicados */

/* 
	Consultar registros relacionados em tabelas diferentes (geralmente entre chave estrangeira e primária entre tabelas) 
	
	inner join (é o padrão se outro não for especificado, registros que não tenham correspondencia não aparecem)
	equi join (utilizado para chaves com mesmo nome, exibindo apenas uma vez a chave no resultado)
	non equi join (relacionar registros que não tem campos em comum)
	left join/outer join (Apresenta todos os registros da primeira tabela que não satisfaça a união, apresentando nulos)
	right join/ right outer join (Apresenta todos os registros da segunda tabela que não satisfaça a união, apresentando nulos)
	full join/ full outer join (Une o left join e right join, apresenta todos registros das tabelas e nulls)
	self join (Unir registros da mesma tabela)
*/

/* Consulta utilizando colunas com nomes diferentes (Inner Join) */
select * from tabela join tabela2 on tabela.cpf = tabela2.id;

/* Consulta com nomes iguais (Equi Join) */
select * from tabela join tabela2 using(CHAVE);

/* Consulta utilizando registros sem campos em comum que cumpram uma condição (Non Equi Join) */
select p.nome, p.idade, s.faixa from pessoas p inner join salarios s on p.salario between s.inicio and s.fim;

/* Apresenta todos os registros da primeira tabela e relação com a segunda (Left Join) */
select * from tabela_teste as teste left join tabela_teste_filha as filha on (teste.id = filha.teste_id);

/* Apresenta todos os registros da segunda tabela e relação com a primeira (Right Join) */
select * from tabela_teste as teste right join tabela_teste_filha as filha on (teste.id = filha.teste_id);

/* Mescla do Left Join com Right Join (Full Join) */
select * from tabela_teste as teste full join tabela_teste_filha as filha on teste.id = filha.teste_id;

/* Junta na consulta registros de mesma tabela (Self Join) */
select a.nome, b.nome as indicado_por from pessoas a join pessoas b on a.indicado = b.cpf;



** Views (Visões) **
/*
	Consultas de SQL conhecidas e de uso rotineiro que ficam armazenadas no banco de dados
	Para otimizar espaço, facilitar a manutenção de expressões SQL e centralização de código.
*/

/* Criar visão*/
create view NOME_VISAO as EXPRESSAO_SQL;
create view todos_pobres as select * from pessoas where salario between 1000 and 2000;

/* Usar visão */
select * from todos_pobres;

/* Alterar visão */
alter view NOME_VISAO PROPRIEDADE;

/* Apagar visão */
DROP view NOME_VISAO;



** Funções especiais **

/* Conta o número de registros retornados em uma consulta */
SELECT count(*) from tabela_funcionarios;

/* Soma valores da expressao SQL */
SELECT sum(salario) from funcionarios;

/* Média de um campo para os registros da consulta */
SELECT avg(salario) from funcionarios;

/* O valor máximo de um campo na tabela */
SELECT max(salario) from funcionarios;

/* O valor mínimo de um campo na tabela */
SELECT min(salario) from funcionarios;



** Paginação **

/* Seleciona os valores únicos e elimina repetições */
select distinct(departamentos) from funcionarios;

/* Ordena o resultado de acordo com a coluna especificada */
select * from funcionarios order by salario; 

/* Limita o número de registros retornados */
select * from funcionarios limit 2;
select * from funcionarios limit 2, 2; /* Com offset */

/* Indica quantos registros devem ser avançados */
select * from funcionarios offset 2;



** Agrupamentos **

/* Agrupa registros por operações e categoriza */
select departamento, avg(salario) from funcionarios group by departamento;

/* Filtro de seleção para agrupamento */
select departamento, avg(salario) from funcionarios group by departamento having avg(salario) > 1500;



** Subqueries **
/* 
	Realização de consultas com filtro de seleção baseado em uma lista ou seleção (Consultas aninhadas)
	IN (Retorno da primeira consulta esteja na segunda)
	NOT IN (Retorno não esteja na segunda consulta)
*/

/* Expressão que filtra funcionario de marketing e TI */
select nome from funcionarios where departamento in ('Marketing','TI');

/* Expressão que retorna uma subquery */
select nome from funcionariios where departamento in (
select departamento from funcionarios group by departamento having avg(salario) > 1500);



** DCL - Controle acesso a dados **
/*
	Níveis de Acesso
		- Banco de Dados
		- Tabelas
		- Colunas
		- Registros
	
	Níveis de Ações
		- Gerenciar estruturas
		- Gerenciar dados
		- Ler dados
		
	| Tentativa de Acesso
	|	Possui acesso ao servidor?
	|	Possui acesso ao banco de dados?
	|	Possui acesso a tabela?
	|	Possui acesso a coluna?
	|	Possui acesso a registros?
	|	Possui acesso a operação?
	V	
	
	Ações -> ALL, SELECT, INSERT, UPDATE, DELETE;
	Estruturas -> TABLE, VIEW, SEQUENCE	
*/

/* Criar usuário */
create user nome;
create user 'nome'@'%' identified by 'senha';

/* Exclui usuário */
drop user nome;

/* Habilita Acesso */
grant ACAO on ESTRUTURA to USUARIO; 
grant all on Banco.* to 'usuario'@'%';

/* Revoga Acesso */
revoke ACAO on ESTRUTURA from USUARIO;
revoke all on Banco.* from 'usuario'@'%';



** Transações ACID - DTL **
/* 
	Transações (Conjunto de operações a serem realizadas no banco de dados)
		
	ACID (Contém característica para garantir a qualidade da execução da transação)	
		
		Atomicidade (Toda transação realizada por completo ou não realizada)
		Consistência (Regras impostas não sejam quebradas)
		Isolamento (Os dados devem ser travados para outras transações não acessem ao mesmo tempo até terminar operação)
		Durabilidade (São confirmadas e ficam disponíveis para outras transações)
*/

/* Iniciar transação */
start transaction;

/* Concretiza a transação */
commit;

/* Anula a transação */
rollback;



** Stored Procedures **
/*
	Armazenar no banco de dados códigos SQL para serem executados quando invocados e aumento na manutenção
	
	Vantagens:
		Centralização (do código e procedimento para que sistemas diferentes invoquem o procedimento da mesma forma) 
		Segurança (toda e qualquer manipulação da informação no banco deve ser feita por Storage Procedures)
		Performance (A execução aumenta a performance, pois não necessita de solicitações externas e diminui tráfego da rede)
		Transações (Suporte a transações tornando mais confiáveis as operações)	
*/

/* Criar uma Stored Procedure */
create procedure 'nome_procedure';

DELIMITER $$
create procedure 'banco_de_dados'.'nome_procedure'()
BEGIN
	select from pedidos where pago = 'nao' and to_days(now()) - to_days(coluna_data) > 3;
END$$

/* Executar uma Procedure */
call nome_procedure();
execute nome_procedure;

/* Excluir uma Procedure */
drop procedure nome_procedure;



** Triggers (Gatilhos) **
/*	Eventos que disparam códigos SQL armazenados no servidor iniciados a partir de um evento
	
	Vantagens:
		Mesmas das Stored PROCEDURE
		Execução de código SQL baseado em eventos

	Tipos:
		Before INSERT (antes da ação de inserção)
		Before update (antes da ação de atualização)
		Before delete (antes da ação de exclusão)
		AFTER INSERT (depois da ação de inserção)
		AFTER update (depois da ação de atualização)
		AFTER delete (depois da ação de exclusão)
		Temporais (Executa em determinado dia e horário)			
*/

/* Criar Trigger */
create trigger nome_trigger tipo ON tabela;

DELIMITER $$
create trigger 'nome_trigger' Before Insert ON tabela_estoque for each row
BEGIN
	CALL nome_procedure();
END $$

/* Excluir Trigger */
drop trigger nome_trigger;

*Obs: No MySQL não consegue fazer operações na mesma tabela em que está invocando o trigger.