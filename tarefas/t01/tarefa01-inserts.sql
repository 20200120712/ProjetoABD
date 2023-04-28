-- Inserscao de dados na tabela "departamento"
INSERT INTO departamento (descricao, cod_gerente)
VALUES ('Vendas', NULL),
       ('Marketing', NULL),
       ('TI', NULL),
       ('Recursos Humanos', NULL),
       ('Financeiro', NULL);
      
-- Inserscao de dados na tabela "funcionario"
INSERT INTO funcionario (nome, sexo, dt_nasc, salario, cod_depto)
VALUES ('Pedro', 'M', '1990-02-15', 3000.00, 1),
       ('Maria', 'F', '1995-05-20', 2500.00, 1),
       ('Daniel', 'M', '1985-08-10', 4000.00, 2),
       ('Ana', 'F', '1988-11-25', 3500.00, 3),
       ('Gabriel', 'M', '1992-04-03', 2800.00, 2);

update departamento set cod_gerente = 1 where codigo = 1;
update departamento set cod_gerente = 2 where codigo = 2;
update departamento set cod_gerente = 1 where codigo = 3;
update departamento set cod_gerente = 2 where codigo = 4;
update departamento set cod_gerente = 2 where codigo = 5;

-- Inserscao de dados na tabela "projeto"
INSERT INTO projeto (nome, descricao, data_inicio, data_fim, cod_depto, cod_responsavel)
VALUES ('Projeto A', 'Descricao do Projeto A', '2023-01-01', '2023-07-01', 1, 1),
       ('Projeto B', 'Descricao do Projeto B', '2023-02-01', '2023-08-01', 2, 3),
       ('Projeto C', 'Descricao do Projeto C', '2023-03-01', '2023-09-01', 3, 5),
       ('Projeto D', 'Descricao do Projeto D', '2023-04-01', '2023-10-01', 4, 2),
       ('Projeto E', 'Descricao do Projeto E', '2023-05-01', '2023-11-01', 5, 4);


-- Insercao de dados na tabela "atividade"
INSERT INTO atividade (nome, descricao, data_inicio, data_fim, cod_responsavel)
VALUES ('Atividade 1', 'Descricao da Atividade 1', '2023-01-01', '2023-02-01', 1),
       ('Atividade 2', 'Descricao da Atividade 2', '2023-02-01', '2023-03-01', 3),
       ('Atividade 3', 'Descricao da Atividade 3', '2023-03-01', '2023-04-01', 5),
       ('Atividade 4', 'Descricao da Atividade 4', '2023-04-01', '2023-05-01', 2),
       ('Atividade 5', 'Descricao da Atividade 5', '2023-05-01', '2023-06-01', 4);

-- Inserscao de dados na tabela "atividade_projeto"
INSERT INTO atividade_projeto (cod_projeto, cod_atividade)
VALUES (1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

