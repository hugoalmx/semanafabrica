/* Lógico_3: */
create database delegaciadatabase;

use delegaciadatabase;

CREATE TABLE Delegacia (
    ID_Delegacia int PRIMARY KEY,
    nome varchar(50),
    numero_policiais int,
    possui_viatura boolean
);

CREATE TABLE Policial (
    CPF_policial varchar(50) PRIMARY KEY,
    nome varchar(50),
    idade int,
    em_servico boolean,
    fk_Delegacia_ID_Delegacia int
);

CREATE TABLE Caso (
    id_caso int PRIMARY KEY,
    descricao varchar(50),
    gravidade varchar(50),
    resolvido boolean,
    fk_Delegacia_ID_Delegacia int
);

CREATE TABLE Suspeito (
    cpf_suspeito varchar(50) PRIMARY KEY,
    nome varchar(50),
    idade int,
    historico_crimes boolean,
    fk_Caso_id_caso int
);

ALTER TABLE Policial ADD CONSTRAINT FK_Policial_2
    FOREIGN KEY (fk_Delegacia_ID_Delegacia)
    REFERENCES Delegacia (ID_Delegacia)
    ON DELETE RESTRICT;
 
ALTER TABLE Caso ADD CONSTRAINT FK_Caso_2
    FOREIGN KEY (fk_Delegacia_ID_Delegacia)
    REFERENCES Delegacia (ID_Delegacia)
    ON DELETE RESTRICT;
 
ALTER TABLE Suspeito ADD CONSTRAINT FK_Suspeito_2
    FOREIGN KEY (fk_Caso_id_caso)
    REFERENCES Caso (id_caso)
    ON DELETE CASCADE;
    

      insert into delegacia (ID_Delegacia, Nome, numero_policiais, possui_viatura)
values (1, 'Delegacia de Mangabeira', 25, false),
 (2, 'Delegacia de Criciúma', 200, true),
 (3, 'Delegacia do  Valentina', 40, true),
 (4, 'Delegacia do José Américo', 25, false);
 
 
INSERT INTO policial (CPF_policial, nome, idade, em_servico)
VALUES 
(12345678900, 'Lucas Silva', 32, true),
(23456789011, 'Mariana Santos', 28, false),
(34567890122, 'Rafael Oliveira', 35, true),
(45678901233, 'Carla Pereira', 30, false);
 
INSERT INTO suspeito (cpf_suspeito, Nome, idade, historico_crimes)
VALUES 
(98765432100, 'Pedro Silva', 40, true),
(87654321011, 'Ana Santos', 25, false),
(76543210922, 'Carlos Oliveira', 35, true),
(65432109833, 'Juliana Pereira', 28, false);

 
INSERT INTO caso (id_caso, descricao, gravidade, resolvido)
VALUES 
(1001, 'Roubo em residência', 'Moderada', false),
(1002, 'Assalto a banco', 'Gravíssima', false),
(1003, 'Homicídio', 'Gravíssimo', true),
(1004, 'Tráfico de drogas', 'Leve', false);

 
 
SELECT * FROM Delegacia;
SELECT * FROM Policial;	
SELECT * FROM Caso;
SELECT * FROM Suspeito;

