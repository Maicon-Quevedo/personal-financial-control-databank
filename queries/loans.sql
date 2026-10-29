SELECT 
	usuario.nome AS usuario,
	banco.nome AS banco,
	valor_total AS "valor total",
	numero_parcelas AS parcelas,
	taxa_juros AS "juros %",
	status,
	COUNT(tipo_transacao) AS "parcelas pagas",
	SUM(valor) AS "total pago",
	valor_total - SUM(valor) AS "saldo devedor"
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
WHERE transacao.tipo_transacao = 'PAGAMENTO_PARCELA'
GROUP BY
	usuario.nome,
	banco.nome,
	valor_total,
	numero_parcelas,
	taxa_juros,
	status;