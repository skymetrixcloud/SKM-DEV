CREATE  PROCEDURE [fpx].[usp_load_forecast_reports]
AS
BEGIN
    SET NOCOUNT ON;

    /* =========================
       1) ForecastFlights -> Report_ForecastFlights
       ========================= */
    IF OBJECT_ID('[fpx].[Report_ForecastFlights]', 'U') IS NULL
    BEGIN
        SELECT
            [FlightDate],
            [Departure],
            [Destination],
            [AirlineDesignator],
            [FlightNumber],
            [Suffix],
            [AircraftType],
            [Leg],
            [LegAircraftType],
            [Frequency],
            [StatisticalUplift],
            [StatisticalConsumption],
            [TheoreticalConsumption],
            [PriceUplift],
            [PriceStatisticalConsumption],
            [PriceTheoreticalConsumption],
            [CostUplift],
            [CostStatisticalConsumption],
            [CostTheoreticalConsumption],
            [StandardConsumption],
            [CO2Emission],
            [Division],
            [CustomerICAOCode],
            [DomInt],
            [BlockHours]
        INTO [fpx].[Report_ForecastFlights]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_ForecastFlights];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Report_ForecastFlights];

        INSERT INTO [fpx].[Report_ForecastFlights] (
            [FlightDate],
            [Departure],
            [Destination],
            [AirlineDesignator],
            [FlightNumber],
            [Suffix],
            [AircraftType],
            [Leg],
            [LegAircraftType],
            [Frequency],
            [StatisticalUplift],
            [StatisticalConsumption],
            [TheoreticalConsumption],
            [PriceUplift],
            [PriceStatisticalConsumption],
            [PriceTheoreticalConsumption],
            [CostUplift],
            [CostStatisticalConsumption],
            [CostTheoreticalConsumption],
            [StandardConsumption],
            [CO2Emission],
            [Division],
            [CustomerICAOCode],
            [DomInt],
            [BlockHours]
        )
        SELECT
            [FlightDate],
            [Departure],
            [Destination],
            [AirlineDesignator],
            [FlightNumber],
            [Suffix],
            [AircraftType],
            [Leg],
            [LegAircraftType],
            [Frequency],
            [StatisticalUplift],
            [StatisticalConsumption],
            [TheoreticalConsumption],
            [PriceUplift],
            [PriceStatisticalConsumption],
            [PriceTheoreticalConsumption],
            [CostUplift],
            [CostStatisticalConsumption],
            [CostTheoreticalConsumption],
            [StandardConsumption],
            [CO2Emission],
            [Division],
            [CustomerICAOCode],
            [DomInt],
            [BlockHours]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_ForecastFlights];
    END

    /* =========================
       2) ForecastCashFlow -> Report_ForecastCashFlow
       ========================= */
    IF OBJECT_ID('[fpx].[Report_ForecastCashFlow]', 'U') IS NULL
    BEGIN
        SELECT
            [FlightDate],
            [Departure],
            [Destination],
            [AirlineDesignator],
            [FlightNumber],
            [Suffix],
            [AircraftType],
            [Leg],
            [LegAircraftType],
            [Frequency],
            [StatisticalUplift],
            [PriceUplift],
            [CostUplift],
            [ContractCode],
            [InvoiceFrequency],
            [PaymentTerms],
            [EstimatedPaymentDate],
            [CustomerICAOCode],
            [DomInt]
        INTO [fpx].[Report_ForecastCashFlow]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_ForecastCashFlow];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Report_ForecastCashFlow];

        INSERT INTO [fpx].[Report_ForecastCashFlow] (
            [FlightDate],
            [Departure],
            [Destination],
            [AirlineDesignator],
            [FlightNumber],
            [Suffix],
            [AircraftType],
            [Leg],
            [LegAircraftType],
            [Frequency],
            [StatisticalUplift],
            [PriceUplift],
            [CostUplift],
            [ContractCode],
            [InvoiceFrequency],
            [PaymentTerms],
            [EstimatedPaymentDate],
            [CustomerICAOCode],
            [DomInt]
        )
        SELECT
            [FlightDate],
            [Departure],
            [Destination],
            [AirlineDesignator],
            [FlightNumber],
            [Suffix],
            [AircraftType],
            [Leg],
            [LegAircraftType],
            [Frequency],
            [StatisticalUplift],
            [PriceUplift],
            [CostUplift],
            [ContractCode],
            [InvoiceFrequency],
            [PaymentTerms],
            [EstimatedPaymentDate],
            [CustomerICAOCode],
            [DomInt]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_ForecastCashFlow];
    END

    /* =========================
       3) ForecastCashFlow_VoP -> Report_ForecastCashFlow_VoP
       ========================= */
    IF OBJECT_ID('[fpx].[Report_ForecastCashFlow_VoP]', 'U') IS NULL
    BEGIN
        SELECT
            [Month],
            [SupplyChain],
            [SourceStorage],
            [FuelOwner],
            [Supplier],
            [PRContract],
            [TRContract],
            [Location],
            [Quantity],
            [Price],
            [Amount],
            [InvoiceFreq],
            [PaymentTerms],
            [EstimatedPaymentDate]
        INTO [fpx].[Report_ForecastCashFlow_VoP]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_ForecastCashFlow_VoP];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Report_ForecastCashFlow_VoP];

        INSERT INTO [fpx].[Report_ForecastCashFlow_VoP] (
            [Month],
            [SupplyChain],
            [SourceStorage],
            [FuelOwner],
            [Supplier],
            [PRContract],
            [TRContract],
            [Location],
            [Quantity],
            [Price],
            [Amount],
            [InvoiceFreq],
            [PaymentTerms],
            [EstimatedPaymentDate]
        )
        SELECT
            [Month],
            [SupplyChain],
            [SourceStorage],
            [FuelOwner],
            [Supplier],
            [PRContract],
            [TRContract],
            [Location],
            [Quantity],
            [Price],
            [Amount],
            [InvoiceFreq],
            [PaymentTerms],
            [EstimatedPaymentDate]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_ForecastCashFlow_VoP];
    END

    /* =========================
       4) ForecastVsActual -> Report_ForecastVsActual
       ========================= */
    IF OBJECT_ID('[fpx].[Report_ForecastVsActual]', 'U') IS NULL
    BEGIN
        SELECT
            [FlightDate],
            [Departure],
            [Destination],
            [AircraftType],
            [AirlineDesignator],
            [FlightNumber],
            [Suffix],
            [Leg],
            [LegAircraftType],
            [FrequencyPlanned],
            [FrequencyActual],
            [FrequencyVariance],
            [QuantityPlanned],
            [UpliftActual],
            [UpliftVariance],
            [BlockConsumptionActual],
            [BlockConsumptionVariance],
            [TotalConsumptionActual],
            [TotalConsumptionVariance],
            [CostPlanned],
            [UpliftCostActual],
            [UpliftCostVariance],
            [BlockConsumptionCostActual],
            [BlockConsumptionCostVariance],
            [TotalConsumptionCostActual],
            [TotalConsumptionCostVariance],
            [PricePlanned],
            [UpliftPriceActual],
            [UpliftPriceVariance],
            [BlockConsumptionPriceActual],
            [BlockConsumptionPriceVariance],
            [TotalConsumptionPriceActual],
            [TotalConsumptionPriceVariance],
            [CO2EmissionPlanned],
            [CO2EmissionActual],
            [CO2EmissionVariance],
            [BlockTimePlanned],
            [BlockTimeActual],
            [BlockTimevariance],
            [UpliftStatusActual],
            [BlockConsumptionStatusActual],
            [TotalConsumptionStatusActual],
            [Matched],
            [UpliftVariancePrc],
            [BlockConsumVariancePrc],
            [TotalConsumVariancePrc],
            [UpliftCostVariancePrc],
            [BlockConsumCostVariancePrc],
            [TotalConsumCostVariancePrc],
            [UpliftPriceVariancePrc],
            [BlockConsumPriceVariancePrc],
            [TotalConsumPriceVariancePrc],
            [UpliftVariancePrcOT],
            [BlockConsumVariancePrcOT],
            [TotalConsumVariancePrcOT],
            [UpliftCostVariancePrcOT],
            [BlockConsumCostVariancePrcOT],
            [TotalConsumCostVariancePrcOT],
            [UpliftPriceVariancePrcOT],
            [BlockConsumPriceVariancePrcOT],
            [TotalConsumPriceVariancePrcOT]
        INTO [fpx].[Report_ForecastVsActual]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_ForecastVsActual];
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Report_ForecastVsActual];

        INSERT INTO [fpx].[Report_ForecastVsActual] (
            [FlightDate],
            [Departure],
            [Destination],
            [AircraftType],
            [AirlineDesignator],
            [FlightNumber],
            [Suffix],
            [Leg],
            [LegAircraftType],
            [FrequencyPlanned],
            [FrequencyActual],
            [FrequencyVariance],
            [QuantityPlanned],
            [UpliftActual],
            [UpliftVariance],
            [BlockConsumptionActual],
            [BlockConsumptionVariance],
            [TotalConsumptionActual],
            [TotalConsumptionVariance],
            [CostPlanned],
            [UpliftCostActual],
            [UpliftCostVariance],
            [BlockConsumptionCostActual],
            [BlockConsumptionCostVariance],
            [TotalConsumptionCostActual],
            [TotalConsumptionCostVariance],
            [PricePlanned],
            [UpliftPriceActual],
            [UpliftPriceVariance],
            [BlockConsumptionPriceActual],
            [BlockConsumptionPriceVariance],
            [TotalConsumptionPriceActual],
            [TotalConsumptionPriceVariance],
            [CO2EmissionPlanned],
            [CO2EmissionActual],
            [CO2EmissionVariance],
            [BlockTimePlanned],
            [BlockTimeActual],
            [BlockTimevariance],
            [UpliftStatusActual],
            [BlockConsumptionStatusActual],
            [TotalConsumptionStatusActual],
            [Matched],
            [UpliftVariancePrc],
            [BlockConsumVariancePrc],
            [TotalConsumVariancePrc],
            [UpliftCostVariancePrc],
            [BlockConsumCostVariancePrc],
            [TotalConsumCostVariancePrc],
            [UpliftPriceVariancePrc],
            [BlockConsumPriceVariancePrc],
            [TotalConsumPriceVariancePrc],
            [UpliftVariancePrcOT],
            [BlockConsumVariancePrcOT],
            [TotalConsumVariancePrcOT],
            [UpliftCostVariancePrcOT],
            [BlockConsumCostVariancePrcOT],
            [TotalConsumCostVariancePrcOT],
            [UpliftPriceVariancePrcOT],
            [BlockConsumPriceVariancePrcOT],
            [TotalConsumPriceVariancePrcOT]
        )
        SELECT
            [FlightDate],
            [Departure],
            [Destination],
            [AircraftType],
            [AirlineDesignator],
            [FlightNumber],
            [Suffix],
            [Leg],
            [LegAircraftType],
            [FrequencyPlanned],
            [FrequencyActual],
            [FrequencyVariance],
            [QuantityPlanned],
            [UpliftActual],
            [UpliftVariance],
            [BlockConsumptionActual],
            [BlockConsumptionVariance],
            [TotalConsumptionActual],
            [TotalConsumptionVariance],
            [CostPlanned],
            [UpliftCostActual],
            [UpliftCostVariance],
            [BlockConsumptionCostActual],
            [BlockConsumptionCostVariance],
            [TotalConsumptionCostActual],
            [TotalConsumptionCostVariance],
            [PricePlanned],
            [UpliftPriceActual],
            [UpliftPriceVariance],
            [BlockConsumptionPriceActual],
            [BlockConsumptionPriceVariance],
            [TotalConsumptionPriceActual],
            [TotalConsumptionPriceVariance],
            [CO2EmissionPlanned],
            [CO2EmissionActual],
            [CO2EmissionVariance],
            [BlockTimePlanned],
            [BlockTimeActual],
            [BlockTimevariance],
            [UpliftStatusActual],
            [BlockConsumptionStatusActual],
            [TotalConsumptionStatusActual],
            [Matched],
            [UpliftVariancePrc],
            [BlockConsumVariancePrc],
            [TotalConsumVariancePrc],
            [UpliftCostVariancePrc],
            [BlockConsumCostVariancePrc],
            [TotalConsumCostVariancePrc],
            [UpliftPriceVariancePrc],
            [BlockConsumPriceVariancePrc],
            [TotalConsumPriceVariancePrc],
            [UpliftVariancePrcOT],
            [BlockConsumVariancePrcOT],
            [TotalConsumVariancePrcOT],
            [UpliftCostVariancePrcOT],
            [BlockConsumCostVariancePrcOT],
            [TotalConsumCostVariancePrcOT],
            [UpliftPriceVariancePrcOT],
            [BlockConsumPriceVariancePrcOT],
            [TotalConsumPriceVariancePrcOT]
        FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_ForecastVsActual];
    END
END