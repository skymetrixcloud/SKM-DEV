CREATE          PROCEDURE [fpx].[usp_Load_Dim_CustomerAccess]
AS
BEGIN
 

    IF OBJECT_ID('[fpx].[Dim_CustomerAccess]', 'U') IS NULL
    BEGIN
        SELECT
            [LoginName],
			[CO_ID],
			[CustomerCode],
			[CustomerName],
			[CustomerICAOCode]
        INTO [fpx].[Dim_CustomerAccess]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_CustomerAccess];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Dim_CustomerAccess];

        INSERT INTO [fpx].[Dim_CustomerAccess] (
          [LoginName],
			[CO_ID],
			[CustomerCode],
			[CustomerName],
			[CustomerICAOCode]
        )
        SELECT
           [LoginName],
			[CO_ID],
			[CustomerCode],
			[CustomerName],
			[CustomerICAOCode]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_CustomerAccess];
    END
END