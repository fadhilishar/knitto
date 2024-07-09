SELECT o.customerNumber, COUNT(p.productLine) as totalhitung from orders o 
JOIN orderdetails od ON o.orderNumber=od.orderNumber
JOIN products p ON p.productCode=od.productCode
JOIN productlines pl ON p.productLine=pl.productLine
GROUP BY p.productLine,o.customerNumber
HAVING totalhitung>23;