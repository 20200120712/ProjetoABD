CREATE OR REPLACE FUNCTION atraso_atividade(dataLimite DATE, dataConclusão DATE)
RETURNS INTEGER AS $$
DECLARE
  dias_atraso INTEGER;
BEGIN
  dias_atraso := EXTRACT(DAY FROM (dataConclusão - dataLimite));
  RETURN dias_atraso;
EXCEPTION WHEN OTHERS THEN
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;