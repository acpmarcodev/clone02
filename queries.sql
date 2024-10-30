
-- Listar todos Clientes que não tenham realizado uma compra;
select * from customers
left join orders orders on orders.customer_id = customers.customer_id
where orders.order_id is null

-- Listar os Produtos que não tenham sido comprados
select * from products
left join orders_itens orders on orders.product_id = products.product_id
where orders.order_id is null

-- Listar os Produtos sem Estoque
select * from products
left join stocks stocks on stocks.product_id = products.product_id
where stocks.store_id is null

-- Agrupar a quantidade de vendas que uma determinada Marca por Loja. 
select brand_id, orders.store_id, count(*) from orders
inner join orders_itens on orders_itens.order_id = orders.order_id
inner join products on products.product_id = orders_itens.product_id
inner join brands on brands.brand_id = products.brand_id
group by brand_id, orders.store_id

-- Listar os Funcionarios que não estejam relacionados a um Pedido.
select * from staffs
left join orders orders on orders.staff_id = staffs.staff_id
where orders.order_id is null
