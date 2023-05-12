CREATE OR REPLACE FUNCTION atraso_projeto(cod_projeto integer)
RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
    data_fim_projeto date;
    data_conclusao_projeto date;
    qtde_dias_atraso integer;
BEGIN
    SELECT p.dataFim, p.dataConclusao INTO data_fim_projeto, data_conclusao_projeto
    FROM projeto p
    WHERE p.codigo = cod_projeto;

    IF data_fim_projeto IS NULL THEN
        RETURN NULL;
    ELSIF data_conclusao_projeto IS NULL OR data_conclusao_projeto <= data_fim_projeto THEN
        RETURN 0;
    ELSE
        qtde_dias_atraso := (EXTRACT(EPOCH FROM data_conclusao_projeto - data_fim_projeto) / 86400)::integer;
        RETURN qtde_dias_atraso;
    END IF;
END;
$$;
