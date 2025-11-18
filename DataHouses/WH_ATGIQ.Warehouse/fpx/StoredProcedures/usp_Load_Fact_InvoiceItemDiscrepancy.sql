CREATE               PROCEDURE [fpx].[usp_Load_Fact_InvoiceItemDiscrepancy]
AS
BEGIN
    SET NOCOUNT ON;


    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'fpx'
          AND TABLE_NAME = 'Fact_InvoiceItemDiscrepancy'
          AND TABLE_CATALOG = 'WH_ATGIQ'
    )
    BEGIN
    
            CREATE TABLE fpx.Fact_InvoiceItemDiscrepancy AS
			SELECT [InvoiceItemID],
			[InvoiceID],
			[QuantityDiscrepancyCount],
			[AmountDiscrepancyCount],
			[VATDiscrepancyCount],
			[QuantityInvoiced],
			[VATInvoiced],
			[VATExpected],
			[VATDifference],
			[QuantityExpected],
			[QuantityDifference],
			[QuantityDifferenceAsAmount],
			[AmountInvoiced],
			[AmountExpected],
			[AmountDifference]
FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_InvoiceItemDiscrepancy]
    END
    ELSE
    BEGIN

        TRUNCATE TABLE [fpx].[Fact_InvoiceItemDiscrepancy];

   
    INSERT INTO [WH_ATGIQ].[fpx].[Fact_InvoiceItemDiscrepancy] (
 			[InvoiceItemID],
			[InvoiceID],
			[QuantityDiscrepancyCount],
			[AmountDiscrepancyCount],
			[VATDiscrepancyCount],
			[QuantityInvoiced],
			[VATInvoiced],
			[VATExpected],
			[VATDifference],
			[QuantityExpected],
			[QuantityDifference],
			[QuantityDifferenceAsAmount],
			[AmountInvoiced],
			[AmountExpected],
			[AmountDifference]
			)
			SELECT [InvoiceItemID],
			[InvoiceID],
			[QuantityDiscrepancyCount],
			[AmountDiscrepancyCount],
			[VATDiscrepancyCount],
			[QuantityInvoiced],
			[VATInvoiced],
			[VATExpected],
			[VATDifference],
			[QuantityExpected],
			[QuantityDifference],
			[QuantityDifferenceAsAmount],
			[AmountInvoiced],
			[AmountExpected],
			[AmountDifference]
FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_InvoiceItemDiscrepancy]
END
END