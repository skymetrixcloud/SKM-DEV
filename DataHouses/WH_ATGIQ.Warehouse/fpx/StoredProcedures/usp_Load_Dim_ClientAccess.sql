CREATE         PROCEDURE [fpx].[usp_Load_Dim_ClientAccess]
AS
BEGIN
 

    IF OBJECT_ID('[fpx].[Dim_ClientAccess]', 'U') IS NULL
    BEGIN
    CREATE TABLE [fpx].[Dim_ClientAccess] AS
        SELECT
            [LoginName],
			[CLIENT_ID],
			[ClientCode],
			[ClientName]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_ClientAccess]
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Dim_ClientAccess];

        INSERT INTO [fpx].[Dim_ClientAccess] (
         [LoginName],
			[CLIENT_ID],
			[ClientCode],
			[ClientName]

        )
        SELECT
        [LoginName],
			[CLIENT_ID],
			[ClientCode],
			[ClientName]
    FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_ClientAccess]
    END
END