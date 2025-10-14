SELECT
    storeid,
    storename,
    CONCAT(address, ' ', city, ', ', state) AS storeaddress,
    phone
FROM L1_LANDING.stores

--total of 10 stores