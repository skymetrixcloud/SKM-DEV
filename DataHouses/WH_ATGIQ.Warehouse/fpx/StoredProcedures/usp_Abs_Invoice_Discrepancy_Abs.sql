CREATE       PROCEDURE [fpx].[usp_Abs_Invoice_Discrepancy_Abs]
AS
BEGIN
    SET NOCOUNT ON;
 
    -- ALTER the table if it does not exist
    IF OBJECT_ID('[fpx].[Report_Abs_Invoice_Discrepancy]', 'U') IS NULL
    BEGIN
        SELECT
              c.ClientCode AS ClientCode
            , i.InvoiceCategory
            , i.InvoiceDate
            , s.SupplierName
            , COUNT(*) AS InvoiceCount
            , SUM(ABS(i.ItemsCount)) AS ItemsCount
            , ROUND(SUM(ABS(i.InvoiceAmountSys)), 0) AS TotalAmount
            , SUM(ABS(d.QuantityDiscrepancyCount))   AS QuantityDiscrepancyCount
            , SUM(ABS(d.AmountDiscrepancyCount))     AS AmountDiscrepancyCount
            , SUM(ABS(d.VATDiscrepancyCount))        AS VATDiscrepancyCount
            , SUM(ABS(d.QuantityInvoiced))           AS QuantityInvoiced
            , SUM(ABS(d.QuantityExpected))           AS QuantityExpected
            , SUM(ABS(d.QuantityDifference))         AS QuantityDifference
            , SUM(ABS(d.QuantityDifferenceAsAmount)) AS QuantityDifferenceAsAmount
            , SUM(ABS(d.AmountInvoiced))             AS AmountInvoiced
            , SUM(ABS(d.AmountExpected))             AS AmountExpected
            , SUM(ABS(d.AmountDifference))           AS AmountDifference
            , SUM(ABS(d.VATInvoiced))                AS VATInvoiced
            , SUM(ABS(d.VATExpected))                AS VATExpected
            , SUM(ABS(d.VATDifference))              AS VATDifference
        INTO [fpx].[Report_Abs_Invoice_Discrepancy]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_Invoice] i
        LEFT JOIN (
            SELECT 
                  "InvoiceID"
                , SUM(ABS("QuantityDiscrepancyCount"))       AS QuantityDiscrepancyCount
                , SUM(ABS("AmountDiscrepancyCount"))         AS AmountDiscrepancyCount
                , SUM(ABS("VATDiscrepancyCount"))            AS VATDiscrepancyCount
                , SUM(ABS("QuantityInvoiced"))               AS QuantityInvoiced
                , SUM(ABS("QuantityExpected"))               AS QuantityExpected
                , SUM(ABS("QuantityDifference"))             AS QuantityDifference
                , SUM(ABS("QuantityDifferenceAsAmount"))     AS QuantityDifferenceAsAmount
                , SUM(ABS("AmountInvoiced"))                 AS AmountInvoiced
                , SUM(ABS("AmountExpected"))                 AS AmountExpected
                , SUM(ABS("AmountDifference"))               AS AmountDifference
                , SUM(ABS("VATInvoiced"))                    AS VATInvoiced
                , SUM(ABS("VATExpected"))                    AS VATExpected
                , SUM(ABS("VATDifference"))                  AS VATDifference
            FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_InvoiceItemDiscrepancy]
            GROUP BY "InvoiceID"
        ) d ON i.InvoiceID = d.InvoiceID
        INNER JOIN [LH_ATGIQ].[fpx_raw].[V_ANLD_Client]   c ON i.CLIENT_ID = c.CLIENT_ID
        INNER JOIN [LH_ATGIQ].[fpx_raw].[V_ANLD_Supplier] s ON s.CO_ID     = i.CP_CO_ID
        WHERE i.InvoiceStillOpen = 'N'
          AND i.InvoiceAmountSys > 0
        GROUP BY c.ClientCode, i.InvoiceCategory, i.InvoiceDate, s.SupplierName
        ORDER BY c.ClientCode, i.InvoiceCategory;
    END
    ELSE
    BEGIN
        -- If the table exists, refresh it
        TRUNCATE TABLE [fpx].[Report_Abs_Invoice_Discrepancy];
 
        INSERT INTO [fpx].[Report_Abs_Invoice_Discrepancy]
        SELECT
              c.ClientCode AS ClientCode
            , i.InvoiceCategory
            , i.InvoiceDate
            , s.SupplierName
            , COUNT(*) AS InvoiceCount
            , SUM(ABS(i.ItemsCount)) AS ItemsCount
            , ROUND(SUM(ABS(i.InvoiceAmountSys)), 0) AS TotalAmount
            , SUM(ABS(d.QuantityDiscrepancyCount))   AS QuantityDiscrepancyCount
            , SUM(ABS(d.AmountDiscrepancyCount))     AS AmountDiscrepancyCount
            , SUM(ABS(d.VATDiscrepancyCount))        AS VATDiscrepancyCount
            , SUM(ABS(d.QuantityInvoiced))           AS QuantityInvoiced
            , SUM(ABS(d.QuantityExpected))           AS QuantityExpected
            , SUM(ABS(d.QuantityDifference))         AS QuantityDifference
            , SUM(ABS(d.QuantityDifferenceAsAmount)) AS QuantityDifferenceAsAmount
            , SUM(ABS(d.AmountInvoiced))             AS AmountInvoiced
            , SUM(ABS(d.AmountExpected))             AS AmountExpected
            , SUM(ABS(d.AmountDifference))           AS AmountDifference
            , SUM(ABS(d.VATInvoiced))                AS VATInvoiced
            , SUM(ABS(d.VATExpected))                AS VATExpected
            , SUM(ABS(d.VATDifference))              AS VATDifference
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_Invoice] i
        LEFT JOIN (
            SELECT 
                  "InvoiceID"
                , SUM(ABS("QuantityDiscrepancyCount"))       AS QuantityDiscrepancyCount
                , SUM(ABS("AmountDiscrepancyCount"))         AS AmountDiscrepancyCount
                , SUM(ABS("VATDiscrepancyCount"))            AS VATDiscrepancyCount
                , SUM(ABS("QuantityInvoiced"))               AS QuantityInvoiced
                , SUM(ABS("QuantityExpected"))               AS QuantityExpected
                , SUM(ABS("QuantityDifference"))             AS QuantityDifference
                , SUM(ABS("QuantityDifferenceAsAmount"))     AS QuantityDifferenceAsAmount
                , SUM(ABS("AmountInvoiced"))                 AS AmountInvoiced
                , SUM(ABS("AmountExpected"))                 AS AmountExpected
                , SUM(ABS("AmountDifference"))               AS AmountDifference
                , SUM(ABS("VATInvoiced"))                    AS VATInvoiced
                , SUM(ABS("VATExpected"))                    AS VATExpected
                , SUM(ABS("VATDifference"))                  AS VATDifference
            FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_InvoiceItemDiscrepancy]
            GROUP BY "InvoiceID"
        ) d ON i.InvoiceID = d.InvoiceID
        INNER JOIN [LH_ATGIQ].[fpx_raw].[V_ANLD_Client]   c ON i.CLIENT_ID = c.CLIENT_ID
        INNER JOIN [LH_ATGIQ].[fpx_raw].[V_ANLD_Supplier] s ON s.CO_ID     = i.CP_CO_ID
        WHERE i.InvoiceStillOpen = 'N'
          AND i.InvoiceAmountSys > 0
        GROUP BY c.ClientCode, i.InvoiceCategory, i.InvoiceDate, s.SupplierName
        ORDER BY c.ClientCode, i.InvoiceCategory;
    END
END;