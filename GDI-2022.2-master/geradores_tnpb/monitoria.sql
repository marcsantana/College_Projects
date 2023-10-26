-- Exercício 1
-- Mostre todas as notas do período de '2016.2' do aluno de nome 'Augustus Kilter'.
SELECT pr.NOTA FROM PROVA pr
WHERE pr.ANO_SEMESTRE = '2016.2' AND
pr.MATRICULA_ALUNO = (
	SELECT MATRICULA_PESSOA FROM PESSOA WHERE NOME = 'Augustus Kilter'
);

-- Exercício 2
-- Para o aluno de nome 'Joao Custodia' mostre todos os projetos dos quais ele já
-- participou, ordenando-os por período e conceito obtido.
select po.codigo_projeto, po.titulo, po.conceito, po.hp from projeto po
join aluno_turma a_t
on a_t.codigo_projeto = po.codigo_projeto
where a_t.matricula_aluno = (
  select matricula_pessoa from pessoa where nome = 'Joao Custodia'
)
order by a_t.ano_semestre, po.conceito;

