CREATE            PROCEDURE [fpx].[usp_Load_Dim_Geography]
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the table exists
    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'fpx'
          AND TABLE_NAME = 'Dim_Geography'
          AND TABLE_CATALOG = 'WH_ATGIQ'
    )
    BEGIN
        -- ALTER the table with explicit schema
        CREATE TABLE [WH_ATGIQ].[fpx].[Dim_Geography]
        (
            [LOC_ID] decimal(10,0) NULL,
            [LocationCode] varchar(100) NULL,
            [LocationName] varchar(100) NULL,
            [LocationIATACode] varchar(100) NULL,
            [LocationICAOCode] varchar(100) NULL,
            [IsAirport] varchar(100) NULL,
            [IsMonopolistic] varchar(100) NULL,
            [CNTRY_ID] decimal(10,0) NULL,
            [CountryName] varchar(100) NULL,
            [CountryISOCode] varchar(100) NULL,
            [Continent] varchar(100) NULL,
            [StateCode] varchar(100) NULL,
            [StateName] varchar(100) NULL
        );
    END
    ELSE
    BEGIN
        -- Truncate the table if it exists
        TRUNCATE TABLE [WH_ATGIQ].[fpx].[Dim_Geography];
    

    -- Insert data from the Lakehouse view
    INSERT INTO [WH_ATGIQ].[fpx].[Dim_Geography] (
        [LOC_ID],
        [LocationCode],
        [LocationName],
        [LocationIATACode],
        [LocationICAOCode],
        [IsAirport],
        [IsMonopolistic],
        [CNTRY_ID],
        [CountryName],
        [CountryISOCode],
        [Continent],
        [StateCode],
        [StateName]
    )
    SELECT
        [LOC_ID],
        [LocationCode],
        [LocationName],
        [LocationIATACode],
        [LocationICAOCode],
        [IsAirport],
        [IsMonopolistic],
        [CNTRY_ID],
        [CountryName],
        [CountryISOCode],
        [Continent],
        [StateCode],
        [StateName]
    FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Geography];

END

  -- Check if the table exists
    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'fpx'
          AND TABLE_NAME = 'Dim_Departure'
          AND TABLE_CATALOG = 'WH_ATGIQ'
    )
    BEGIN
        -- ALTER the table with explicit schema
        CREATE TABLE [WH_ATGIQ].[fpx].[Dim_Departure]
        (
            [LOC_ID] decimal(10,0) NULL,
            [LocationCode] varchar(100) NULL,
            [LocationName] varchar(100) NULL,
            [LocationIATACode] varchar(100) NULL,
            [LocationICAOCode] varchar(100) NULL,
            [IsAirport] varchar(100) NULL,
            [IsMonopolistic] varchar(100) NULL,
            [CNTRY_ID] decimal(10,0) NULL,
            [CountryName] varchar(100) NULL,
            [CountryISOCode] varchar(100) NULL,
            [Continent] varchar(100) NULL,
            [StateCode] varchar(100) NULL,
            [StateName] varchar(100) NULL
        );
    END
    ELSE
    BEGIN
        -- Truncate the table if it exists
        TRUNCATE TABLE [WH_ATGIQ].[fpx].[Dim_Departure];
 

    -- Insert data from the Lakehouse view
    INSERT INTO [WH_ATGIQ].[fpx].[Dim_Departure] (
        [LOC_ID],
        [LocationCode],
        [LocationName],
        [LocationIATACode],
        [LocationICAOCode],
        [IsAirport],
        [IsMonopolistic],
        [CNTRY_ID],
        [CountryName],
        [CountryISOCode],
        [Continent],
        [StateCode],
        [StateName]
    )
    SELECT
        [LOC_ID],
        [LocationCode],
        [LocationName],
        [LocationIATACode],
        [LocationICAOCode],
        [IsAirport],
        [IsMonopolistic],
        [CNTRY_ID],
        [CountryName],
        [CountryISOCode],
        [Continent],
        [StateCode],
        [StateName]
    FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Geography];

END
  -- Check if the table exists
    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'fpx'
          AND TABLE_NAME = 'Dim_Destination'
          AND TABLE_CATALOG = 'WH_ATGIQ'
    )
    BEGIN
        -- ALTER the table with explicit schema
        CREATE TABLE [WH_ATGIQ].[fpx].[Dim_Destination]
        (
            [LOC_ID] decimal(10,0) NULL,
            [LocationCode] varchar(100) NULL,
            [LocationName] varchar(100) NULL,
            [LocationIATACode] varchar(100) NULL,
            [LocationICAOCode] varchar(100) NULL,
            [IsAirport] varchar(100) NULL,
            [IsMonopolistic] varchar(100) NULL,
            [CNTRY_ID] decimal(10,0) NULL,
            [CountryName] varchar(100) NULL,
            [CountryISOCode] varchar(100) NULL,
            [Continent] varchar(100) NULL,
            [StateCode] varchar(100) NULL,
            [StateName] varchar(100) NULL
        );
    END
    ELSE
    BEGIN
        -- Truncate the table if it exists
        TRUNCATE TABLE [WH_ATGIQ].[fpx].[Dim_Destination];
    

    -- Insert data from the Lakehouse view
    INSERT INTO [WH_ATGIQ].[fpx].[Dim_Destination] (
        [LOC_ID],
        [LocationCode],
        [LocationName],
        [LocationIATACode],
        [LocationICAOCode],
        [IsAirport],
        [IsMonopolistic],
        [CNTRY_ID],
        [CountryName],
        [CountryISOCode],
        [Continent],
        [StateCode],
        [StateName]
    )
    SELECT
        [LOC_ID],
        [LocationCode],
        [LocationName],
        [LocationIATACode],
        [LocationICAOCode],
        [IsAirport],
        [IsMonopolistic],
        [CNTRY_ID],
        [CountryName],
        [CountryISOCode],
        [Continent],
        [StateCode],
        [StateName]
    FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Geography];
    END
END