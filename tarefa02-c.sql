CREATE OR REPLACE PROCEDURE funcionarios_acima_media_idade()
LANGUAGE plpgsql AS $$
DECLARE
  rec record;
BEGIN
  FOR rec IN (SELECT f.*, EXTRACT(YEAR FROM age(current_date, f.dataNasc)) AS idade,
                     d.descricao, media_idade_por_departamento.media_idade
              FROM funcionario f
              JOIN departamento d ON f.depto = d.codigo
              JOIN media_idade_por_departamento() ON d.descricao = media_idade_por_departamento.departamento)
  LOOP
    IF rec.idade > rec.media_idade THEN
      RAISE NOTICE 'Funcionario: % % - Idade: % anos - Media de idade do departamento: % anos',
                   rec.nome, rec.sexo, rec.idade, rec.media_idade;
    END IF;
  END LOOP;
END;
$$;