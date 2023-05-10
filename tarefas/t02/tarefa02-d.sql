CREATE OR REPLACE FUNCTION atraso_atividade(data_limite DATE, data_conclusao DATE)
RETURNS INTEGER AS $$
DECLARE
  dias_atraso INTEGER;
BEGIN
  dias_atraso := EXTRACT(DAY FROM (data_conclusao - data_limite));
  RETURN dias_atraso;
EXCEPTION WHEN OTHERS THEN
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;