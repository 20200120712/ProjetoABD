--criaremos uma view que totalize o número de funcionários em cada departamento
CREATE VIEW total_funcionarios_por_depto AS
SELECT departamento.codigo, COUNT(funcionario.codigo) AS num_funcionarios
FROM departamento LEFT JOIN funcionario ON departamento.codigo = funcionario.cod_depto
GROUP BY departamento.codigo;

--depois usaremos essa view para obter o nome do departamento, o nome do gerente (caso tenha) e o número de funcionários de cada departamento
SELECT departamento.descricao, gerente.nome, COALESCE(total_funcionarios_por_depto.num_funcionarios, 0) AS num_funcionarios
FROM departamento
LEFT JOIN funcionario gerente ON departamento.cod_gerente = gerente.codigo
LEFT JOIN total_funcionarios_por_depto ON departamento.codigo = total_funcionarios_por_depto.codigo;
