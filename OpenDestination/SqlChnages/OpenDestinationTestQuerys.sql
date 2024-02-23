-- 1) Write Query to return all products (1 row per product) with all product details like Name, Company name, ratingand total sales for last 1 year.


select p.[name] as productname,b.[name] as brandname,sum(qtysold*ps.unitprice) as totalSales,p.unitprice,sum(ps.qtysold) as qtysold 
from dbo.Products p
join dbo.Brand b on p.companyid = b.Id
join dbo.ProductSales ps on p.Id = ps.productid
left join (
	select ROUND(AVG(CAST(rate AS FLOAT)), 2) as rate,productid from dbo.productrating group by productid
) pr on pr.productid = p.id
WHERE ps.createdon > DATEADD(year,-1,GETDATE())
group by p.Id,p.[name],b.[name],p.unitprice;

--2) List the products along with price with rating of 3 and 4 stars with product with cheapest price displayed first.

select p.[name],ROUND(AVG(CAST(pr.rate AS FLOAT)), 2) as rate,p.unitprice
from dbo.Products p
join dbo.productrating pr on p.id = pr.productid
group by p.Id,p.[name],p.unitprice
having ROUND(AVG(CAST(pr.rate AS FLOAT)), 2) between 3 and 4
order by p.unitprice;