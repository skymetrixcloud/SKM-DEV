CREATE  PROCEDURE [fpx].[usp_Load_Fact_BillbackInvoice]
AS
BEGIN
 

    IF OBJECT_ID('[fpx].[Fact_BillbackInvoice]', 'U') IS NULL
    BEGIN
        SELECT
          [InvoiceID],
			[InvoiceLevel],
			[CLIENT_ID],
			[CNTPRTY_CO_ID],
			[INV_ISSUER_ID],
			[RCV_CO_ID],
			[TransactionType],
			[ItemsCount],
			[InvoiceAmount],
			[InvoiceCurrency],
			[InvoiceAmountSys],
			[QuantitySys],
			[CounterpartyAgreement],
			[DueDate],
			[DeliveryFrom],
			[DeliveryTo],
			[InvoiceType],
			[InvoiceCategory],
			[InvoiceStatus],
			[LOC_ID],
			[IsIPL],
			[InvoiceNo],
			[InvoiceDate],
			[InputDate],
			[ApprovalDate]
		 INTO [fpx].[Fact_BillbackInvoice]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_BillbackInvoice];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Fact_BillbackInvoice];

        INSERT INTO [fpx].[Fact_BillbackInvoice] (
     [InvoiceID],
			[InvoiceLevel],
			[CLIENT_ID],
			[CNTPRTY_CO_ID],
			[INV_ISSUER_ID],
			[RCV_CO_ID],
			[TransactionType],
			[ItemsCount],
			[InvoiceAmount],
			[InvoiceCurrency],
			[InvoiceAmountSys],
			[QuantitySys],
			[CounterpartyAgreement],
			[DueDate],
			[DeliveryFrom],
			[DeliveryTo],
			[InvoiceType],
			[InvoiceCategory],
			[InvoiceStatus],
			[LOC_ID],
			[IsIPL],
			[InvoiceNo],
			[InvoiceDate],
			[InputDate],
			[ApprovalDate]
        )
        SELECT
  			 [InvoiceID],
			[InvoiceLevel],
			[CLIENT_ID],
			[CNTPRTY_CO_ID],
			[INV_ISSUER_ID],
			[RCV_CO_ID],
			[TransactionType],
			[ItemsCount],
			[InvoiceAmount],
			[InvoiceCurrency],
			[InvoiceAmountSys],
			[QuantitySys],
			[CounterpartyAgreement],
			[DueDate],
			[DeliveryFrom],
			[DeliveryTo],
			[InvoiceType],
			[InvoiceCategory],
			[InvoiceStatus],
			[LOC_ID],
			[IsIPL],
			[InvoiceNo],
			[InvoiceDate],
			[InputDate],
			[ApprovalDate]
	FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_BillbackInvoice]
    END
END