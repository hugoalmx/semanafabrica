/* Lógico_2: */
create database hotel;
use hotel;

CREATE TABLE Funcionarios (CPF_Funcionario int PRIMARY KEY,    
Nome varchar(40),    
Senha varchar(25),    
Login varchar(25));

CREATE TABLE Reserva (
    ID_Reserva int PRIMARY KEY,
    Data_disponivel date,
    Data_ocupado date,
    Valor float,
    fk_Funcionarios_CPF_Funcionario int,
    fk_Hospede_CPF int,
    fk_Hospedagem_ID_Hospedagem int
);

CREATE TABLE Hospede (
    CPF int PRIMARY KEY,
    StatusReserva boolean,
    Nome varchar(40),
    Quarto int,
    Vagas int,
    email varchar(30),
    telefone varchar(15));

CREATE TABLE Hospedagem (
    ID_Hospedagem int PRIMARY KEY,
    Status boolean,
    Data_entrada date,
    Data_saida date
);

CREATE TABLE Quarto (
    ID_quarto int PRIMARY KEY,
    Vagas_quarto int,
    Andar int
);

CREATE TABLE possui (
    fk_Reserva_ID_Reserva int,
    fk_Quarto_ID_quarto int
);
 
   
    
insert into funcionarios (CPF_Funcionario, Nome, Senha, Login)
values (1234567899, 'Cleber', 'clebersenha', 'cleberlogin'),
 (1234567894, 'Flavio', 'flaviosenha', 'flaviologin'),
 (1234567898, 'Joao', 'joaosenha', 'joaologin'),
 (1234567897, 'Maria', 'mariasenha', 'marialogin'),
 (1234567896, 'Ronaldo', 'ronaldosenha', 'ronaldologin'),
 (1234567895, 'Hugo', 'hugosenha', 'hugologin');
 
 insert into hospedagem (ID_Hospedagem, status, data_entrada, data_saida)
values (1, true, '2023-12-29', '2024-01-04'),
 (2, true,'2024-02-15', '2024-02-17'),
 (3, false, '2023-04-29', '2023-01-04'),
 (4, false, '2023-01-29', '2023-02-04'),
 (5, true, '2023-01-02', '2024-01-05'),
 (6, true, '2023-01-01', '2024-01-06');
 
insert into hospede (CPF, statusreserva, Nome, Quarto, Vagas, email, telefone)
values (1234567891, true, 'Hugo Almeida', 101, 2, 'hugovieirajp@hotmail.com', 83981322939),
(1234567892, true, 'Rafael Cruz', 102, 2, 'rafaelcruz@hotmail.com', 83981322939),
(1234567823, true, 'Sara Lopes', 103, 4, 'saralopes@hotmail.com', 83981322939),
(1234567845, true, 'Livia Menezes', 104, 2, 'liviamenezes@hotmail.com', 83981322939),
(1234567812, true, 'Pedro Barros', 105, 3, 'pedrobarros@hotmail.com', 83981322939),
(1234567865, true, 'Bruce Wayne', 106, 2, 'hugovieirajp@hotmail.com', 83981322939);

insert into quarto (ID_quarto, Vagas_quarto, Andar )
values (1,  '2', 1),
(2,  2, 1),
(3,  4, 1),
(4,  2, 1),
(5, 3, 1),
(6, 1,1);

insert into reserva (ID_Reserva, Data_disponivel, Data_ocupado, Valor )
values (1, '2023-12-29', '2024-01-04', 200),
 (2, '2024-02-15', '2024-02-17', 200),
 (3, '2023-04-29', '2023-01-04', 400),
 (4, '2023-01-29', '2023-02-04', 200),
 (5, '2023-01-02', '2024-01-05', 300),
 (6, '2023-01-01', '2024-01-06', 100);
 
 ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_2
    FOREIGN KEY (fk_Funcionarios_CPF_Funcionario)
    REFERENCES Funcionarios (CPF_Funcionario)
    ON DELETE RESTRICT;
 
ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_3
    FOREIGN KEY (fk_Hospede_CPF)
    REFERENCES Hospede (CPF)
    ON DELETE RESTRICT;
 
ALTER TABLE Reserva ADD CONSTRAINT FK_Reserva_4
    FOREIGN KEY (fk_Hospedagem_ID_Hospedagem)
    REFERENCES Hospedagem (ID_Hospedagem)
    ON DELETE CASCADE;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (fk_Reserva_ID_Reserva)
    REFERENCES Reserva (ID_Reserva)
    ON DELETE RESTRICT;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_2
    FOREIGN KEY (fk_Quarto_ID_quarto)
    REFERENCES Quarto (ID_quarto)
    ON DELETE SET NULL;
    
    ALTER TABLE Reserva ADD COLUMN tipo_reserva VARCHAR(50);

 UPDATE Reserva
