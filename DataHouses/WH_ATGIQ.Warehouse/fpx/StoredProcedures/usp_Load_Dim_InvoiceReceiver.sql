CREATE               PROCEDURE [fpx].[usp_Load_Dim_InvoiceReceiver]
AS
BEGIN
    SET NOCOUNT ON;


    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'fpx'
          AND TABLE_NAME = 'Dim_InvoiceReceiver'
          AND TABLE_CATALOG = 'WH_ATGIQ'
    )
    BEGIN
    
            CREATE TABLE fpx.Dim_InvoiceReceiver AS
			SELECT [CO_ID],
			[InvoiceReceiverCode],
			[InvoiceReceiverName],
			[CLIENT_ID],
			[ClientCode],
			[ClientName]
			FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_InvoiceReceiver]
    END
    ELSE
    BEGIN

        TRUNCATE TABLE [fpx].[Dim_InvoiceReceiver];


   
    INSERT INTO [WH_ATGIQ].[fpx].[Dim_InvoiceReceiver] (
 			 [CO_ID],
			[InvoiceReceiverCode],
			[InvoiceReceiverName],
			[CLIENT_ID],
			[ClientCode],
			[ClientName]
			)
			SELECT [CO_ID],
			[InvoiceReceiverCode],
			[InvoiceReceiverName],
			[CLIENT_ID],
			[ClientCode],
			[ClientName]
			FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_InvoiceReceiver]
	END
END