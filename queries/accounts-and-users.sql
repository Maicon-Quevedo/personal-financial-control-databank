SELECT 
	usuario.nome,
	email AS Email,
	data_nascimento AS nascimento,
	conta.tipo AS tipo,
	banco.nome AS banco
FROM usuario
INNER JOIN conta
	ON conta.id_usuario = usuario.id
INNER JOIN banco 
	ON banco.id = conta.id_banco
ORDER BY 
	usuario.nome;