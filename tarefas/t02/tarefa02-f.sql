CREATE OR REPLACE PROCEDURE exibir_equipe(cod_projeto integer)
LANGUAGE plpgsql
AS $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN
        SELECT f.nome, d.sigla
        FROM projeto p
        JOIN equipe e ON p.equipe = e.codigo
        JOIN membro m ON e.codigo = m.codEquipe
        JOIN funcionario f ON m.codFuncionario = f.codigo
        JOIN departamento d ON f.depto = d.codigo
        WHERE p.codigo = cod_projeto
    LOOP
        RAISE NOTICE 'Funcionário: %, Departamento: %', rec.nome, rec.sigla;
    END LOOP;
END;
$$;