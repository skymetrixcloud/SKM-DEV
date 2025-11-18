CREATE           PROCEDURE [fpx].[usp_Load_Dim_ClientAccesscode]
AS
BEGIN
 

    IF OBJECT_ID('[fpx].[Dim_ClientAccessCode]', 'U') IS NULL
    BEGIN
    CREATE TABLE [fpx].[Dim_ClientAccessCode] AS
        SELECT DISTINCT
			[CLIENT_ID],
			[ClientCode]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_ClientAccess]
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Dim_ClientAccessCode];

        INSERT INTO [fpx].[Dim_ClientAccessCode] (
 
			[CLIENT_ID],
			[ClientCode]

        )
        SELECT DISTINCT
			[CLIENT_ID],
			[ClientCode]
    FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_ClientAccess]
    END
END