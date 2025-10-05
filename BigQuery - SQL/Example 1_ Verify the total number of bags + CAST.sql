SELECT
	Date,
	Region,
	Small_Bags,
	Large_Bags,
	XLarge_Bags,
	Total_Bags,
	CAST(Small_Bags + Large_Bags + XLarge_Bags AS INT64) AS Total_Bags_Calc



 FROM `civic-wharf-403915.avocado_data.avocado_prices` 
 
 LIMIT 20