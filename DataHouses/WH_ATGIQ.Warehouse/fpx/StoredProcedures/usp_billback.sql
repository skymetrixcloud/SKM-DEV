CREATE  PROCEDURE [fpx].[usp_billback]
AS
BEGIN
    SET NOCOUNT ON;

    IF OBJECT_ID('[fpx].[Report_Billback]', 'U') IS NULL
    BEGIN
        -- ALTER and load on first run
        SELECT 
            bb.[InvoiceID],
            bb.[InvoiceLevel],
            bb.[CLIENT_ID],
            bb.[CNTPRTY_CO_ID],
            bb.[INV_ISSUER_ID],
            bb.[RCV_CO_ID],
            bb.[LOC_ID],
            bb.[IsIPL],
            bb.[InvoiceNo],
            bb.[InvoiceDate],
            bb.[InputDate],
            bb.[ApprovalDate],
            bb.[DueDate],
            bb.[DeliveryFrom],
            bb.[DeliveryTo],
            bb.[InvoiceType],
            bb.[InvoiceCategory],
            bb.[InvoiceStatus],
            bb.[ItemsCount],
            bb.[InvoiceAmount],
            bb.[InvoiceCurrency],
            bb.[InvoiceAmountSys],
            bb.[QuantitySys],
            bb.[CounterpartyAgreement],
            bb.[TransactionType],
            cp.[CounterpartyCode],
            cp.[CounterpartyName]
        INTO [fpx].[Report_Billback]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_BillbackInvoice] AS bb
        LEFT JOIN [LH_ATGIQ].[fpx_raw].[V_ANLD_Counterparty] AS cp
            ON cp.[CO_ID] = bb.[RCV_CO_ID];
    END
    ELSE
    BEGIN
        -- Refresh thereafter
        TRUNCATE TABLE [fpx].[Report_Billback];

        INSERT INTO [fpx].[Report_Billback] (
            [InvoiceID],
            [InvoiceLevel],
            [CLIENT_ID],
            [CNTPRTY_CO_ID],
            [INV_ISSUER_ID],
            [RCV_CO_ID],
            [LOC_ID],
            [IsIPL],
            [InvoiceNo],
            [InvoiceDate],
            [InputDate],
            [ApprovalDate],
            [DueDate],
            [DeliveryFrom],
            [DeliveryTo],
            [InvoiceType],
            [InvoiceCategory],
            [InvoiceStatus],
            [ItemsCount],
            [InvoiceAmount],
            [InvoiceCurrency],
            [InvoiceAmountSys],
            [QuantitySys],
            [CounterpartyAgreement],
            [TransactionType],
            [CounterpartyCode],
            [CounterpartyName]
        )
        SELECT 
            bb.[InvoiceID],
            bb.[InvoiceLevel],
            bb.[CLIENT_ID],
            bb.[CNTPRTY_CO_ID],
            bb.[INV_ISSUER_ID],
            bb.[RCV_CO_ID],
            bb.[LOC_ID],
            bb.[IsIPL],
            bb.[InvoiceNo],
            bb.[InvoiceDate],
            bb.[InputDate],
            bb.[ApprovalDate],
            bb.[DueDate],
            bb.[DeliveryFrom],
            bb.[DeliveryTo],
            bb.[InvoiceType],
            bb.[InvoiceCategory],
            bb.[InvoiceStatus],
            bb.[ItemsCount],
            bb.[InvoiceAmount],
            bb.[InvoiceCurrency],
            bb.[InvoiceAmountSys],
            bb.[QuantitySys],
            bb.[CounterpartyAgreement],
            bb.[TransactionType],
            cp.[CounterpartyCode],
            cp.[CounterpartyName]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_BillbackInvoice] AS bb
        LEFT JOIN [LH_ATGIQ].[fpx_raw].[V_ANLD_Counterparty] AS cp
            ON cp.[CO_ID] = bb.[RCV_CO_ID];
    END
END