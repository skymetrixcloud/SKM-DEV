CREATE  PROCEDURE [fpx].[usp_Load_Fact_ActualFlights]
AS
BEGIN
    SET NOCOUNT ON;


    IF NOT EXISTS (
        SELECT 1
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'fpx'
          AND TABLE_NAME = 'Fact_ActualFlights'
          AND TABLE_CATALOG = 'WH_ATGIQ'
    )
    BEGIN
    
        CREATE TABLE [fpx].[Fact_ActualFlights]
        (
            [FlightID] decimal(10,0) NULL,
            [FlightDate] datetime2(6) NULL,
            [Registration] varchar(8000) NULL,
            [Departure] varchar(8000) NULL,
            [Destination] varchar(8000) NULL,
            [AirlineDesignator] varchar(8000) NULL,
            [FlightNumber] varchar(8000) NULL,
            [Suffix] varchar(8000) NULL,
            [AircraftID] decimal(5,0) NULL,
            [AircraftType] varchar(8000) NULL,
            [OpsAircraftType] varchar(8000) NULL,
            [Leg] varchar(8000) NULL,
            [LegAircraftType] varchar(8000) NULL,
            [SpecialEvent] varchar(8000) NULL,
            [DomInt] varchar(8000) NULL,
            [DepartureDate] datetime2(6) NULL,
            [OffBlockTimeUTC] datetime2(6) NULL,
            [TakeOffTimeUTC] datetime2(6) NULL,
            [TouchDownTimeUTC] datetime2(6) NULL,
            [OnBlockTimeUTC] datetime2(6) NULL,
            [BlockTime] float NULL,
            [FlightTime] float NULL,
            [Operator] varchar(8000) NULL,
            [Owner] varchar(8000) NULL,
            [Customer] varchar(8000) NULL,
            [UpliftVol] float NULL,
            [UpliftMass] float NULL,
            [UpliftDensity] decimal(10,4) NULL,
            [UpliftStatus] varchar(8000) NULL,
            [UpliftCost] decimal(15,2) NULL,
            [IPStatus] varchar(8000) NULL,
            [BeforeFuelingVol] float NULL,
            [BeforeFuelingMass] float NULL,
            [OffBlockFuelVol] float NULL,
            [OffBlockFuelMass] float NULL,
            [ShutDownFuelVol] float NULL,
            [ShutDownFuelMass] float NULL,
            [FuelDumpVol] float NULL,
            [FuelDumpMass] float NULL,
            [BlockConsumptionVol] float NULL,
            [BlockConsumptionMass] float NULL,
            [BlockConsumptionStatus] varchar(8000) NULL,
            [TotalConsumptionVol] float NULL,
            [TotalConsumptionMass] float NULL,
            [TotalConsumptionStatus] varchar(8000) NULL,
            [BlockConsumptionCost] decimal(15,2) NULL,
            [TotalConsumptionCost] decimal(15,2) NULL,
            [APUConsumptionVol] float NULL,
            [APUConsumptionMass] float NULL,
            [APUConsumptionCost] float NULL,
            [TankeredFuelVol] float NULL,
            [TankeredFuelMass] float NULL,
            [Division] varchar(8000) NULL,
            [FlightSeqNo] decimal(10,0) NULL,
            [FlightType] varchar(8000) NULL,
            [ServiceType] varchar(8000) NULL,
            [ReportedCustomer] varchar(8000) NULL,
            [FinalCustomer] varchar(8000) NULL,
            [LegDistance] decimal(12,3) NULL,
            [CharterContractNo] varchar(8000) NULL,
            [Terminal] varchar(8000) NULL,
            [GateNo] varchar(8000) NULL,
            [StandNo] varchar(8000) NULL,
            [AirportArea] varchar(8000) NULL
        );
    END
    ELSE
    BEGIN

        TRUNCATE TABLE [fpx].[Fact_ActualFlights];
    END

   
    INSERT INTO [WH_ATGIQ].[fpx].[Fact_ActualFlights] (
        [FlightID], [FlightDate], [Registration], [Departure], [Destination],
        [AirlineDesignator], [FlightNumber], [Suffix], [AircraftID], [AircraftType],
        [OpsAircraftType], [Leg], [LegAircraftType], [SpecialEvent], [DomInt],
        [DepartureDate], [OffBlockTimeUTC], [TakeOffTimeUTC], [TouchDownTimeUTC], [OnBlockTimeUTC],
        [BlockTime], [FlightTime], [Operator], [Owner], [Customer],
        [UpliftVol], [UpliftMass], [UpliftDensity], [UpliftStatus], [UpliftCost],
        [IPStatus], [BeforeFuelingVol], [BeforeFuelingMass], [OffBlockFuelVol], [OffBlockFuelMass],
        [ShutDownFuelVol], [ShutDownFuelMass], [FuelDumpVol], [FuelDumpMass], [BlockConsumptionVol],
        [BlockConsumptionMass], [BlockConsumptionStatus], [TotalConsumptionVol], [TotalConsumptionMass], [TotalConsumptionStatus],
        [BlockConsumptionCost], [TotalConsumptionCost], [APUConsumptionVol], [APUConsumptionMass], [APUConsumptionCost],
        [TankeredFuelVol], [TankeredFuelMass], [Division], [FlightSeqNo], [FlightType],
        [ServiceType], [ReportedCustomer], [FinalCustomer], [LegDistance], [CharterContractNo],
        [Terminal], [GateNo], [StandNo], [AirportArea]
    )
    SELECT 
        [FlightID], [FlightDate], [Registration], [Departure], [Destination],
        [AirlineDesignator], [FlightNumber], [Suffix], [AircraftID], [AircraftType],
        [OpsAircraftType], [Leg], [LegAircraftType], [SpecialEvent], [DomInt],
        [DepartureDate], [OffBlockTimeUTC], [TakeOffTimeUTC], [TouchDownTimeUTC], [OnBlockTimeUTC],
        [BlockTime], [FlightTime], [Operator], [Owner], [Customer],
        [UpliftVol], [UpliftMass], [UpliftDensity], [UpliftStatus], [UpliftCost],
        [IPStatus], [BeforeFuelingVol], [BeforeFuelingMass], [OffBlockFuelVol], [OffBlockFuelMass],
        [ShutDownFuelVol], [ShutDownFuelMass], [FuelDumpVol], [FuelDumpMass], [BlockConsumptionVol],
        [BlockConsumptionMass], [BlockConsumptionStatus], [TotalConsumptionVol], [TotalConsumptionMass], [TotalConsumptionStatus],
        [BlockConsumptionCost], [TotalConsumptionCost], [APUConsumptionVol], [APUConsumptionMass], [APUConsumptionCost],
        [TankeredFuelVol], [TankeredFuelMass], [Division], [FlightSeqNo], [FlightType],
        [ServiceType], [ReportedCustomer], [FinalCustomer], [LegDistance], [CharterContractNo],
        [Terminal], [GateNo], [StandNo], [AirportArea]
    FROM [LH_ATGIQ].[fpx_raw].[V_ANLF_ActualFlights];
END