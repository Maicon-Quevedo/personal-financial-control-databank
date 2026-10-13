SELECT 
	usuario.nome AS usuario,
	banco.nome AS banco,
	valor_total AS "valor total",
	numero_parcelas AS parcelas,
	taxa_juros AS "juros %",
	status,
	COUNT(tipo_transacao) FILTER (WHERE tipo_transacao = 'PAGAMENTO_PARCELA') AS "parcelas pagas",
	SUM(valor) FILTER (WHERE tipo_transacao = 'PAGAMENTO_PARCELA') AS "total pago",
	valor_total - SUM(valor) FILTER (WHERE tipo_transacao = 'PAGAMENTO_PARCELA') AS "saldo devedor"
FROM emprestimo
INNER JOIN ativo_financeiro
	ON ativo_financeiro.id = emprestimo.id_ativo_financeiro
INNER JOIN conta 
	ON conta.id = ativo_financeiro.id_conta
INNER JOIN transacao
	ON transacao.id_ativo_financeiro = ativo_financeiro.id
INNER JOIN banco 
	ON banco.id = conta.id_banco
INNER JOIN usuario
	ON usuario.id = conta.id_usuario

GROUP BY
	usuario.nome,
	banco.nome,
	valor_total,
	numero_parcelas,
	taxa_juros,
	status;