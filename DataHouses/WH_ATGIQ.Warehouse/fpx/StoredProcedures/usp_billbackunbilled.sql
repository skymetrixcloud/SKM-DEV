CREATE     PROCEDURE [fpx].[usp_billbackunbilled]
AS
BEGIN
    SET NOCOUNT ON;
 
    -- Check if destination table exists
    IF OBJECT_ID('[fpx].[Report_Billback_Unbilled]', 'U') IS NULL
    BEGIN
        CREATE TABLE [fpx].[Report_Billback_Unbilled] AS
        SELECT 
			BBU.ObjectType,
			BBU.ObjectId,
			BBU.InvoiceCategory,
			BBU.IsClosed,
			BBU.DeliveryDate,
			BBU.Departure,
			BBU.Destination,
			BBU.Registration,
			BBU.FlightType,
			BBU.FinalCustomer,
			BBU.Reseller,
			BBU.Supplier,
			BBU.InvoiceNo,
			BBU.TicketNo,
			BBU.Quantity,
			BBU.Unit,
			BBU.NetAmount,
			BBU.VatAmount,
			BBU.Currency,
			BBU.InvoicedAmount,
			BBU.CLIENT_ID,
			BBU.GlDate,
			BBU.ReleaseDate,
			BBU.InvoiceDate
 
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_BillbackUnbilledEvents] BBU;
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Report_Billback_Unbilled];
 
        INSERT INTO [fpx].[Report_Billback_Unbilled]
        SELECT 
            BBU.ObjectType,
			BBU.ObjectId,
			BBU.InvoiceCategory,
			BBU.IsClosed,
			BBU.DeliveryDate,
			BBU.Departure,
			BBU.Destination,
			BBU.Registration,
			BBU.FlightType,
			BBU.FinalCustomer,
			BBU.Reseller,
			BBU.Supplier,
			BBU.InvoiceNo,
			BBU.TicketNo,
			BBU.Quantity,
			BBU.Unit,
			BBU.NetAmount,
			BBU.VatAmount,
			BBU.Currency,
			BBU.InvoicedAmount,
			BBU.CLIENT_ID,
			BBU.GlDate,
			BBU.ReleaseDate,
			BBU.InvoiceDate
 
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_BillbackUnbilledEvents] BBU
 
    END
END