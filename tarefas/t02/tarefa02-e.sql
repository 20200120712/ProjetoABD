CREATE OR REPLACE FUNCTION atraso_projeto(codProjeto integer)
RETURNS integer AS $$
DECLARE
    data_conclusao_planejada date;
    data_conclusao_real date;
    dias_atraso integer;
BEGIN
    SELECT dataFim, dataConclusao INTO data_conclusao_planejada, data_conclusao_real
    FROM projeto
    WHERE codigo = codProjeto;
    
    IF data_conclusao_real IS NOT NULL THEN
        dias_atraso := (data_conclusao_real - data_conclusao_planejada)::int;
        RETURN dias_atraso;
    ELSE
        RETURN NULL;
    END IF;
END;
$$ LANGUAGE plpgsql;