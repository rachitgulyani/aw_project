CREATE MASTER KEY ENCRYPTION BY PASSWORD ='Rachit@#12';

--credential
--data source
--file format


CREATE DATABASE SCOPED CREDENTIAL cred_rachit
WITH 
IDENTITY='Managed Identity'


CREATE EXTERNAL DATA SOURCE source_silver
WITH 
(
    LOCATION= 'https://mystorageaccountrachit.dfs.core.windows.net/myproject/silver/',
    CREDENTIAL=cred_rachit
)


CREATE EXTERNAL DATA SOURCE source_gold
WITH 
(
    LOCATION= 'https://mystorageaccountrachit.dfs.core.windows.net/myproject/gold/',
    CREDENTIAL=cred_rachit
)



CREATE EXTERNAL FILE FORMAT format_parquet
WITH (
        FORMAT_TYPE = PARQUET,
        DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
     )



CREATE EXTERNAL TABLE gold.ext_calendar
WITH 
(
    LOCATION='ext_calendar',
    DATA_SOURCE=source_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT * FROM gold.calendar;

CREATE EXTERNAL TABLE gold.ext_customers
WITH 
(
    LOCATION='ext_customers',
    DATA_SOURCE=source_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT * FROM gold.customers;


CREATE EXTERNAL TABLE gold.ext_products
WITH 
(
    LOCATION='ext_products',
    DATA_SOURCE=source_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT * FROM gold.product;


CREATE EXTERNAL TABLE gold.ext_product_categories
WITH 
(
    LOCATION='ext_procat',
    DATA_SOURCE=source_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT * FROM gold.product_categories;



CREATE EXTERNAL TABLE gold.ext_product_subcategories
WITH 
(
    LOCATION='ext_prosubcat',
    DATA_SOURCE=source_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT * FROM gold.product_subcategories;


CREATE EXTERNAL TABLE gold.ext_returns
WITH 
(
    LOCATION='ext_returns',
    DATA_SOURCE=source_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT * FROM gold.returns;


CREATE EXTERNAL TABLE gold.ext_sales
WITH 
(
    LOCATION='ext_sales',
    DATA_SOURCE=source_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT * FROM gold.sales;

CREATE EXTERNAL TABLE gold.ext_territory
WITH 
(
    LOCATION='ext_territory',
    DATA_SOURCE=source_gold,
    FILE_FORMAT=format_parquet
)
AS
SELECT * FROM gold.territory;

