CREATE     PROCEDURE [fpx].[usp_Load_Fact_ForecastFlights]
AS
BEGIN
    SET NOCOUNT ON;

    -- ALTER the table the first time; otherwise truncate before reload
    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_CATALOG = 'WH_ATGIQ'
          AND TABLE_SCHEMA  = 'fpx'
          AND TABLE_NAME    = 'Fact_ForecastFlights'
    )
    BEGIN
        CREATE TABLE [fpx].[Fact_ForecastFlights]
        (
            [FlightDate]                   datetime2(6) NULL,
            [Departure]                    varchar(8000) NULL,
            [Destination]                  varchar(8000) NULL,
            [AirlineDesignator]            varchar(8000) NULL,
            [FlightNumber]                 varchar(8000) NULL,
            [Suffix]                       varchar(8000) NULL,
            [AircraftType]                 varchar(8000) NULL,
            [Leg]                          varchar(8000) NULL,
            [LegAircraftType]              varchar(8000) NULL,
            [Frequency]                    float NULL,
            [StatisticalUplift]            float NULL,
            [StatisticalConsumption]       float NULL,
            [TheoreticalConsumption]       float NULL,
            [PriceUplift]                  float NULL,
            [PriceStatisticalConsumption]  float NULL,
            [PriceTheoreticalConsumption]  float NULL,
            [CostUplift]                   float NULL,
            [CostStatisticalConsumption]   float NULL,
            [CostTheoreticalConsumption]   float NULL,
            [StandardConsumption]          float NULL,
            [CO2Emission]                  float NULL,
            [Division]                     varchar(8000) NULL,
            [CustomerICAOCode]             varchar(8000) NULL,
            [DomInt]                       varchar(8000) NULL,
            [BlockHours]                   float NULL
        );
    END
    ELSE
    BEGIN
        TRUNCATE TABLE [fpx].[Fact_ForecastFlights];
    END

    -------------------------------------------------------------------------
    -- Load step
    -- Replace the source object below with your actual view/table if needed:
    --   [LH_ATGIQ].[fpx_raw].[V_ANLF_ForecastFlights]
    -------------------------------------------------------------------------
    INSERT INTO [WH_ATGIQ].[fpx].[Fact_ForecastFlights]
    (
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