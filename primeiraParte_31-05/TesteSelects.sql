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
-- where u.Veiculo_Placa not in (select Veiculo_Placa
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
                                       
                                       
-- 6) Encontre o ID e o Nome dos clientes que não compraram 'Pizza Mexicana' --

-- select c.idCliente, c.Nome
-- from Cliente c
-- where c.idCliente not in (select idCliente
						 -- from Cliente c, Pedido_Produto pp, Produto pr, Pedido p
						 -- where c.idCliente = p.Cliente_idCliente and
							-- p.idPedido = pp.Pedido_idPedido and
							-- pp.Produto_idProduto = pr.idProduto and
							-- pr.NomeProduto = 'Pizza Mexicana');


-- 7) Encontrar o id e o nome de um produto comprado no dia '2017-03-12' mas não no dia '2017-03-14'--

-- select idProduto, NomeProduto
-- from Produto pr, Pedido_Produto pp, Pedido p
-- where pr.idProduto = pp.Produto_idProduto and	
	 -- pp.Pedido_idPedido = p.idPedido and
     -- p.DataPedido = '2017-03-12' and
     -- pr.idProduto not in (select idProduto
						-- from Produto pr2, Pedido_Produto pp2, Pedido p2
						-- where pr2.idProduto = pp2.Produto_idProduto and	
								-- pp2.Pedido_idPedido = p2.idPedido and
								-- p2.DataPedido = '2017-03-14');



-- 8) Encontre o id e o valor do pedido de maior valor  --

-- select idPedido, ValorTotal
-- from Pedido p
-- where p.ValorTotal = (select max(p2.ValorTotal)
					  -- from Pedido p2);
                      

-- 9) encontre o valor médio dos pedidos feito no dia '2017-03-20', sendo que nestes não foi pedido Bolo mágico--

-- select avg(ValorTotal) as r
-- from Pedido p
-- where p.DataPedido = '2017-03-20' and
	 -- p.idPedido not in (select idPedido
						-- from Pedido p1, Produto pr, Pedido_Produto pp
                        -- where p1.idPedido = pp.Pedido_idPedido and
							 --  pp.Produto_idProduto = pr.idProduto and
                             --  pr.NomeProduto = 'Bolo Magico');


-- 10) Encontre o nome dos clientes que já compraram do fornecedor Tacos do Elfo mas não compraram da Churrascaria da Bruxa --

-- select c.Nome
-- from Cliente c, Pedido p, Fornecedor f
-- where c.idCliente = p.Cliente_idCliente and
	 -- p.Fornecedor_CNPJ = f.CNPJ and
     -- f.Nome = 'Tacos do Elfo' and 
     -- c.idCliente not in (select c.idCliente
						-- from Cliente c, Pedido p, Fornecedor f
						-- where c.idCliente = p.Cliente_idCliente and
							 --  p.Fornecedor_CNPJ = f.CNPJ and
							  -- f.Nome = 'Churrascaria da Bruxa');
	  



