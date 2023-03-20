-- Setup table

CREATE SCHEMA [HR];
GO

CREATE TABLE [HR].[Employees]
(
    [EmployeeID] [int] IDENTITY(1,1) NOT NULL
    , [SSN] [char](11) NOT NULL
    , [FirstName] [nvarchar](50) NOT NULL
    , [LastName] [nvarchar](50) NOT NULL
    , [Salary] [money] NOT NULL
) ON [PRIMARY];


INSERT INTO [HR].[Employees]
(
    [SSN]
    , [FirstName]
    , [LastName]
    , [Salary]
)
VALUES
(
    '795-73-9838'
    , N'Catherine'
    , N'Abel'
    , $31692
);

INSERT INTO [HR].[Employees]
(
    [SSN]
    , [FirstName]
    , [LastName]
    , [Salary]
)
VALUES
(
    '990-00-6818'
    , N'Kim'
    , N'Abercrombie'
    , $55415
);




-- Go through GUI 


SELECT * FROM sys.column_master_keys;
SELECT * FROM sys.column_encryption_keys
SELECT * FROM sys.column_encryption_key_values


SELECT
[name]
, [encryption_type]
, [encryption_type_desc]
, [encryption_algorithm_name]
, [column_encryption_key_id]
FROM sys.columns
WHERE [encryption_type] IS NOT NULL;


-- 
SELECT * FROM [HR].[Employees]


-- open new connection with AE active 


-- This works (determ)
DECLARE @SSN [char](11) = '795-73-9838'
SELECT [SSN], [Salary] FROM [HR].[Employees]
WHERE [SSN] = @SSN

-- This does not work (Random)
DECLARE @Salary [char](11) = '31692,00'
SELECT [SSN], [Salary] FROM [HR].[Employees]
WHERE Salary = @Salary




https://learn.microsoft.com/en-us/sql/relational-databases/security/encryption/always-encrypted-tutorial-getting-started?view=sql-server-ver16&tabs=ssms