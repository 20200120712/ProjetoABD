CREATE OR REPLACE FUNCTION dias_atraso(codAtividade int) RETURNS int
AS $$
DECLARE
  v_dataFim date;
  v_dataConclusao date;
  v_dias int;
BEGIN
  SELECT a.dataFim, a.dataConclusao INTO v_dataFim, v_dataConclusao FROM atividade a WHERE a.codigo = codAtividade;
  IF v_dataFim IS NOT NULL AND v_dataConclusao IS NULL THEN
    v_dias := DATEDIFF(CURDATE(), v_dataFim);
  ELSE
    v_dias := 0;
  END IF;
  RETURN v_dias;
END;
$$ LANGUAGE plpgsql;
