-- 1) Exiba o id dos entregadores que usaram o veíluco de placa x e não y --

-- select e.idEntregador
-- from Entregador e, Usa u
-- where u.Entregador_idEntregador = e.idEntregador and
       -- u.Veiculo_Placa = 35896 and
       -- e.idEntregador not in (select e1.idEntregador
							-- from Entregador e1, Veiculo v1, Usa u1
							-- where u1.Entregador_idEntregador = e1.idEntregador and
								  -- u1.Veiculo_Placa = 38952);
                                  

-- 2) Consulte o nome dos fornecedores que fornecem 3 ou mais pedidos --

-- select f.Nome
-- from Fornecedor f, Produto p
-- where f.CNPJ = p.Fornecedor_CNPJ 
-- group by f.CNPJ
-- having count(*) >= 3;


-- 3) Encontre o id e o nome dos produtos que nunca foram comprados --

-- select idProduto, NomeProduto
-- from Produto
-- where idProduto not in (select Produto_idProduto from Pedido_Produto);


-- 4) Encontre a placa dos veículos que não foram usados no dia '2017-03-17' --

-- select Veiculo_Placa
-- from Usa u
-- where u.Veiculo_Placa not in (select Veiculo_placa
							 -- from Usa S
                             -- where S.Data = '2017-03-17');
                             

-- 5) Selecione o id dos clientes que compraram 'XSalada' e não compraram 'Bolo de aniversário' --

-- select P.Cliente_idCliente
-- from Pedido P, Produto Pr, Pedido_Produto PP
-- where PP.Pedido_idPedido = P.idPedido and
	 -- PP.Produto_idProduto = Pr.idProduto and
	 -- Pr.NomeProduto = 'XSalada' and
     -- P.Cliente_idCliente not in (select P1.Cliente_idCliente
								 -- from Pedido P1, Produto Pr1, Pedido_Produto PP1
								 -- where PP1.Pedido_idPedido = P1.idPedido and
									   -- PP1.Produto_idProduto = Pr1.idProduto and
									   -- Pr1.NomeProduto = 'Bolo de Aniversario');
                                       


