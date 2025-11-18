CREATE               PROCEDURE [fpx].[usp_Load_Dim_InvoiceIssuer]
AS
BEGIN
    SET NOCOUNT ON;


    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'fpx'
          AND TABLE_NAME = 'Dim_InvoiceIssuer'
          AND TABLE_CATALOG = 'WH_ATGIQ'
    )
    BEGIN
    
            CREATE TABLE fpx.Dim_InvoiceIssuer AS
			SELECT [INV_ISSUER_ID],
						[InvoiceIssuerCode],
						[InvoiceIssuerName],
						[CLIENT_ID],
						[ClientCode],
						[ClientName],
						[CO_ID],
						[CounterpartyCode],
						[CounterpartyName]
			FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_InvoiceIssuer]
    END
    ELSE
    BEGIN

        TRUNCATE TABLE [fpx].[Dim_InvoiceIssuer];


   
    INSERT INTO [WH_ATGIQ].[fpx].[Dim_InvoiceIssuer] (
 			 [INV_ISSUER_ID],
			[InvoiceIssuerCode],
			[InvoiceIssuerName],
			[CLIENT_ID],
			[ClientCode],
			[ClientName],
			[CO_ID],
			[CounterpartyCode],
			[CounterpartyName]
			)
			SELECT [INV_ISSUER_ID],
						[InvoiceIssuerCode],
						[InvoiceIssuerName],
						[CLIENT_ID],
						[ClientCode],
						[ClientName],
						[CO_ID],
						[CounterpartyCode],
						[CounterpartyName]
			FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_InvoiceIssuer]
	END
END