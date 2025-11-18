CREATE                 PROCEDURE [fpx].[usp_EnergyTimeseries]
AS
BEGIN
    SET NOCOUNT ON;

    IF OBJECT_ID('[fpx].[Report_EnergyTimeseries]', 'U') IS NULL
    BEGIN
        SELECT 
              t.TimeseriesId
            , t.TimeseriesName
            , t.Commodity
            , t.FinancialSource
            , t.OriginalCurrency
            , t.OriginalUnit


            , s.ItemDate AS Sys_ItemDate
            , s.ItemValue AS Sys_ItemValue
            , s.IsSubstituted AS Sys_IsSubstituted
            , CAST(YEAR(s.ItemDate) AS VARCHAR(4)) + '-' + RIGHT('0' + CAST(MONTH(s.ItemDate) AS VARCHAR), 2) AS MonthYearItemDate

        INTO [fpx].[Report_EnergyTimeseries]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_EnergyTimeseries] t
        LEFT JOIN [LH_ATGIQ].[fpx_raw].[V_ANLF_EnergyTsPricesSys] s ON t.TimeseriesId = s.TimeseriesId
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Report_EnergyTimeseries];

        INSERT INTO [fpx].[Report_EnergyTimeseries]
        SELECT 
              t.TimeseriesId
            , t.TimeseriesName
            , t.Commodity
            , t.FinancialSource
            , t.OriginalCurrency
            , t.OriginalUnit



            , s.ItemDate AS Sys_ItemDate
            , s.ItemValue AS Sys_ItemValue
            , s.IsSubstituted AS Sys_IsSubstituted
            , CAST(YEAR(s.ItemDate) AS VARCHAR(4)) + '-' + RIGHT('0' + CAST(MONTH(s.ItemDate) AS VARCHAR), 2) AS MonthYearItemDate



        FROM [LH_ATGIQ].[fpx_raw].[V_ANLD_EnergyTimeseries] t
        LEFT JOIN [LH_ATGIQ].[fpx_raw].[V_ANLF_EnergyTsPricesSys] s ON t.TimeseriesId = s.TimeseriesId

    END
END;