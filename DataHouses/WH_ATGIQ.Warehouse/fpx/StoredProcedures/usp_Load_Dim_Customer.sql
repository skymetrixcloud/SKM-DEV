CREATE            PROCEDURE [fpx].[usp_Load_Dim_Customer]
AS
BEGIN
 

    IF OBJECT_ID('[fpx].[Dim_Customer]', 'U') IS NULL
    BEGIN
        SELECT
           [CLIENT_ID],
			[ClientCode],
			[ClientName],
			[CustomerCode],
			[CustomerICAOCode],
			[CustomerName],
			[CO_GRP_ID],
			[GroupCode],
			[GroupName],
			[CO_ID]
        INTO [fpx].[Dim_Customer]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Customer];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Dim_Customer];

        INSERT INTO [fpx].[Dim_Customer] (
           [CLIENT_ID],
			[ClientCode],
			[ClientName],
			[CustomerCode],
			[CustomerICAOCode],
			[CustomerName],
			[CO_GRP_ID],
			[GroupCode],
			[GroupName],
			[CO_ID]
        )
        SELECT
            [CLIENT_ID],
			[ClientCode],
			[ClientName],
			[CustomerCode],
			[CustomerICAOCode],
			[CustomerName],
			[CO_GRP_ID],
			[GroupCode],
			[GroupName],
			[CO_ID]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Customer];
    END
END