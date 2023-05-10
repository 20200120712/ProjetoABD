CREATE OR REPLACE FUNCTION calcular_idade(data_nasc DATE)
RETURNS INTEGER AS $$
DECLARE 
    idade INTEGER;
BEGIN
    idade := EXTRACT(YEAR FROM age(now(), data_nasc));
    RETURN idade;
END;
$$ LANGUAGE plpgsql;
