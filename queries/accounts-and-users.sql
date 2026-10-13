SELECT 
	usuario.nome,
	email AS Email,
	data_nascimento AS nascimento,
	COUNT(conta) AS contas,
	STRING_AGG(banco.nome, ', ') AS bancos
FROM usuario
INNER JOIN conta
	ON conta.id_usuario = usuario.id
INNER JOIN banco 
	ON banco.id = conta.id_banco
GROUP BY usuario.nome, usuario.email, usuario.data_nascimento;