SELECT
	objetivo,
	valor_meta,
	SUM(valor) FILTER (WHERE tipo_transacao = 'DEPOSITO_META') AS "depositado",
	SUM(valor) FILTER (WHERE tipo_transacao = 'DEPOSITO_META') / valor_meta * 100 AS "progresso (%)"
FROM orcamento
INNER JOIN ativo_financeiro
	ON ativo_financeiro.id = orcamento.id_ativo_financeiro
INNER JOIN transacao
	ON transacao.id_ativo_financeiro = ativo_financeiro.id

GROUP BY 
	objetivo,
	valor_meta