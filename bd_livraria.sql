CREATE DATABASE BD_Editora;

CREATE TABLE Pessoas_Autor_Funcionario (
cpf CHAR(14) PRIMARY KEY,
Telefone CHAR(14),
Nome VARCHAR(70),
Cep CHAR(10),
Rua VARCHAR(20),
Número VARCHAR(5),
Comp VARCHAR(60),
Email VARCHAR(40),
Obras VARCHAR(60),
salário DECIMAL(6),
Cargo VARCHAR(20),
id_Depart int not null,
foreign key (id_Depart) references Departamento(idDepartamento) on update cascade on delete cascade
);
insert into Pessoas_Autor_Funcionario(cpf, Telefone, Nome, Cep, Rua, Número, Comp, Email, Obras, id_Depart)
values ("789.061.094-20", "81985755881", "Ana Helena Lobo", "50.790-000", "Rua Leandro Barreto", 355, "Bloco 15 apt 303", "anahlobo97@gmail.com", "O óculos de madeira", 1),
("079.464.864-58", "81987198465", "Nathalia Taveira", "50.980.100", "Rua Silveira de Sá", 147, "apt 204", "nathalia18@gmail.com", "Por Trás dos seus olhos", 2),
("027.346.294-45", "81986686920", "Geovanna Gizella", "50.980-190", "Rua João de Barros", 13, "apt 406", "geovannag@gmail.com", "A categoria dos Loucos", 3),
("206.826.924-77", "81984429839", "Emilly Kaiane", "50.820-000", "Travessa São João", 690, "módulo 5 apt 305", "memillyk22@hotmail.com", "A Luz", 4),
("546.914.754-13", "81996655427", "Swayne Victória", "50.470-200", "Rua A95", 87, "prédio 6 apt 12", "swaynevic69@hotmail.com", "É assim que acaba", 5);
insert into Pessoas_Autor_Funcionario(cpf, Salário, Cargo, id_Depart)
 value ("99898777665", 12777 , "editor chefe", 1),
(05366218013 , 1500 , "serviços gerais", 2),
(12536290199 , 3000 , "revisor", 3),
(10338420377 , 82000 , "dono da editora", 4),
(81420217145 , 1200 , "serviços gerais", 5),
(58501481122 , 3000 , "revisor", 6),
(87882047487 , 12776 , "designer",7),
(62810550098 , 7000 , "diagramadores", 8),
(03071430800 , 1200 , "serviços gerais", 9),
(50847679715 , 2200 , "editora auxiliar", 10);

SELECT Nome, Obras FROM Pessoas_Autor_Funcionario;

SELECT sum(Salário) from Pessoas_Autor_Funcionario;

SElECT min(Salário) from Pessoas_Autor_Funcionario;

SELECT Pessoas_Autor_Funcionario.CARGO, Departamento.Tipo_depart
FROM Pessoas_Autor_Funcionario
inner join Departamento;

SELECT Pessoas_Autor_Funcionario.CPF FROM Pessoas_Autor_Funcionario;

SELECT CPF, rua, salário FROM Pessoas_Autor_Funcionario;

SELECT Email, nome FROM Pessoas_Autor_Funcionario;


CREATE TABLE Exemplares (
idExemp INTEGER PRIMARY KEY AUTO_INCREMENT,
Ano CHAR(4),
Tipo VARCHAR(20),
Nome VARCHAR(60)
);
insert into Exemplares (idExemp, Ano, Tipo, Nome)
value (1, 2012, "Revista", "VEJA"),
(2, 2004, "Livro", "O óculos de madeira"),
(3, 2022, "Apostila", "ENEM 2022"),
(4, 2012, "Gibi", "Turma do Cebolinha"),
(5, 2006, "Livro", "Por Trás dos seus olhos"),
(6, 2011, "Livro", "A Luz"),
(7, 2019, "Livro", "É assim que acaba"),
(8, 2021, "Livro", "A categoria dos Loucos"),
(9, 2021, "Enciclopédia", "Tudo e todas as coisas"),
(10, 2018, "Livro", "Como odiar menos a si mesmo");


SELECT DISTINCT Exemplares.nome, Exemplares.ano, Venda.idVenda
FROM Exemplares
INNER JOIN Venda
on Exemplares.idExemp = Venda.idVenda;

SELECT Exemplares.nome, Pessoas_Autor_Funcionario.nome
FROM Exemplares
INNER JOIN Pessoas_Autor_Funcionario
on Exemplares.nome = Pessoas_Autor_Funcionario.Obras;

select * from Exemplares where nome in (select Obras from Pessoas_Autor_Funcionario);



CREATE TABLE Venda (
idVenda INTEGER PRIMARY KEY AUTO_INCREMENT,
dataVenda DATETIME,
valorTotal  DECIMAL(7,2),
formaPag VARCHAR(10)
);
insert into Venda (idVenda, dataVenda, valorTotal, formapag)
value ('1', "2022-05-30 14:24:10", "35.90", "Cartão"),
('2', "2022-02-21 10:30:20", "89.99", "dinheiro"),
('3', "2022-06-19 17:36:55", "25.69",  "pix"),
('4', "2022-10-21 16:24:22", "90.50", "dinheiro"),
('5', "2022-02-22 19:15:49", "33.00", "Cartão"),
('6', "2022-10-10 13:00:18", "52.75", "pix"),
('7', "2022-09-30 12:25:01", "66.90", "pix"),
('8', "2022-01-13 17:18:41", "15.40",  "Cartão"),
('9', "2022-06-09 10:11:15", "79.22", "dinheiro"),
('10', "2022-09-01 15:27:31", "120.55", "Cartão");

