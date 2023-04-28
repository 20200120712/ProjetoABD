--criaremos uma view
CREATE VIEW responsavel_atividades AS
SELECT cod_responsavel, COUNT(*) AS num_atividades
FROM atividade
GROUP BY cod_responsavel;

--depos usaremos essa view na consulta para selecionar o nome dos funcionários responsáveis por atividades e o número de atividades que cada um é responsável:
SELECT funcionario.nome, responsavel_atividades.num_atividades
FROM funcionario
INNER JOIN responsavel_atividades
ON funcionario.codigo = responsavel_atividades.cod_responsavel;
