SELECT
	Date,
	Region,
	Total_Bags,
	Small_Bags,
	(Small_Bags / Total_Bags)*100 AS Small_Bags_Percent



 FROM `civic-wharf-403915.avocado_data.avocado_prices` 
 
WHERE
	Total_Bags <>0

