CREATE OR REPLACE FUNCTION contar_atividades_membro(cod_projeto integer, cod_membro integer)
RETURNS integer
LANGUAGE plpgsql
AS $$
DECLARE
    qtde_atividades integer;
BEGIN
    SELECT COUNT(*) INTO qtde_atividades
    FROM atividade_projeto ap
    JOIN atividade_membro am ON ap.codAtividade = am.codAtividade
    WHERE ap.codProjeto = cod_projeto AND am.codMembro = cod_membro;

    RETURN qtde_atividades;
END;
$$;