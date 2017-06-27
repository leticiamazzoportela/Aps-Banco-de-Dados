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

select f.Nome
from Fornecedor f, Produto p
where f.CNPJ = p.Fornecedor_CNPJ 
group by f.CNPJ
having count(*) >= 3;