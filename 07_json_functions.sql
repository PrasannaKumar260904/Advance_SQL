-- JSON Extract: Get brand from product details
SELECT JSON_EXTRACT(details, '$.brand') AS brand FROM products;