SET tipo_reserva = 
    CASE 
        -- Supondo que você queira definir diferentes tipos de reserva com base no valor da coluna 'Valor'
        WHEN Valor >= 300 THEN 'VIP'
        WHEN Valor <= 300 AND Valor >= 200 THEN 'Executivo'
        ELSE 'Standard'
    END;

 # ALTER TABLE funcionarios ADD PRIMARY KEY (CPF_Funcionario);
#adiciona chave primária codigo na tabela funcionário, mas como já tem nao vai adicionar.

ALTER TABLE funcionarios ADD COLUMN numero VARCHAR(15) DEFAULT '839' NOT NULL;

#adiciona a coluna categoria com o tipo varchar(15) e valor default 'Junior' na 
#tabela funcionário

ALTER TABLE funcionarios DROP COLUMN numero;

#exclui a coluna numero da tabela funcionario

ALTER TABLE funcionarios MODIFY Login CHAR(25);
#modifica o tipo da coluna categoria para char(25) na tabela funcionario


ALTER TABLE funcionarios ADD COLUMN salario float(10) DEFAULT '2500.60';


UPDATE funcionarios 
SET salario = null
WHERE nome = 'Joao';

UPDATE hospede
SET vagas = 1
WHERE nome = 'Hugo Almeida';

UPDATE hospede
SET vagas = 1
WHERE nome = 'Bruce Wayne';

DELETE FROM funcionarios
WHERE nome = 'Flavio';
#Todas as pessoas cujos nomes são "Flavio" serão retiradas da tabela pessoa.

SELECT Nome FROM funcionarios;

SELECT * FROM hospede;

SELECT nome , Senha, Login FROM funcionarios;

SELECT CPF_Funcionario, nome AS nome, salario AS Nome_Salario FROM funcionarios;

#Exibir o id, o nome e o salario de todos os clientes ordenando pelo nome do cliente em 
#ordem ascendente.

SELECT CPF_Funcionario, nome, salario FROM funcionarios ORDER BY nome;

SELECT CPF_Funcionario, login, nome, senha FROM funcionarios ORDER BY nome Desc;

SELECT CPF_Funcionario, login, nome FROM funcionarios WHERE login LIKE 'ronaldologin';

#Exemplo 22: Mostrar todos os funcionarios cujos nomes começam a letra 'R'

SELECT * FROM funcionarios WHERE nome LIKE 'R%';

#Exemplo: Mostrar todos os produtos cujos nomes contém a sequência "login"

SELECT * FROM funcionarios WHERE login LIKE '%login%';

#Exemplo 25: Mostrar todos os funcionarios cujos nomes começam com a letra "H" e 
#possuem exatamente 4 letras

SELECT * FROM funcionarios WHERE nome LIKE 'H___';

#SELECT lista_de_colunas FROM tabela NOT LIKE expressão;

#Exemplo: Mostrar todos os clientes cujos nomes não comecem com a letra "A".

SELECT * FROM funcionarios WHERE nome NOT LIKE 'C%';

#SELECT lista_de+colunas FROM tabela WHERE coluna IS NULL;

#Exemplo: Mostrar todos os funcioanrios que não possuem salario

SELECT * FROM funcionarios WHERE salario IS NULL;

#SELECT lista_de_colunas FROM tabela WHERE colunax = valor1 AND  colunay = valor2

#Exemplo 35: Mostar todos os hospedes que tem 1 vaga e o mesmo email

SELECT * FROM hospede WHERE vagas = '1' and email = 'hugovieirajp@hotmail.com';

#SELECT lista_de_colunas FROM tabela WHERE coluna [NOT] BETWEEN intervalo

#Exemplo 37: Exibir todos os dados das reservas com preço entre R$ 300 e R$ 450 ordenados 
#pelo id da reserva do produto em ordem ascendente 

SELECT * FROM reserva WHERE valor BETWEEN 200 AND 300 ORDER BY ID_Reserva ASC;

#SELECT COUNT(*) FROM tabela 

#Exemplo: Exibir em uma coluna chamada Quantidade o total de clientes cadastrados

SELECT COUNT(*) AS Quantidade FROM hospede;

#SELECT SUM(coluna) FROM tabela 

#Exemplo: Exibir em uma nova coluna "Total" a soma dos valores de todos os produtos 

SELECT SUM(valor) AS Total_lucro FROM reserva;

#SELECT AVG(coluna) FROM tabela 

#Exemplo: Exibir a "Média dos salários" dos vendedores da empresa

SELECT AVG(salario) AS 'Média dos Salários' FROM funcionarios;

#SELECT MAX(coluna) FROM tabela 

#Exemplo 50: Exibir o "Maior Preço" do produto mais caro na empresa

SELECT MAX(salario) AS 'Maior Salario' FROM funcionarios;

#SELECT lista de colunas FROM tabela GROUP BY coluna [HAVING condição]alter

#Exemplo: Exibir o tipo de reserva e a quantidade de reservas de cada tipo 

SELECT Tipo_Reserva, COUNT(*) AS total_reservas
FROM Reserva
GROUP BY Tipo_Reserva;
