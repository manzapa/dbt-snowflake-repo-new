SELECT
CustomerID,
CONCAT(FirstName, ' ', LastName) AS CustomerName,
Email,
Phone,
Address,
City,
State,
ZipCode,
Updated_at,
FROM
L1_LANDING.CUSTOMERS