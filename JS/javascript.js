/* I/O de Dados */
// Exibir uma janela de alerta
alert('hello!');

// Receber valores
var a = prompt("Digite A");
var b = prompt("Digite B");
var c = 0;

// Escrever no documento
document.write("<?php ?>");
/* --- */



/* Condicionais */
if (a > b) {
    c = a;
} else {
    c = b;
}

switch(a){
    case 1:
        alert(1);
        break;
    case 1:
        alert(2);
        continue;
    default:
        alert(0);
}
/* --- */



/* Interação */
for(var i = 0; i < 10; i++){
    c++;
}

while(c !== a){
    c--;
}

do{
    c--;
}while(c !== a);
/* --- */



/* Vetores */
var vetor = new Array('a', 2, c, true, 2.3);
var vetor2 = ['a', 2, c, true, 2.3];
var vetor3 = Array('a', 2, c, true, 2.3);

// Inserir/Modificar dados em vetores
vetor[0] = 1;

// Inserir dados no vetor
vetor.push('a'); // Adiciona ao final do array
vetor.unshift('b'); // Adiciona no início do array

// Apagar dados do array
vetor.pop('a'); // Remove ao final do array
vetor.shift('b'); // Remove no início do array
vetor.length = 0; // Remover todos os elementos os tornando undefined

// Remove a partir de n elementos do array ou caso queira insere elementos a partir deles
vetor.splice(2,1); ou vetor.splice(1,3,"a","b","c"); 

// Concatenar vetores
var vetorConcatenado = vetor.concat(vetor2);

// Quebra o vetor em uma unica string e usa um separador
vetor.join(" - ");

// Corta um pedaço do array e forma outro
var novoVetor = vetor.slice(1,3);

// Inverter valores do array
vetor.reverse();

// Ordena o vetor em ordem crescente
vetor.sort();
vetor.sort(decrescente); // sort com callback
function decrescente(a,b){
    if(a > b){
        return -1;
    }
    if(a < b){
        return 1;
    }
    if(a === b){
        return 0;
    }
}

// Interar sobre o array
vetor.forEach(function(value, key)){
    document.write("Chave: "+key+" Valor: "+value);
});
for(var chave in vetor){
    var aux = vetor[key];
}

// Pesquisar o índice do primeiro elemento com 'b'
vetor.indexOf('b');

// Pesquisar o índice a partir de n
vetor.indexOf('b', 3);

// Pesquisar o último indice em que a palavra aparece
vetor.indexOf('b', 2);
/* --- */



/* Modificar atributos */
var myImage = document.querySelector('img').onclick = function() {
    var mySrc = myImage.getAttribute('src');
    if(mySrc === 'images/firefox-icon.png') {
      myImage.setAttribute ('src','images/firefox2.png');
    }
}
/* --- */



/* Escrever dentro do Elemento HTML */
var myHeading = document.querySelector('h1').innerHTML = 'Hello world!';
/* --- */



/* Exemplo de utilizar Sessão de armazenamento */
var myButton = document.querySelector('button');
var myHeading = document.querySelector('h1');

function setUserName() {
  var myName = prompt('Please enter your name.');
  localStorage.setItem('name', myName);
  myHeading.innerHTML = 'Mozilla is cool, ' + myName;
}

if(!localStorage.getItem('name')) {
  setUserName();
} else {
  var storedName = localStorage.getItem('name');
  myHeading.innerHTML = 'Mozilla is cool, ' + storedName;
}

myButton.onclick = function() {
  setUserName();
}
/* --- */



/* DOM */
var button = document.getElementById("button");
var name = document.getElementsByTagName('body');
var class = document.getElementsByClassName('classe');

var button.click = function(){
    alert(isNaN(button.value));
}

button.addEventListener('click', fnClick);

function fnClick(){
    alert(button.value);
}

function pegarElemento(obj){
    obj.innerHTML = 'Caiu';
    obj.style.background = "#ffffff";
}
/* --- */



/* Popular select dinamicamente */
var select = document.createElement("select"); // Criar elemento
document.body.appendChild(select); // Adicionar elemento ao filho de body

for(var i = 0; i < 10; i++){
    var option = document.createElement("option");
    option.id = "#id_"+i;
    option.value = i;
    option.innerHTML = i;
    
    select.appendChild(option);
}

// Mudar estilo CSS no javascript
if(c > a){
    var texto = document.getElementById('texto');
    texto.style.color = '#FFFFFF';
}
/* --- */



/* Criar Objetos em que todos herdam de Object */
var sexo = 'M';

// Criar objeto
var objetoPessoa = {
    nome: 'jean',
    idade: 22,
    sexo: sexo,
    getIdade: function(){
        alert(this.idade);
    }
};

// Adicionar propriedades
objetoPessoa.cidade = "São Paulo";
objetoPessoa["cidade"] = "São Paulo";

// Utilizar função do objeto
objetoPessoa.getIdade();

// Gerar o objeto em JSON
var objetoEmJSON = JSON.stringify(objetoPessoa);

// Criar um novo objeto filho a partir do prototype de outro.
var objetoPessoaFilho = Object.create(objetoPessoa);
/* --- */



/* Criar uma Classe c/ construtor */
function classePessoa(nome){
    this.name = nome;
}

// Adicionando um atributo da classe
classePessoa.prototype.email="jean@jean.com";

// Adicionando um método
classePessoa.prototype.getName = function(){
    return this.name;
}

// Instanciando uma classe
var novaPessoa = new classePessoa();
/* --- */