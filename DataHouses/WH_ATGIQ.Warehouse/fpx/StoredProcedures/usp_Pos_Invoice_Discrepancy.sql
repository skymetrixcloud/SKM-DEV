CREATE       PROCEDURE [fpx].[usp_Pos_Invoice_Discrepancy]
AS
BEGIN
    SET NOCOUNT ON;

    -- ALTER the table if it does not exist
    IF OBJECT_ID('[fpx].[Report_Pos_Invoice_Discrepancy]', 'U') IS NULL
    BEGIN
        SELECT 
              c.ClientCode AS ClientCode
            , i.InvoiceCategory
            , i.InvoiceDate
            , s.SupplierName
            , COUNT(*) AS InvoiceCount
            , SUM(i.ItemsCount) AS ItemsCount
            , ROUND(SUM(i.InvoiceAmountSys), 0) AS TotalAmount
            , SUM(d.QuantityDiscrepancyCount)   AS QuantityDiscrepancyCount
            , SUM(d.AmountDiscrepancyCount)     AS AmountDiscrepancyCount
            , SUM(d.VATDiscrepancyCount)        AS VATDiscrepancyCount
            , SUM(d.QuantityInvoiced)           AS QuantityInvoiced
            , SUM(d.QuantityExpected)           AS QuantityExpected
            , SUM(d.QuantityDifference)         AS QuantityDifference
            , SUM(d.QuantityDifferenceAsAmount) AS QuantityDifferenceAsAmount
            , SUM(d.AmountInvoiced)             AS AmountInvoiced
            , SUM(d.AmountExpected)             AS AmountExpected
            , SUM(d.AmountDifference)           AS AmountDifference
            , SUM(d.VATInvoiced)                AS VATInvoiced
            , SUM(d.VATExpected)                AS VATExpected
            , SUM(d.VATDifference)              AS VATDifference
        INTO [fpx].[Report_Pos_Invoice_Discrepancy]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_Invoice] i
        LEFT JOIN (
            SELECT "InvoiceID"
                 , SUM("QuantityDiscrepancyCount")     AS "QuantityDiscrepancyCount"
                 , SUM("AmountDiscrepancyCount")       AS "AmountDiscrepancyCount"
                 , SUM("VATDiscrepancyCount")          AS "VATDiscrepancyCount"
                 , SUM("QuantityInvoiced")             AS "QuantityInvoiced"
                 , SUM("QuantityExpected")             AS "QuantityExpected"
                 , SUM("QuantityDifference")           AS "QuantityDifference"
                 , SUM("QuantityDifferenceAsAmount")   AS "QuantityDifferenceAsAmount"
                 , SUM("AmountInvoiced")               AS "AmountInvoiced"
                 , SUM("AmountExpected")               AS "AmountExpected"
                 , SUM("AmountDifference")             AS "AmountDifference"
                 , SUM("VATInvoiced")                  AS "VATInvoiced"
                 , SUM("VATExpected")                  AS "VATExpected"
                 , SUM("VATDifference")                AS "VATDifference"
            FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_InvoiceItemDiscrepancy]
            GROUP BY "InvoiceID"
        ) d  ON i.InvoiceID = d.InvoiceID
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
        TRUNCATE TABLE [fpx].[Report_Pos_Invoice_Discrepancy];

        INSERT INTO [fpx].[Report_Pos_Invoice_Discrepancy]
        SELECT 
              c.ClientCode AS ClientCode
            , i.InvoiceCategory
            , i.InvoiceDate
            , s.SupplierName
            , COUNT(*) AS InvoiceCount
            , SUM(i.ItemsCount) AS ItemsCount
            , ROUND(SUM(i.InvoiceAmountSys), 0) AS TotalAmount
            , SUM(d.QuantityDiscrepancyCount)   AS QuantityDiscrepancyCount
            , SUM(d.AmountDiscrepancyCount)     AS AmountDiscrepancyCount
            , SUM(d.VATDiscrepancyCount)        AS VATDiscrepancyCount
            , SUM(d.QuantityInvoiced)           AS QuantityInvoiced
            , SUM(d.QuantityExpected)           AS QuantityExpected
            , SUM(d.QuantityDifference)         AS QuantityDifference
            , SUM(d.QuantityDifferenceAsAmount) AS QuantityDifferenceAsAmount
            , SUM(d.AmountInvoiced)             AS AmountInvoiced
            , SUM(d.AmountExpected)             AS AmountExpected
            , SUM(d.AmountDifference)           AS AmountDifference
            , SUM(d.VATInvoiced)                AS VATInvoiced
            , SUM(d.VATExpected)                AS VATExpected
            , SUM(d.VATDifference)              AS VATDifference
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_Invoice] i
        LEFT JOIN (
            SELECT "InvoiceID"
                 , SUM("QuantityDiscrepancyCount")     AS "QuantityDiscrepancyCount"
                 , SUM("AmountDiscrepancyCount")       AS "AmountDiscrepancyCount"
                 , SUM("VATDiscrepancyCount")          AS "VATDiscrepancyCount"
                 , SUM("QuantityInvoiced")             AS "QuantityInvoiced"
                 , SUM("QuantityExpected")             AS "QuantityExpected"
                 , SUM("QuantityDifference")           AS "QuantityDifference"
                 , SUM("QuantityDifferenceAsAmount")   AS "QuantityDifferenceAsAmount"
                 , SUM("AmountInvoiced")               AS "AmountInvoiced"
                 , SUM("AmountExpected")               AS "AmountExpected"
                 , SUM("AmountDifference")             AS "AmountDifference"
                 , SUM("VATInvoiced")                  AS "VATInvoiced"
                 , SUM("VATExpected")                  AS "VATExpected"
                 , SUM("VATDifference")                AS "VATDifference"
            FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_InvoiceItemDiscrepancy]
            GROUP BY "InvoiceID"
        ) d  ON i.InvoiceID = d.InvoiceID
        INNER JOIN [LH_ATGIQ].[fpx_raw].[V_ANLD_Client]   c ON i.CLIENT_ID = c.CLIENT_ID
        INNER JOIN [LH_ATGIQ].[fpx_raw].[V_ANLD_Supplier] s ON s.CO_ID     = i.CP_CO_ID
        WHERE i.InvoiceStillOpen = 'N'
          AND i.InvoiceAmountSys > 0
        GROUP BY c.ClientCode, i.InvoiceCategory, i.InvoiceDate, s.SupplierName
        ORDER BY c.ClientCode, i.InvoiceCategory;
    END
END;