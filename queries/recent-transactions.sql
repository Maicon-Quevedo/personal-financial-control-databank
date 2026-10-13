SELECT 
	transacao.data AS Data,
	tipo_transacao AS tipo,
	valor
FROM transacao
ORDER BY transacao.data DESC;