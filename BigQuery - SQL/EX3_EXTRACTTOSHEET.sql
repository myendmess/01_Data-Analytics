SELECT  
  EXTRACT(YEAR FROM date) AS Year,  
  EXTRACT(MONTH FROM date) AS Month,  
  ProductId,  
  ROUND(MAX(UnitPrice), 2) AS UnitPrice,  
  SUM(Quantity) AS UnitsSold
FROM `civic-wharf-403915.sales_info.sales`
GROUP BY Year, Month, ProductId
ORDER BY Year, Month, ProductId

