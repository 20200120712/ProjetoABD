SELECT funcionario.nome, funcionario.salario, departamento.descricao
FROM funcionario
JOIN departamento ON funcionario.cod_depto = departamento.codigo
WHERE funcionario.codigo NOT IN (SELECT cod_gerente FROM departamento WHERE cod_gerente IS NOT NULL)
ORDER BY departamento.codigo;
