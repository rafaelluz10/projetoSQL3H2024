-- apagando banco de dados
drop database dbcantina;

-- criando banco de dados
create database dbcantina;

-- acessando banco de dados
use dbcantina;

-- criando as tabelas
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100) unique,
cpf char(14) not null unique,
sexo char(1) default 'F' check(sexo in('F','M')),
salario decimal(9,2) default 0 check(salario >=0),
nascimento date,
telCelular char(10),
primary key(codFunc));



create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
cnpj char(17) not null unique,
primary key(codForn));




create table tbClientes(
codCli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCelular char(10),
primary key(codCli));



create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(25) not null unique,
senha varchar(10) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc)references tbFuncionarios(codFunc));



create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
quantidade int,
valor decimal(9,2),
validade date,
dataEntrada date,
horaEntrada time,
codForn int not null,
primary key(codProd),
foreign key(codForn) references tbFornecedores(codForn)
);



create table tbVendas(
codVenda int not null auto_increment,
dataVenda date,
horaVenda time,
quantidade int,
codUsu int not null,
codCli int not null,
codProd int not null,
primary key(codVenda),
foreign key(codUsu)references tbUsuarios(codUsu),
foreign key(codCli)references tbClientes(codCli),
foreign key(codProd)references tbProdutos(codProd));



-- visualizando a estrutura das tabelas
desc tbFuncionarios;
desc tbFornecedores;
desc tbClientes;
desc tbUsuarios;
desc tbProdutos;
desc tbVendas;



-- Inserindo registros nas tabelas -- 

insert into tbFuncionarios(nome,email,cpf,sexo,salario,nascimento,telCelular)values('Rafael Luz', 'rafael.luztp1@gmail.com', '432.312.313-12', 'M',1500.00,'1999/10/10','97738-5088');
insert into tbFuncionarios(nome,email,cpf,sexo,salario,nascimento,telCelular)values('Jose Antonio', 'joseleal@gmail.com', '324.543.123-12', 'M',1900.00,'1999/10/05','95342-5088');

insert into tbFornecedores(nome,email,cnpj)values('Magazine Luiza','magalu@gmail.com', '25.649.253.1027/25');

insert into tbClientes(nome,email,telCelular)values('Lais Lima','laislima@gmail.com','944890124');
insert into tbClientes(nome,email,telCelular)values('Julia Maria','juhmah@outlook.com','955790124');
insert into tbClientes(nome,email,telCelular)values('Marcela Trega','marcela2@gmail.com','977905344');
insert into tbClientes(nome,email,telCelular)values('Denize Reis','denize2@gmail.com','977953434');

insert into tbUsuarios(nome,senha,codFunc)values('jose.cianci','123456',1);
insert into tbUsuarios(nome,senha,codFunc)values('marcela.trega','654321',2);

insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)values('Mesas Martinelli',15,850.00,'2024/10/10','2020/08/16','19:50:55',1);
insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)values('Brinquedo Chuqqy',10,20.000,'2024/05/05','2020/08/16','23:50:55',2);
insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)values('Bolo de Cenoura',100,10.00,'2024/12/25','2024/10/10','10:30:00',2);
insert into tbProdutos(descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)values('Martelo do Thor',1,150.00,'2099/05/20','2024/08/16','19:55:00',1);

insert into tbVendas(dataVenda,horaVenda,quantidade,codUsu,codCli,codProd)values('2024/08/16','19:57:00',10,2,3,4);
insert into tbVendas(dataVenda,horaVenda,quantidade,codUsu,codCli,codProd)values('2024/08/16','20:01:00',3,2,3,1);
insert into tbVendas(dataVenda,horaVenda,quantidade,codUsu,codCli,codProd)values('2024/08/16','20:02:00',6,2,3,1);	

-- visualizando os registros das tabelas -- 
select * from tbFuncionarios; 
select * from tbFornecedores; 
select * from tbClientes;
select * from tbUsuarios; 
select * from tbProdutos; 
select * from tbVendas; 