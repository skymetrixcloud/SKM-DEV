CREATE  PROCEDURE [fpx].[usp_actual_uplift]
AS
BEGIN
    SET NOCOUNT ON;

    IF OBJECT_ID('[fpx].[Report_Actual_Uplift]', 'U') IS NULL
    BEGIN
        SELECT
              PPB.[DeliveryDate]            AS [PPB_DeliveryDate]
            ,DATEFROMPARTS(YEAR(PPB.[DeliveryDate]), MONTH(PPB.[DeliveryDate]), 1) AS [PPB_DeliveryDate_Month]    
            , YEAR(PPB.[DeliveryDate])      AS [PPB_DeliveryYear]
            , PPB.[SUPPL_LOC_ID]            AS [PPB_SUPPL_LOC_ID]
            , PPB.[DLVY_LOC_ID]             AS [PPB_DLVY_LOC_ID]
            , PPB.[CUST_CO_ID]              AS [PPB_CUST_CO_ID]
            , PPB.[DeliveredVol]            AS [PPB_DeliveredVol]
            , PPB.[Events]                  AS [PPB_Events]
            , PPB.[PriceSource]             AS [PPB_PriceSource]
            , PPB.[PriceBasis]              AS [PPB_PriceBasis]
            , PPB.[Index]                   AS [PPB_Index]
            , PPB.[AverageMethod]           AS [PPB_AverageMethod]
            , PPB.[IndexPeriod]             AS [PPB_IndexPeriod]
            , PPB.[IsIPL]                   AS [PPB_IsIPL]

            , CAL.[Date]                    AS [CAL_Date]
            , CAL.[CRT_DT]                  AS [CAL_CRT_DT]
            , CAL.[DOW]                     AS [CAL_DOW]
            , CAL.[YR]                      AS [CAL_YR]
            , CAL.[QT]                      AS [CAL_QT]
            , CAL.[MTH]                     AS [CAL_MTH]
            , CAL.[Y2D]                     AS [CAL_Y2D]
            , CAL.[Q2D]                     AS [CAL_Q2D]
            , CAL.[M2D]                     AS [CAL_M2D]
            , CAL.[W2D]                     AS [CAL_W2D]
            , CAL.[ANY_Y2D]                 AS [CAL_ANY_Y2D]
            , CAL.[ANY_Q2D]                 AS [CAL_ANY_Q2D]
            , CAL.[SAME_Q2D]                AS [CAL_SAME_Q2D]
            , CAL.[ANY_M2D]                 AS [CAL_ANY_M2D]
            , CAL.[SAME_M2D]                AS [CAL_SAME_M2D]

            , CUS.[CO_ID]                   AS [CUS_CO_ID]
            , CUS.[CustomerCode]            AS [CUS_CustomerCode]
            , CUS.[CustomerICAOCode]        AS [CUS_CustomerICAOCode]
            , CUS.[CustomerName]            AS [CUS_CustomerName]
            , CUS.[CO_GRP_ID]               AS [CUS_CO_GRP_ID]
            , CUS.[GroupCode]               AS [CUS_GroupCode]
            , CUS.[GroupName]               AS [CUS_GroupName]
            , CUS.[CLIENT_ID]               AS [CUS_CLIENT_ID]
            , CUS.[ClientCode]              AS [CUS_ClientCode]
            , CUS.[ClientName]              AS [CUS_ClientName]

            , GEO.[LOC_ID]                  AS [GEO_LOC_ID]
            , GEO.[LocationCode]            AS [GEO_LocationCode]
            , GEO.[LocationName]            AS [GEO_LocationName]
            , GEO.[LocationIATACode]        AS [GEO_LocationIATACode]
            , GEO.[LocationICAOCode]        AS [GEO_LocationICAOCode]
            , GEO.[IsAirport]               AS [GEO_IsAirport]
            , GEO.[CNTRY_ID]                AS [GEO_CNTRY_ID]
            , GEO.[CountryName]             AS [GEO_CountryName]
            , GEO.[CountryISOCode]          AS [GEO_CountryISOCode]
            , GEO.[Continent]               AS [GEO_Continent]

            , CA.[LoginName]                AS [CA_LoginName]
            , CA.[CO_ID]                    AS [CA_CO_ID]
            , CA.[CustomerCode]             AS [CA_CustomerCode]
            , CA.[CustomerName]             AS [CA_CustomerName]
            , CA.[CustomerICAOCode]         AS [CA_CustomerICAOCode]

        INTO [fpx].[Report_Actual_Uplift]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_ProductPriceBasis] PPB
        LEFT OUTER JOIN [LH_ATGIQ].[fpx_raw].[V_ANLD_Calendar]       CAL ON CAL.[Date]     = PPB.[DeliveryDate]
        LEFT OUTER JOIN [LH_ATGIQ].[fpx_raw].[V_ANLD_Customer]       CUS ON CUS.[CO_ID]    = PPB.[CUST_CO_ID]
        LEFT OUTER JOIN [LH_ATGIQ].[fpx_raw].[V_ANLD_Geography]      GEO ON GEO.[LOC_ID]   = PPB.[DLVY_LOC_ID]
        LEFT OUTER JOIN [LH_ATGIQ].[fpx_raw].[V_ANLD_CustomerAccess] CA  ON CA.[CustomerICAOCode] = CUS.[CustomerICAOCode];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Report_Actual_Uplift];

        INSERT INTO [fpx].[Report_Actual_Uplift]
        SELECT
              PPB.[DeliveryDate]            AS [PPB_DeliveryDate]
            ,DATEFROMPARTS(YEAR(PPB.[DeliveryDate]), MONTH(PPB.[DeliveryDate]), 1) AS [PPB_DeliveryDate_Month] 
            , YEAR(PPB.[DeliveryDate])      AS [PPB_DeliveryYear]
            , PPB.[SUPPL_LOC_ID]            AS [PPB_SUPPL_LOC_ID]
            , PPB.[DLVY_LOC_ID]             AS [PPB_DLVY_LOC_ID]
            , PPB.[CUST_CO_ID]              AS [PPB_CUST_CO_ID]
            , PPB.[DeliveredVol]            AS [PPB_DeliveredVol]
            , PPB.[Events]                  AS [PPB_Events]
            , PPB.[PriceSource]             AS [PPB_PriceSource]
            , PPB.[PriceBasis]              AS [PPB_PriceBasis]
            , PPB.[Index]                   AS [PPB_Index]
            , PPB.[AverageMethod]           AS [PPB_AverageMethod]
            , PPB.[IndexPeriod]             AS [PPB_IndexPeriod]
            , PPB.[IsIPL]                   AS [PPB_IsIPL]

            , CAL.[Date]                    AS [CAL_Date]
            , CAL.[CRT_DT]                  AS [CAL_CRT_DT]
            , CAL.[DOW]                     AS [CAL_DOW]
            , CAL.[YR]                      AS [CAL_YR]
            , CAL.[QT]                      AS [CAL_QT]
            , CAL.[MTH]                     AS [CAL_MTH]
            , CAL.[Y2D]                     AS [CAL_Y2D]
            , CAL.[Q2D]                     AS [CAL_Q2D]
            , CAL.[M2D]                     AS [CAL_M2D]
            , CAL.[W2D]                     AS [CAL_W2D]
            , CAL.[ANY_Y2D]                 AS [CAL_ANY_Y2D]
            , CAL.[ANY_Q2D]                 AS [CAL_ANY_Q2D]
            , CAL.[SAME_Q2D]                AS [CAL_SAME_Q2D]
            , CAL.[ANY_M2D]                 AS [CAL_ANY_M2D]
            , CAL.[SAME_M2D]                AS [CAL_SAME_M2D]

            , CUS.[CO_ID]                   AS [CUS_CO_ID]
            , CUS.[CustomerCode]            AS [CUS_CustomerCode]
            , CUS.[CustomerICAOCode]        AS [CUS_CustomerICAOCode]
            , CUS.[CustomerName]            AS [CUS_CustomerName]
            , CUS.[CO_GRP_ID]               AS [CUS_CO_GRP_ID]
            , CUS.[GroupCode]               AS [CUS_GroupCode]
            , CUS.[GroupName]               AS [CUS_GroupName]
            , CUS.[CLIENT_ID]               AS [CUS_CLIENT_ID]
            , CUS.[ClientCode]              AS [CUS_ClientCode]
            , CUS.[ClientName]              AS [CUS_ClientName]

            , GEO.[LOC_ID]                  AS [GEO_LOC_ID]
            , GEO.[LocationCode]            AS [GEO_LocationCode]
            , GEO.[LocationName]            AS [GEO_LocationName]
            , GEO.[LocationIATACode]        AS [GEO_LocationIATACode]
            , GEO.[LocationICAOCode]        AS [GEO_LocationICAOCode]
            , GEO.[IsAirport]               AS [GEO_IsAirport]
            , GEO.[CNTRY_ID]                AS [GEO_CNTRY_ID]
            , GEO.[CountryName]             AS [GEO_CountryName]
            , GEO.[CountryISOCode]          AS [GEO_CountryISOCode]
            , GEO.[Continent]               AS [GEO_Continent]

            , CA.[LoginName]                AS [CA_LoginName]
            , CA.[CO_ID]                    AS [CA_CO_ID]
            , CA.[CustomerCode]             AS [CA_CustomerCode]
            , CA.[CustomerName]             AS [CA_CustomerName]
            , CA.[CustomerICAOCode]         AS [CA_CustomerICAOCode]

        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_ProductPriceBasis] PPB
        LEFT OUTER JOIN [LH_ATGIQ].[fpx_raw].[V_ANLD_Calendar]       CAL ON CAL.[Date]     = PPB.[DeliveryDate]
        LEFT OUTER JOIN [LH_ATGIQ].[fpx_raw].[V_ANLD_Customer]       CUS ON CUS.[CO_ID]    = PPB.[CUST_CO_ID]
        LEFT OUTER JOIN [LH_ATGIQ].[fpx_raw].[V_ANLD_Geography]      GEO ON GEO.[LOC_ID]   = PPB.[DLVY_LOC_ID]
        LEFT OUTER JOIN [LH_ATGIQ].[fpx_raw].[V_ANLD_CustomerAccess] CA  ON CA.[CustomerICAOCode] = CUS.[CustomerICAOCode];
    END
END