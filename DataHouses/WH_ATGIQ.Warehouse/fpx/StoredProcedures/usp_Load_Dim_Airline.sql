CREATE            PROCEDURE [fpx].[usp_Load_Dim_Airline]
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the table exists
    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'fpx'
          AND TABLE_NAME = 'Dim_Airline'
          AND TABLE_CATALOG = 'WH_ATGIQ'
    )
    BEGIN
        -- ALTER the table with explicit schema
        CREATE TABLE [WH_ATGIQ].[fpx].[Dim_Airline]
        (
            [CO_ID] [decimal](10,0) NULL,
            [AirlineCode] [varchar](100) NULL,
            [AirlineName] [varchar](100) NULL,
            [AirlineIATACode] [varchar](100) NULL,
            [AirlineICAOCode] [varchar](100) NULL,
            [CO_GRP_ID] [decimal](10,0) NULL,
            [GroupCode] [varchar](100) NULL,
            [GroupName] [varchar](100) NULL
        );
    END
    ELSE
    BEGIN
        -- Truncate the table if it exists
        TRUNCATE TABLE [WH_ATGIQ].[fpx].[Dim_Airline];

    -- Insert data from the Lakehouse view
    INSERT INTO [WH_ATGIQ].[fpx].[Dim_Airline] (
            [CO_ID],
			[AirlineCode],
			[AirlineName],
			[AirlineIATACode],
			[AirlineICAOCode],
			[CO_GRP_ID],
			[GroupCode],
			[GroupName] 
    )
    SELECT
            [CO_ID],
			[AirlineCode],
			[AirlineName],
			[AirlineIATACode],
			[AirlineICAOCode],
			[CO_GRP_ID],
			[GroupCode],
			[GroupName]
    FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Airline];

	END

------ Dim_Operator
   -- Check if the table exists
    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'fpx'
          AND TABLE_NAME = 'Dim_Operator'
          AND TABLE_CATALOG = 'WH_ATGIQ'
    )
    BEGIN
        -- ALTER the table with explicit schema
        CREATE TABLE[WH_ATGIQ].[fpx].[Dim_Operator]
        (
            [CO_ID] [decimal](10,0) NULL,
            [AirlineCode] [varchar](100) NULL,
            [AirlineName] [varchar](100) NULL,
            [AirlineIATACode] [varchar](100) NULL,
            [AirlineICAOCode] [varchar](100) NULL,
            [CO_GRP_ID] [decimal](10,0) NULL,
            [GroupCode] [varchar](100) NULL,
            [GroupName] [varchar](100) NULL
        );
    END
    ELSE
    BEGIN
        -- Truncate the table if it exists
        TRUNCATE TABLE [WH_ATGIQ].[fpx].[Dim_Operator];
    

    -- Insert data from the Lakehouse view
    INSERT INTO [WH_ATGIQ].[fpx].[Dim_Operator] (
            [CO_ID],
			[AirlineCode],
			[AirlineName],
			[AirlineIATACode],
			[AirlineICAOCode],
			[CO_GRP_ID],
			[GroupCode],
			[GroupName] 
    )
    SELECT
            [CO_ID],
			[AirlineCode],
			[AirlineName],
			[AirlineIATACode],
			[AirlineICAOCode],
			[CO_GRP_ID],
			[GroupCode],
			[GroupName]
    FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Airline];
	END


------ Dim_Operator
   -- Check if the table exists
    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'fpx'
          AND TABLE_NAME = 'Dim_Owner'
          AND TABLE_CATALOG = 'WH_ATGIQ'
    )
    BEGIN
        -- ALTER the table with explicit schema
        CREATE TABLE[WH_ATGIQ].[fpx].[Dim_Owner]
        (
            [CO_ID] [decimal](10,0) NULL,
            [AirlineCode] [varchar](100) NULL,
            [AirlineName] [varchar](100) NULL,
            [AirlineIATACode] [varchar](100) NULL,
            [AirlineICAOCode] [varchar](100) NULL,
            [CO_GRP_ID] [decimal](10,0) NULL,
            [GroupCode] [varchar](100) NULL,
            [GroupName] [varchar](100) NULL
        );
    END
    ELSE
    BEGIN
        -- Truncate the table if it exists
        TRUNCATE TABLE [WH_ATGIQ].[fpx].[Dim_Owner];
    

    -- Insert data from the Lakehouse view
    INSERT INTO [WH_ATGIQ].[fpx].[Dim_Owner] (
            [CO_ID],
			[AirlineCode],
			[AirlineName],
			[AirlineIATACode],
			[AirlineICAOCode],
			[CO_GRP_ID],
			[GroupCode],
			[GroupName] 
    )
    SELECT
            [CO_ID],
			[AirlineCode],
			[AirlineName],
			[AirlineIATACode],
			[AirlineICAOCode],
			[CO_GRP_ID],
			[GroupCode],
			[GroupName]
    FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Airline];
	END
END