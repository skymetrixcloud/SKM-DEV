CREATE  PROCEDURE [fpx].[usp_Load_Fact_BillbackUnbilledEvents]
AS
BEGIN
 

    IF OBJECT_ID('[fpx].[Fact_BillbackUnbilledEvents]', 'U') IS NULL
    BEGIN
        SELECT
         [ObjectType],
			[ObjectId],
			[InvoiceCategory],
			[IsClosed],
			[DeliveryDate],
			[Departure],
			[Currency],
			[InvoicedAmount],
			[CLIENT_ID],
			[GlDate],
			[ReleaseDate],
			[InvoiceDate],
			[InvoiceNo],
			[TicketNo],
			[Quantity],
			[Unit],
			[NetAmount],
			[VatAmount],
			[Destination],
			[Registration],
			[FlightType],
			[FinalCustomer],
			[Reseller],
			[Supplier]

		 INTO [fpx].[Fact_BillbackUnbilledEvents]
       FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_BillbackUnbilledEvents];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Fact_BillbackUnbilledEvents];

        INSERT INTO [fpx].[Fact_BillbackUnbilledEvents] (
     [ObjectType],
			[ObjectId],
			[InvoiceCategory],
			[IsClosed],
			[DeliveryDate],
			[Departure],
			[Currency],
			[InvoicedAmount],
			[CLIENT_ID],
			[GlDate],
			[ReleaseDate],
			[InvoiceDate],
			[InvoiceNo],
			[TicketNo],
			[Quantity],
			[Unit],
			[NetAmount],
			[VatAmount],
			[Destination],
			[Registration],
			[FlightType],
			[FinalCustomer],
			[Reseller],
			[Supplier]

        )
        SELECT
  	[ObjectType],
			[ObjectId],
			[InvoiceCategory],
			[IsClosed],
			[DeliveryDate],
			[Departure],
			[Currency],
			[InvoicedAmount],
			[CLIENT_ID],
			[GlDate],
			[ReleaseDate],
			[InvoiceDate],
			[InvoiceNo],
			[TicketNo],
			[Quantity],
			[Unit],
			[NetAmount],
			[VatAmount],
			[Destination],
			[Registration],
			[FlightType],
			[FinalCustomer],
			[Reseller],
			[Supplier]
FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_BillbackUnbilledEvents]
    END
END