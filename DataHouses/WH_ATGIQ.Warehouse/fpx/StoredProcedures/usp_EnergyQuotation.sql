CREATE           PROCEDURE [fpx].[usp_EnergyQuotation]
AS
BEGIN
    SET NOCOUNT ON;

    IF OBJECT_ID('[fpx].[Report_EnergyQuotation]', 'U') IS NULL
    BEGIN
        SELECT 
              q.QuotationId
            , q.QuotationName
            , q.TimeseriesName
            , q.AverageMethod
            , q.Commodity
            , q.FinancialSource
            , q.OriginalCurrency
            , q.OriginalUnit

            , p.PeriodFrom
            , p.PeriodTo
            , p.QuotationValue
            -- YYYY-MM (from)
            ,CAST(YEAR(p.PeriodFrom) AS varchar(4)) + '-' + RIGHT('00' + CAST(MONTH(p.PeriodFrom) AS varchar(2)), 2) AS MonthYearFrom
            ,CAST(YEAR(p.PeriodTo) AS varchar(4)) + '-' + RIGHT('00' + CAST(MONTH(p.PeriodTo) AS varchar(2)), 2) AS MonthYearTo
            -- YYYY-WW (ISO week padded)
            ,CAST(YEAR(p.PeriodFrom) AS varchar(4)) + '-' + RIGHT('00' + CAST(DATEPART(ISO_WEEK, p.PeriodFrom) AS varchar(2)), 2) AS WeekYearFrom


        INTO [fpx].[Report_EnergyQuotation]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_EnergyQuotation] AS q
        LEFT JOIN [LH_ATGIQ].[fpx_raw].[V_ANLF_EnergyQuotPricesSys] AS p
               ON q.QuotationId = p.QuotationId;
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Report_EnergyQuotation];

        INSERT INTO [fpx].[Report_EnergyQuotation]
        SELECT 
              q.QuotationId
            , q.QuotationName
            , q.TimeseriesName
            , q.AverageMethod
            , q.Commodity
            , q.FinancialSource
            , q.OriginalCurrency
            , q.OriginalUnit

            , p.PeriodFrom
            , p.PeriodTo
            , p.QuotationValue
            -- YYYY-MM (from)
            ,CAST(YEAR(p.PeriodFrom) AS varchar(4)) + '-' + RIGHT('00' + CAST(MONTH(p.PeriodFrom) AS varchar(2)), 2) AS MonthYearFrom
            ,CAST(YEAR(p.PeriodTo) AS varchar(4)) + '-' + RIGHT('00' + CAST(MONTH(p.PeriodTo) AS varchar(2)), 2) AS MonthYearTo
            -- YYYY-WW (ISO week padded)
            ,CAST(YEAR(p.PeriodFrom) AS varchar(4)) + '-' + RIGHT('00' + CAST(DATEPART(ISO_WEEK, p.PeriodFrom) AS varchar(2)), 2) AS WeekYearFrom

        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_EnergyQuotation] AS q
        LEFT JOIN [LH_ATGIQ].[fpx_raw].[V_ANLF_EnergyQuotPricesSys] AS p
               ON q.QuotationId = p.QuotationId;
    END
END;