SElECT dataVenda, min(valorTotal) from Venda;

select * from Venda where idVenda in (select idVenda from vende_venda);

select idVenda, Max(valorTotal) from Venda;

SELECT Venda.formapag, vende_venda.Quantidade
FROM Venda
INNER JOIN vende_venda
on Venda.idvenda = vende_venda.idvenda;

SELECT vende_venda.Quantidade, Venda.valorTotal
FROM vende_venda
INNER JOIN Venda
on vende_venda.idvenda = Venda.idvenda;

CREATE TABLE Livraria (
idLivraria INTEGER PRIMARY KEY AUTO_INCREMENT,
Número_end VARCHAR(5),
Rua VARCHAR(40),
Telefone CHAR(14),
Email VARCHAR(30),
CNPJ_livr VARCHAR(30)
);
insert into Livraria (idLivraria, Número_end, Rua, Telefone, Email, CNPJ_Livr)
value (1, '33', 'Rua Vila nova', '8199999999', 'CarlosGamer44@gmail.com.br', '63.856.867/0001-63'),
(2,'58', 'Rua Jaqueira', '9986348962', 'GustavoOli@gmail.com.br', '65.076.641/0001-75'),
(3,'169', 'Rua Elizabeth', '1594837595', 'NathaliaB18@hotmail.com.br', '11.706.678/0001-00');

select Rua, Número_end, CNPJ_Livr FROM Livraria;


CREATE TABLE Departamento (
idDepartamento INTEGER PRIMARY KEY AUTO_INCREMENT,
Tipo_depart VARCHAR(20),
Telefone CHAR(14)
);
insert into Departamento (idDepartamento, Tipo_depart, Telefone)
value (1, "Venda", '81987497029'),
(2, "Editorial", '81976354511'), 
(3 , "Administrativo", '81981898603'),
(4, "Financeiro", '818981550605'),
(5, "RH", '81988825574'),
(6, "Marketing", '81988351307'),
(7, "Serviços gerais", '81988346715'),
(8, "Designer", '81982795018'),
(9, "Jurídico", '81987507228'),
(10, "Recursos humanos", '81988428751');

Select Telefone, Tipo_depart from Departamento;

CREATE TABLE Editora (
CNPJ_Edi VARCHAR(20) PRIMARY KEY,
Telefone CHAR(14),
Email VARCHAR(30),
Rua VARCHAR(60),
Número_Ende CHAR(5),
CEP CHAR(10)
);
insert into Editora (CNPJ_Edi, Telefone, Email, Rua, Número_Ende, CEP)
value ("02.338.028/0001-02", "81944444444", "EditoraSol@gmail.com.br", "Rua São Raimundo", 13, "50110-320");


SELECT Editora.Email, Livraria.Email, Pessoas_Autor_Funcionario.Email
FROM Editora
INNER JOIN LIVRARIA, Pessoas_Autor_Funcionario;

SELECT Editora.rua, Livraria.rua, Pessoas_Autor_Funcionario.rua
FROM Editora
INNER JOIN Livraria, Pessoas_Autor_Funcionario;

CREATE TABLE vende_venda (
Quantidade INTEGER,
idVend INTEGER,
idExemplar INTEGER,
FOREIGN KEY(idVend) REFERENCES Venda(idVenda),
foreign key (idVend) references Venda(idVenda) on update cascade on delete cascade,
foreign key (idExemplar) references Exemplares(idExemp) on update cascade on delete cascade
);
insert into vende_venda (Quantidade, idVend, idExemplar)
value ("12", 1, 2),
("10", 3, 4),
("20", 5, 6),
("11", 7, 8),
("8", 10, 9),
("13", 2, 5),
("50", 7, 1),
("100", 4, 6),
("30", 3, 8),
("15", 8, 10);

SELECT vende_venda.Quantidade, Exemplares.tipo
FROM vende_venda
INNER JOIN Exemplares
on vende_venda.idVenda = Exemplares.idExemp;

select * from vende_venda where idvenda in (select idvenda from Venda);

ALTER TABLE Pessoas_Autor_Funcionario MODIFY COLUMN Nome VARCHAR (70);
ALTER TABLE Livraria MODIFY COLUMN Rua VARCHAR (40);
ALTER TABLE Editora MODIFY COLUMN Email VARCHAR (30);
ALTER TABLE Editora MODIFY COLUMN Telefone CHAR(14);
ALTER TABLE Departamento MODIFY COLUMN Telefone CHAR(14);
ALTER TABLE Livraria MODIFY COLUMN Telefone CHAR(14);
ALTER TABLE Pessoas_Autor_Funcionario MODIFY COLUMN Telefone CHAR(14);