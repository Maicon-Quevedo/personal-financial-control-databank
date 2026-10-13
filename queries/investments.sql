SELECT 
	tipo_investimento AS tipo,
	usuario.nome AS usuario,
	banco.nome AS banco,
	conta.numero_conta AS conta,
	valor_inicial_gasto AS inicial,
	valor_mensal_investido AS mensal,
	saldo, 
	rentabilidade AS "rent%",
	COUNT(tipo_transacao) FILTER(WHERE tipo_transacao = 'APORTE') AS "aportes(qtd)" 
FROM investimento 
INNER JOIN ativo_financeiro
	ON ativo_financeiro.id = investimento.id_ativo_financeiro
INNER JOIN transacao
	ON transacao.id_ativo_financeiro = ativo_financeiro.id
INNER JOIN conta 
	ON conta.id = ativo_financeiro.id_conta
INNER JOIN usuario
	ON usuario.id = conta.id_usuario
INNER JOIN banco 
	ON banco.id = conta.id_banco
GROUP BY
	tipo_investimento, 
	usuario.nome, 
	banco.nome, 
	conta.numero_conta, 
	valor_inicial_gasto, 
	valor_mensal_investido, 
	saldo, 
	rentabilidade;