*** Ajax ***


/* Objeto XMLHttpRequest utilizado para requisições assíncronas */
XMLHttpRequest();

** Métodos **

/* Método utilizado para preparar requisições HTTP, especifica o método usado (GET, POST, etc..) e se esta será ou não assíncrona, não retorna nada */
open(string method, string url, string asynch);

/* Envia a requisição HTTP */
send(string);

** Propriedades **

/* Dispara um evento a cada mudança de status */
Onreadystatechange;

/* Representa o estado da requisição  
	0 - Objeto ainda não inicializado, o método open() ainda não foi chamado.
	1 - Carregando dados, o método send() ainda não foi chamado.
	2 - Dados carregados, o método send() ainda não foi chamado mas os cabeçalhos da resposta HTTP já estão disponíveis.
	3 - Modo interativo, a propriedade responseText já contém dados parciais.
	4 - Operação concluída.
*/
readyState;

/* Representa o código do Status da resposta
	Código 200 [OK]
	Código 505 [Erro interno do servidor]
	Código 404 [Documento não encontrado]
*/
status;
