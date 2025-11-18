CREATE         PROCEDURE [fpx].[usp_Load_Dim_Supplier]
AS
BEGIN
 

    IF OBJECT_ID('[fpx].[Dim_Supplier]', 'U') IS NULL
    BEGIN
        SELECT
           [CO_ID],
			[SupplierCode],
			[SupplierName],
			[SupplierCode2],
			[SupplierCode3]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Supplier];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Dim_Supplier];

        INSERT INTO [fpx].[Dim_Supplier] (
         [CO_ID],
			[SupplierCode],
			[SupplierName],
			[SupplierCode2],
			[SupplierCode3]
        )
        SELECT
         [CO_ID],
			[SupplierCode],
			[SupplierName],
			[SupplierCode2],
			[SupplierCode3]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_Supplier];
    END
END