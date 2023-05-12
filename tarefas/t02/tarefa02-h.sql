CREATE OR REPLACE FUNCTION calcular_porcentagem_atividades_membro(cod_projeto INTEGER, cod_membro INTEGER)
RETURNS DECIMAL(5,2) AS $$
DECLARE
    total_atividades INTEGER;
    atividades_membro INTEGER;
    porcentagem DECIMAL(5,2);
BEGIN
    SELECT COUNT(*) INTO total_atividades
    FROM atividade_projeto
    WHERE codProjeto = cod_projeto;
    
    SELECT COUNT(*) INTO atividades_membro
    FROM atividade_projeto ap
    JOIN atividade_membro am ON ap.codAtividade = am.codAtividade
    WHERE ap.codProjeto = cod_projeto AND am.codMembro = cod_membro;
    
    porcentagem := (atividades_membro::DECIMAL / total_atividades::DECIMAL) * 100;
    
    RETURN porcentagem;
END;
$$ LANGUAGE plpgsql;