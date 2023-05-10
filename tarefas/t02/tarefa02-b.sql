CREATE OR REPLACE FUNCTION media_idade_por_departamento()
RETURNS TABLE (departamento varchar(15), media_idade numeric(10,2)) AS $$
BEGIN
  RETURN QUERY
  SELECT d.descricao, AVG(EXTRACT(YEAR FROM age(current_date, f.dataNasc))) AS media_idade
  FROM departamento d
  LEFT JOIN funcionario f ON d.codigo = f.depto
  GROUP BY d.descricao;
END;
$$ LANGUAGE plpgsql;