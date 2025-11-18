CREATE TABLE [fpx].[Report_Pos_Invoice_Discrepancy] (

	[ClientCode] varchar(8000) NULL, 
	[InvoiceCategory] varchar(8000) NULL, 
	[InvoiceDate] datetime2(6) NULL, 
	[SupplierName] varchar(8000) NULL, 
	[InvoiceCount] int NULL, 
	[ItemsCount] float NULL, 
	[TotalAmount] float NULL, 
	[QuantityDiscrepancyCount] float NULL, 
	[AmountDiscrepancyCount] float NULL, 
	[VATDiscrepancyCount] float NULL, 
	[QuantityInvoiced] float NULL, 
	[QuantityExpected] float NULL, 
	[QuantityDifference] float NULL, 
	[QuantityDifferenceAsAmount] float NULL, 
	[AmountInvoiced] float NULL, 
	[AmountExpected] float NULL, 
	[AmountDifference] float NULL, 
	[VATInvoiced] float NULL, 
	[VATExpected] float NULL, 
	[VATDifference] float NULL
);