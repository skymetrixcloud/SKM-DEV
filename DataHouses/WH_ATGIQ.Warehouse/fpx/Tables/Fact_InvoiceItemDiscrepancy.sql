CREATE TABLE [fpx].[Fact_InvoiceItemDiscrepancy] (

	[InvoiceItemID] float NULL, 
	[InvoiceID] float NULL, 
	[QuantityDiscrepancyCount] float NULL, 
	[AmountDiscrepancyCount] float NULL, 
	[VATDiscrepancyCount] float NULL, 
	[QuantityInvoiced] float NULL, 
	[VATInvoiced] float NULL, 
	[VATExpected] float NULL, 
	[VATDifference] float NULL, 
	[QuantityExpected] float NULL, 
	[QuantityDifference] float NULL, 
	[QuantityDifferenceAsAmount] float NULL, 
	[AmountInvoiced] float NULL, 
	[AmountExpected] float NULL, 
	[AmountDifference] float NULL
);