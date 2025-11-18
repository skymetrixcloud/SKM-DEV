CREATE              PROCEDURE [fpx].[usp_Load_Dim_Counterparty]
AS
BEGIN
    SET NOCOUNT ON;


    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'fpx'
          AND TABLE_NAME = 'Dim_Counterparty'
          AND TABLE_CATALOG = 'WH_ATGIQ'
    )
    BEGIN
    
            CREATE TABLE fpx.Dim_Counterparty AS
			SELECT [CO_ID],
			[CounterpartyCode],
			[CounterpartyName]
			FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Counterparty]
    END
    ELSE
    BEGIN

        TRUNCATE TABLE [fpx].[Dim_Counterparty];

   
    INSERT INTO [WH_ATGIQ].[fpx].[Dim_Counterparty] (
 			[CO_ID],
			[CounterpartyCode],
			[CounterpartyName]
			)
			SELECT [CO_ID],
			[CounterpartyCode],
			[CounterpartyName]
FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Counterparty]
END
END