SELECT 
    p.nome AS nome_projeto, 
    d1.descricao AS nome_departamento_projeto, 
    f1.nome AS nome_funcionario_responsavel, 
    d2.descricao AS nome_departamento_funcionario
FROM 
    projeto p 
    JOIN departamento d1 ON p.cod_depto = d1.codigo 
    JOIN funcionario f1 ON p.cod_responsavel = f1.codigo 
    JOIN departamento d2 ON f1.cod_depto = d2.codigo;
