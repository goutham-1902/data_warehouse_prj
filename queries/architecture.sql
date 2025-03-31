/*
==============================
Creating Database and Schemas
==============================

Query Purpose:
    This SQL query checks if a database named data_warehouse_prj exists, 
    and drops it if it does (removing all data). Then, it recreates the database 
    and sets up three schemas: bronze, silver, and gold, following the Medallion Architecture.

Warning:
    Running this query will delete the entire database if it already exists. 
    All data will be permanently lost. Please be sure to proceed with caution.
*/

USE master;
GO

-- Drop the database if it already exists
IF EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE [name] = 'data_warehouse_prj'
)
BEGIN
    ALTER DATABASE data_warehouse_prj SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE data_warehouse_prj;
END;
GO

-- Create the database
CREATE DATABASE data_warehouse_prj;
GO

USE data_warehouse_prj;
GO

-- Create schemas representing stages in the Medallion Architecture
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
