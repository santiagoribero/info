IF NOT EXISTS ( SELECT 1 FROM [DAILY_QAECM191].[dbo].InstallShield WHERE ISSchema = '2017.1.1.06' )
BEGIN
	THROW 50001, 'The script cannot run in ECM versions prior to 2017.1.1.06', 1
END

IF NOT EXISTS ( SELECT 1 FROM [DAILY_QAECM191].[dbo].InstallShield WHERE ISSchema = '2017.2.1.06' )
BEGIN
	THROW 50001, 'The script cannot run in ECM versions prior to 2017.2.1.06. Run a compatible version of this script', 1
END




if not exists (select * from [DAILY_QAECM191].[dbo].sysobjects where name='ELVIZ14214TransactionsBkp' and xtype='U')
CREATE TABLE [DAILY_QAECM191].[dbo].[ELVIZ14214TransactionsBkp](
	[Id] [int] NOT NULL,
	[TradeDate] [datetime] NOT NULL,
	[TradeTime] [datetime] NOT NULL,
	[NotedTime] [datetime] NOT NULL,
	[UserId] [varchar](255) NOT NULL,
	[Amount] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[ReferringId] [int] NOT NULL,
	[TransTypeId] [int] NOT NULL,
	[InstrumentId] [int] NOT NULL,
	[PortfolioId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[ClearingTypeId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[AuthId] [int] NULL,
	[ExchangeId] [int] NOT NULL,
	[BFeeCurrencyId] [int] NULL,
	[CFeeCurrencyId] [int] NULL,
	[CurrencyId] [int] NULL,
	[CurrencyMargin] [float] NULL,
	[PriceBasisId] [int] NULL,
	[TicketNumber] [varchar](50) NULL,
	[Comment] [varchar](1000) NULL,
	[CurrencySourceId] [int] NOT NULL,
	[DeliveryTypeId] [int] NOT NULL,
	[TimeZoneOffset] [int] NOT NULL,
	[TU_Id] [int] NOT NULL,
	[TUP_Id] [int] NOT NULL,
	[PriceUnitId] [int] NOT NULL,
	[OrgVolumeUnitId] [int] NOT NULL,
	[OrgPriceUnitId] [int] NOT NULL,
	[T_BDA_Id] [int] NULL,
	[OrgAmount] [float] NULL,
	[OrgPrice] [float] NULL,
	[ExternalId] [varchar](255) NULL,
	[ExternalSourceName] [varchar](255) NULL,
	[ContractForm] [varchar](30) NULL,
	[ExchangeRate] [float] NULL,
	[ExchangedFrom] [int] NULL,
	[VT_ID] [smallint] NULL,
	[FromCountryId] [varchar](5) NULL,
	[DistrParentId] [int] NULL,
	[DistrAmount] [float] NULL,
	[Markup] [float] NULL,
	[ConfirmedByBroker] [bit] NOT NULL,
	[ConfirmedByCounterparty] [bit] NOT NULL,
	[Payout] [float] NULL,
	[LowerTrigger] [float] NULL,
	[UpperTrigger] [float] NULL,
	[ExpiryTime] [datetime] NULL,
	[MarketPriceMultiplicator] [float] NULL,
	[SettlementRuleId] [int] NULL,
	[InterconnectorId] [int] NULL,
	[Interruptible] [bit] NULL,
	[UserSpecifiedName] [varchar](255) NULL,
	[BalanceAreaId] [int] NULL,
	[TriggerCurrencyId] [int] NULL,
	[SchedulingAccountTypeId] [int] NULL,
	[SchedulingNominationProcedureId] [int] NULL,
	[ToCountryId] [varchar](5) NULL,
	[EnvironmentLabelId] [int] NULL,
	[ReplicationId] [uniqueidentifier] NOT NULL,
	[IndexedPriceBookTemplateId] [int] NULL,
	[SwapPriceTypeId] [int] NULL,
	[MasterAgreementId] [int] NULL,
	[CashSettlementPeriodContainerId] [int] NULL,
	[SamplingFrom] [datetime] NULL,
	[SamplingTo] [datetime] NULL,
	[RiskValue] [float] NULL,
	[GroupField1] [varchar](255) NOT NULL,
	[GroupField2] [varchar](255) NOT NULL,
	[GroupField3] [varchar](255) NOT NULL,
	[CustomCompanyId] [varchar](255) NOT NULL,
	[CustomCompanyName] [varchar](255) NOT NULL,
	[UnderlyingInstrumentID] [int] NULL,
	[UnderlyingDeliveryTypeId] [int] NULL,
	[TimeZoneId] [nvarchar](255) NULL,
	[UTI] [varchar](53) NULL,
	[TimeStampClearedUTC] [datetime] NULL,
	[TimeStampConfirmationBrokerUTC] [datetime] NULL,
	[TimeStampConfirmationCounterpartyUTC] [datetime] NULL,
	[DealCompression] [int] NULL,
	[TerminationDate] [date] NULL,
	[PricebasisToAreaId] [int] NULL,
	[EMIRStatus] [varchar](20) NULL,
	[FlexibleTimeSeries] [bit] NOT NULL,
	[ContractType] [varchar](20) NULL,
	[CapacityId] [varchar](50) NULL,
	[ModelTypeId] [int] NULL,
	[LocationId] [int] NULL,
	[InitiatorAggressorId] [int] NULL,
	[RemitReporting] [bit] NOT NULL,
	[CertificateLimitFactor] [float] NULL,
	[CtCparty] [bit] NULL,
	[Originator] [bit] NULL,
	[AuthConfirmed] [bit] NULL,
	[OTCBroker] [int] NULL,
	[TradeCompanyId] [int] NULL,
	[DeclareId] [int] NULL,
	[LoadProfileId] [int] NULL,
	[GridPointId] [int] NULL,
	[TraderId] [int] NULL,
	[MinVol] [float] NULL,
	[MaxVol] [float] NULL,
	[FixPrice] [float] NULL,
	[Threshold] [float] NULL,
	[Paid] [bit] NULL,
	[DeclaredVolume] [float] NULL,
	[ContractSplitId] [int] NULL,
	[InitialPrice] [float] NULL,
	[CapacityBidVolume] [float] NULL,
	[CapacityBidPrice] [float] NULL,
	[LastUpdatedUTC] [datetime2](7) NOT NULL,
	[CapacityTradeVolume] [float] NULL,
	[AuctionTypeId] [int] NULL,
	[HistoricContractPriceSeriesId] [int] NULL,
	[HistoricMarketPriceSeriesId] [int] NULL,
	[CounterpartyTrader] [varchar](100) NULL,
	[ReferencePriceSeriesId] [int] NULL,
	[DestinationReferencePriceSeriesId] [int] NULL
	[ProcessedAt] [datetime] NOT NULL
) ON [PRIMARY]


if not exists (select * from [DAILY_QAECM191].[dbo].sysobjects where name='ELVIZ14214InstrumentsBkp' and xtype='U')
CREATE TABLE [DAILY_QAECM191].[dbo].[ELVIZ14214InstrumentsBkp](
	[InstrumentId] [int] NOT NULL,
	[InstrumentName] [varchar](50) NULL,
	[InstrumentShortName] [varchar](15) NULL,
	[InstrumentTypeId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[ExecutionVenueId] [int] NULL,
	[CommodityId] [int] NULL,
	[ExpiryOffset] [int] NULL,
	[StripPeriodResolution] [varchar](1) NULL,
	[BarrierOptionTypeId] [int] NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[Strike] [float] NULL,
	[SamplingPeriodId] [int] NULL,
	[PutCall] [bit] NULL,
	[Hours] [int] NULL,
	[BaseCurrencyId] [int] NULL,
	[CrossCurrencyId] [int] NULL,
	[BookPriceTypeId] [int] NULL,
	[CapFloorPricingPeriodTypeId] [int] NULL,
	[FutureTypeId] [int] NULL,
	[DeliveryTypeId] [int] NULL,
	[ExpiryTime] [datetime] NULL,
	[LoadProfileId] [int] NULL,
	[PriceBasisId] [int] NULL,
	[SamplingFrom] [datetime] NULL,
	[SamplingTo] [datetime] NULL,
	[SwapPriceTypeId] [int] NULL,
	[TimeZoneId] [nvarchar](255) NULL,
	[UnderlyingInstrumentId] [int] NULL,
	[CurrencyId] [int] NULL,
	[CurrencySourceId] [int] NULL,
	[TU_Id] [int] NULL,
	[PriceUnitId] [int] NULL,
	[Payout] [float] NULL,
	[LowerTrigger] [float] NULL,
	[UpperTrigger] [float] NULL,
	[TriggerCurrencyId] [int] NULL,
	[MarketPriceFactor] [float] NULL,
	[SettlementRuleId] [int] NULL,
	[InterconnectorId] [int] NULL,
	[Interruptible] [bit] NULL,
	[UserSpecifiedName] [varchar](255) NULL,
	[EnvironmentLabelId] [int] NULL,
	[IndexedPriceBookTemplateId] [int] NULL,
	[PriceBasisToAreaId] [int] NULL,
	[ModelTypeId] [int] NULL,
	[MinVol] [float] NULL,
	[MaxVol] [float] NULL,
	[FixPrice] [float] NULL,
	[Threshold] [float] NULL,
	[HistoricContractPriceSeriesId] [int] NULL,
	[HistoricMarketPriceSeriesId] [int] NULL,
	[ReferencePriceSeriesId] [int] NULL,
	[DestinationReferencePriceSeriesId] [int] NULL,
	[PublishingPeriodTypeId] [int] NULL,
	[ProductionFacilityId] [int] NULL,
	[CertificateTypeId] [int] NULL,
	[DateOfTransfer] [datetime] NULL,
	[ProcessedAt] [datetime] NOT NULL
) ON [PRIMARY]


SET XACT_ABORT ON
BEGIN TRY

		DECLARE @duplicates as Table (
		InstrumentId INT not null primary key,
		FirstInstrumentId INT not null
		)

		BEGIN TRAN

		;WITH FirstInstance ([InstrumentId], [InstrumentName], [InstrumentShortName], [InstrumentTypeId], [StatusId], [ExecutionVenueId], [CommodityId], [ExpiryOffset], [StripPeriodResolution], [BarrierOptionTypeId], [FromDate], [ToDate], [ExpiryDate], [Strike], [SamplingPeriodId], [PutCall], [Hours], [BaseCurrencyId], [CrossCurrencyId], [BookPriceTypeId], [CapFloorPricingPeriodTypeId], [FutureTypeId], [DeliveryTypeId], [ExpiryTime], [LoadProfileId], [PriceBasisId], [SamplingFrom], [SamplingTo], [SwapPriceTypeId], [TimeZoneId], [UnderlyingInstrumentId], [CurrencyId], [CurrencySourceId], [TU_Id], [PriceUnitId], [Payout], [LowerTrigger], [UpperTrigger], [TriggerCurrencyId], [MarketPriceFactor], [SettlementRuleId], [InterconnectorId], [Interruptible], [UserSpecifiedName], [EnvironmentLabelId], [IndexedPriceBookTemplateId], [PriceBasisToAreaId], [ModelTypeId], [MinVol], [MaxVol], [FixPrice], [Threshold], [HistoricContractPriceSeriesId], [HistoricMarketPriceSeriesId], [ReferencePriceSeriesId], [DestinationReferencePriceSeriesId], [PublishingPeriodTypeId], ProductionFacilityId, CertificateTypeId, DateOfTransfer)
		AS
		(
			SELECT MIN(i.InstrumentId) [InstrumentId], i.[InstrumentName], i.[InstrumentShortName], i.[InstrumentTypeId], i.[StatusId], i.[ExecutionVenueId], i.[CommodityId], COALESCE(i.[ExpiryOffset], 0), i.[StripPeriodResolution], i.[BarrierOptionTypeId], i.[FromDate], i.[ToDate], i.[ExpiryDate], i.[Strike], i.[SamplingPeriodId], i.[PutCall], i.[Hours], i.[BaseCurrencyId], i.[CrossCurrencyId], i.[BookPriceTypeId], i.[CapFloorPricingPeriodTypeId], i.[FutureTypeId], i.[DeliveryTypeId], i.[ExpiryTime], i.[LoadProfileId], i.[PriceBasisId], i.[SamplingFrom], i.[SamplingTo], i.[SwapPriceTypeId], i.[TimeZoneId], i.[UnderlyingInstrumentId], i.[CurrencyId], i.[CurrencySourceId], i.[TU_Id], i.[PriceUnitId], i.[Payout], i.[LowerTrigger], i.[UpperTrigger], i.[TriggerCurrencyId], i.[MarketPriceFactor], i.[SettlementRuleId], i.[InterconnectorId], i.[Interruptible], i.[UserSpecifiedName], i.[EnvironmentLabelId], i.[IndexedPriceBookTemplateId], i.[PriceBasisToAreaId], i.[ModelTypeId], i.[MinVol], i.[MaxVol], i.[FixPrice], i.[Threshold], i.[HistoricContractPriceSeriesId], i.[HistoricMarketPriceSeriesId], i.[ReferencePriceSeriesId], i.[DestinationReferencePriceSeriesId], i.[PublishingPeriodTypeId], ProductionFacilityId, CertificateTypeId, DateOfTransfer
			FROM [DAILY_QAECM191].[dbo].Instruments i
			LEFT JOIN [DAILY_QAECM191].[dbo].InstrumentCertificates ic
			ON i.InstrumentId = ic.InstrumentId
			WHERE i.UnderlyingInstrumentId IS NULL --I'll only unify instruments that don't have an underlying instrument
			AND i.InstrumentId NOT IN ( SELECT InstrumentId FROM [DAILY_QAECM191].[dbo].Authorisations ) --I'll only unify instruments without Authorisations
			AND i.InstrumentId NOT IN ( SELECT RefId FROM [DAILY_QAECM191].[dbo].Instrument_PropertyBools ) --I'll only unify instruments without PropertyBools
			AND i.InstrumentId NOT IN ( SELECT RefId FROM [DAILY_QAECM191].[dbo].Instrument_PropertyDates ) --I'll only unify instruments without PropertyDates
			AND i.InstrumentId NOT IN ( SELECT RefId FROM [DAILY_QAECM191].[dbo].Instrument_PropertyFloats ) --I'll only unify instruments without PropertyFloats
			AND i.InstrumentId NOT IN ( SELECT RefId FROM [DAILY_QAECM191].[dbo].Instrument_PropertyIntegers ) --I'll only unify instruments without PropertyIntegers
			AND i.InstrumentId NOT IN ( SELECT RefId FROM [DAILY_QAECM191].[dbo].Instrument_PropertyStrings ) --I'll only unify instruments without PropertyStrings
			GROUP BY i.[InstrumentName], i.[InstrumentShortName], i.[InstrumentTypeId], i.[StatusId], i.[ExecutionVenueId], i.[CommodityId], COALESCE(i.[ExpiryOffset], 0), i.[StripPeriodResolution], i.[BarrierOptionTypeId], i.[FromDate], i.[ToDate], i.[ExpiryDate], i.[Strike], i.[SamplingPeriodId], i.[PutCall], i.[Hours], i.[BaseCurrencyId], i.[CrossCurrencyId], i.[BookPriceTypeId], i.[CapFloorPricingPeriodTypeId], i.[FutureTypeId], i.[DeliveryTypeId], i.[ExpiryTime], i.[LoadProfileId], i.[PriceBasisId], i.[SamplingFrom], i.[SamplingTo], i.[SwapPriceTypeId], i.[TimeZoneId], i.[UnderlyingInstrumentId], i.[CurrencyId], i.[CurrencySourceId], i.[TU_Id], i.[PriceUnitId], i.[Payout], i.[LowerTrigger], i.[UpperTrigger], i.[TriggerCurrencyId], i.[MarketPriceFactor], i.[SettlementRuleId], i.[InterconnectorId], i.[Interruptible], i.[UserSpecifiedName], i.[EnvironmentLabelId], i.[IndexedPriceBookTemplateId], i.[PriceBasisToAreaId], i.[ModelTypeId], i.[MinVol], i.[MaxVol], i.[FixPrice], i.[Threshold], i.[HistoricContractPriceSeriesId], i.[HistoricMarketPriceSeriesId], i.[ReferencePriceSeriesId], i.[DestinationReferencePriceSeriesId], i.[PublishingPeriodTypeId], ProductionFacilityId, CertificateTypeId, DateOfTransfer
			HAVING Count(1) > 1
		)
		insert into @duplicates (InstrumentId, FirstInstrumentId)
		SELECT i.InstrumentId, fi.InstrumentId
		FROM [DAILY_QAECM191].[dbo].Instruments i
		LEFT JOIN [DAILY_QAECM191].[dbo].InstrumentCertificates ic
		ON i.InstrumentId = ic.InstrumentId
		JOIN FirstInstance fi
		ON (
			(i.[InstrumentName] = fi.[InstrumentName] OR (I.[InstrumentName] IS NULL AND fi.[InstrumentName] IS NULL))
			AND (i.[InstrumentShortName] = fi.[InstrumentShortName] OR (I.[InstrumentShortName] IS NULL AND fi.[InstrumentShortName] IS NULL))
			AND (i.[InstrumentTypeId] = fi.[InstrumentTypeId])
			AND (i.[StatusId] = fi.[StatusId])
			AND (i.[ExecutionVenueId] = fi.[ExecutionVenueId] OR (I.[ExecutionVenueId] IS NULL AND fi.[ExecutionVenueId] IS NULL))
			AND (i.[CommodityId] = fi.[CommodityId] OR (I.[CommodityId] IS NULL AND fi.[CommodityId] IS NULL))
			AND (COALESCE(i.[ExpiryOffset], 0) = COALESCE(fi.[ExpiryOffset], 0))
			AND (i.[StripPeriodResolution] = fi.[StripPeriodResolution] OR (I.[StripPeriodResolution] IS NULL AND fi.[StripPeriodResolution] IS NULL))
			AND (i.[BarrierOptionTypeId] = fi.[BarrierOptionTypeId] OR (I.[BarrierOptionTypeId] IS NULL AND fi.[BarrierOptionTypeId] IS NULL))
			AND (i.[FromDate] = fi.[FromDate] OR (I.[FromDate] IS NULL AND fi.[FromDate] IS NULL))
			AND (i.[ToDate] = fi.[ToDate] OR (I.[ToDate] IS NULL AND fi.[ToDate] IS NULL))
			AND (i.[ExpiryDate] = fi.[ExpiryDate] OR (I.[ExpiryDate] IS NULL AND fi.[ExpiryDate] IS NULL))
			AND (i.[Strike] = fi.[Strike] OR (I.[Strike] IS NULL AND fi.[Strike] IS NULL))
			AND (i.[SamplingPeriodId] = fi.[SamplingPeriodId] OR (I.[SamplingPeriodId] IS NULL AND fi.[SamplingPeriodId] IS NULL))
			AND (i.[PutCall] = fi.[PutCall] OR (I.[PutCall] IS NULL AND fi.[PutCall] IS NULL))
			AND (i.[Hours] = fi.[Hours] OR (I.[Hours] IS NULL AND fi.[Hours] IS NULL))
			AND (i.[BaseCurrencyId] = fi.[BaseCurrencyId] OR (I.[BaseCurrencyId] IS NULL AND fi.[BaseCurrencyId] IS NULL))
			AND (i.[CrossCurrencyId] = fi.[CrossCurrencyId] OR (I.[CrossCurrencyId] IS NULL AND fi.[CrossCurrencyId] IS NULL))
			AND (i.[BookPriceTypeId] = fi.[BookPriceTypeId] OR (I.[BookPriceTypeId] IS NULL AND fi.[BookPriceTypeId] IS NULL))
			AND (i.[CapFloorPricingPeriodTypeId] = fi.[CapFloorPricingPeriodTypeId] OR (I.[CapFloorPricingPeriodTypeId] IS NULL AND fi.[CapFloorPricingPeriodTypeId] IS NULL))
			AND (i.[FutureTypeId] = fi.[FutureTypeId] OR (I.[FutureTypeId] IS NULL AND fi.[FutureTypeId] IS NULL))
			AND (i.[DeliveryTypeId] = fi.[DeliveryTypeId] OR (I.[DeliveryTypeId] IS NULL AND fi.[DeliveryTypeId] IS NULL))
			AND (i.[ExpiryTime] = fi.[ExpiryTime] OR (I.[ExpiryTime] IS NULL AND fi.[ExpiryTime] IS NULL))
			AND (i.[LoadProfileId] = fi.[LoadProfileId] OR (I.[LoadProfileId] IS NULL AND fi.[LoadProfileId] IS NULL))
			AND (i.[PriceBasisId] = fi.[PriceBasisId] OR (I.[PriceBasisId] IS NULL AND fi.[PriceBasisId] IS NULL))
			AND (i.[SamplingFrom] = fi.[SamplingFrom] OR (I.[SamplingFrom] IS NULL AND fi.[SamplingFrom] IS NULL))
			AND (i.[SamplingTo] = fi.[SamplingTo] OR (I.[SamplingTo] IS NULL AND fi.[SamplingTo] IS NULL))
			AND (i.[SwapPriceTypeId] = fi.[SwapPriceTypeId] OR (I.[SwapPriceTypeId] IS NULL AND fi.[SwapPriceTypeId] IS NULL))
			AND (i.[TimeZoneId] = fi.[TimeZoneId] OR (I.[TimeZoneId] IS NULL AND fi.[TimeZoneId] IS NULL))
			AND (i.[UnderlyingInstrumentId] = fi.[UnderlyingInstrumentId] OR (I.[UnderlyingInstrumentId] IS NULL AND fi.[UnderlyingInstrumentId] IS NULL))
			AND (i.[CurrencyId] = fi.[CurrencyId] OR (I.[CurrencyId] IS NULL AND fi.[CurrencyId] IS NULL))
			AND (i.[CurrencySourceId] = fi.[CurrencySourceId] OR (I.[CurrencySourceId] IS NULL AND fi.[CurrencySourceId] IS NULL))
			AND (i.[TU_Id] = fi.[TU_Id] OR (I.[TU_Id] IS NULL AND fi.[TU_Id] IS NULL))
			AND (i.[PriceUnitId] = fi.[PriceUnitId] OR (I.[PriceUnitId] IS NULL AND fi.[PriceUnitId] IS NULL))
			AND (i.[Payout] = fi.[Payout] OR (I.[Payout] IS NULL AND fi.[Payout] IS NULL))
			AND (i.[LowerTrigger] = fi.[LowerTrigger] OR (I.[LowerTrigger] IS NULL AND fi.[LowerTrigger] IS NULL))
			AND (i.[UpperTrigger] = fi.[UpperTrigger] OR (I.[UpperTrigger] IS NULL AND fi.[UpperTrigger] IS NULL))
			AND (i.[TriggerCurrencyId] = fi.[TriggerCurrencyId] OR (I.[TriggerCurrencyId] IS NULL AND fi.[TriggerCurrencyId] IS NULL))
			AND (i.[MarketPriceFactor] = fi.[MarketPriceFactor] OR (I.[MarketPriceFactor] IS NULL AND fi.[MarketPriceFactor] IS NULL))
			AND (i.[SettlementRuleId] = fi.[SettlementRuleId] OR (I.[SettlementRuleId] IS NULL AND fi.[SettlementRuleId] IS NULL))
			AND (i.[InterconnectorId] = fi.[InterconnectorId] OR (I.[InterconnectorId] IS NULL AND fi.[InterconnectorId] IS NULL))
			AND (i.[Interruptible] = fi.[Interruptible] OR (I.[Interruptible] IS NULL AND fi.[Interruptible] IS NULL))
			AND (i.[UserSpecifiedName] = fi.[UserSpecifiedName] OR (I.[UserSpecifiedName] IS NULL AND fi.[UserSpecifiedName] IS NULL))
			AND (i.[EnvironmentLabelId] = fi.[EnvironmentLabelId] OR (I.[EnvironmentLabelId] IS NULL AND fi.[EnvironmentLabelId] IS NULL))
			AND (i.[IndexedPriceBookTemplateId] = fi.[IndexedPriceBookTemplateId] OR (I.[IndexedPriceBookTemplateId] IS NULL AND fi.[IndexedPriceBookTemplateId] IS NULL))
			AND (i.[PriceBasisToAreaId] = fi.[PriceBasisToAreaId] OR (I.[PriceBasisToAreaId] IS NULL AND fi.[PriceBasisToAreaId] IS NULL))
			AND (i.[ModelTypeId] = fi.[ModelTypeId] OR (I.[ModelTypeId] IS NULL AND fi.[ModelTypeId] IS NULL))
			AND (i.[MinVol] = fi.[MinVol] OR (I.[MinVol] IS NULL AND fi.[MinVol] IS NULL))
			AND (i.[MaxVol] = fi.[MaxVol] OR (I.[MaxVol] IS NULL AND fi.[MaxVol] IS NULL))
			AND (i.[FixPrice] = fi.[FixPrice] OR (I.[FixPrice] IS NULL AND fi.[FixPrice] IS NULL))
			AND (i.[Threshold] = fi.[Threshold] OR (I.[Threshold] IS NULL AND fi.[Threshold] IS NULL))
			AND (i.[HistoricContractPriceSeriesId] = fi.[HistoricContractPriceSeriesId] OR (I.[HistoricContractPriceSeriesId] IS NULL AND fi.[HistoricContractPriceSeriesId] IS NULL))
			AND (i.[HistoricMarketPriceSeriesId] = fi.[HistoricMarketPriceSeriesId] OR (I.[HistoricMarketPriceSeriesId] IS NULL AND fi.[HistoricMarketPriceSeriesId] IS NULL))
			AND (i.[ReferencePriceSeriesId] = fi.[ReferencePriceSeriesId] OR (I.[ReferencePriceSeriesId] IS NULL AND fi.[ReferencePriceSeriesId] IS NULL))
			AND (i.[DestinationReferencePriceSeriesId] = fi.[DestinationReferencePriceSeriesId] OR (I.[DestinationReferencePriceSeriesId] IS NULL AND fi.[DestinationReferencePriceSeriesId] IS NULL))
			AND (i.[PublishingPeriodTypeId] = fi.[PublishingPeriodTypeId] OR (I.[PublishingPeriodTypeId] IS NULL AND fi.[PublishingPeriodTypeId] IS NULL))
			AND fi.InstrumentId <> i.InstrumentId
		)
		WHERE i.UnderlyingInstrumentId IS NULL --I'll only unify instruments that don't have an underlying instrument
		AND i.InstrumentId NOT IN ( SELECT InstrumentId FROM [DAILY_QAECM191].[dbo].Authorisations ) --I'll only unify instruments without Authorisations
		AND i.InstrumentId NOT IN ( SELECT RefId FROM [DAILY_QAECM191].[dbo].Instrument_PropertyBools ) --I'll only unify instruments without PropertyBools
		AND i.InstrumentId NOT IN ( SELECT RefId FROM [DAILY_QAECM191].[dbo].Instrument_PropertyDates ) --I'll only unify instruments without PropertyDates
		AND i.InstrumentId NOT IN ( SELECT RefId FROM [DAILY_QAECM191].[dbo].Instrument_PropertyFloats ) --I'll only unify instruments without PropertyFloats
		AND i.InstrumentId NOT IN ( SELECT RefId FROM [DAILY_QAECM191].[dbo].Instrument_PropertyIntegers ) --I'll only unify instruments without PropertyIntegers
		AND i.InstrumentId NOT IN ( SELECT RefId FROM [DAILY_QAECM191].[dbo].Instrument_PropertyStrings ) --I'll only unify instruments without PropertyStrings


		INSERT INTO [DAILY_QAECM191].[dbo].ELVIZ14214TransactionsBkp ([Id], [TradeDate], [TradeTime], [NotedTime], [UserId], [Amount], [Price], [ReferringId], [TransTypeId], [InstrumentId], [PortfolioId], [StatusId], [ClearingTypeId], [OrderId], [AuthId], [ExchangeId], [BFeeCurrencyId], [CFeeCurrencyId], [CurrencyId], [CurrencyMargin], [PriceBasisId], [TicketNumber], [Comment], [CurrencySourceId], [DeliveryTypeId], [TimeZoneOffset], [TU_Id], [TUP_Id], [PriceUnitId], [OrgVolumeUnitId], [OrgPriceUnitId], [T_BDA_Id], [OrgAmount], [OrgPrice], [ExternalId], [ExternalSourceName], [ContractForm], [ExchangeRate], [ExchangedFrom], [VT_ID], [FromCountryId], [DistrParentId], [DistrAmount], [Markup], [ConfirmedByBroker], [ConfirmedByCounterparty], [Payout], [LowerTrigger], [UpperTrigger], [ExpiryTime], [MarketPriceMultiplicator], [SettlementRuleId], [InterconnectorId], [Interruptible], [UserSpecifiedName], [BalanceAreaId], [TriggerCurrencyId], [SchedulingAccountTypeId], [SchedulingNominationProcedureId], [ToCountryId], [EnvironmentLabelId], [ReplicationId], [IndexedPriceBookTemplateId], [SwapPriceTypeId], [MasterAgreementId], [CashSettlementPeriodContainerId], [SamplingFrom], [SamplingTo], [RiskValue], [GroupField1], [GroupField2], [GroupField3], [CustomCompanyId], [CustomCompanyName], [UnderlyingInstrumentID], [UnderlyingDeliveryTypeId], [TimeZoneId], [UTI], [TimeStampClearedUTC], [TimeStampConfirmationBrokerUTC], [TimeStampConfirmationCounterpartyUTC], [DealCompression], [TerminationDate], [PricebasisToAreaId], [EMIRStatus], [FlexibleTimeSeries], [ContractType], [CapacityId], [ModelTypeId], [LocationId], [InitiatorAggressorId], [RemitReporting], [CertificateLimitFactor], [CtCparty], [Originator], [AuthConfirmed], [OTCBroker], [TradeCompanyId], [DeclareId], [LoadProfileId], [GridPointId], [TraderId], [MinVol], [MaxVol], [FixPrice], [Threshold], [Paid], [DeclaredVolume], [ContractSplitId], [InitialPrice], [CapacityBidVolume], [CapacityBidPrice], [LastUpdatedUTC], [CapacityTradeVolume], [AuctionTypeId], [HistoricContractPriceSeriesId], [HistoricMarketPriceSeriesId], [CounterpartyTrader], [ReferencePriceSeriesId], [DestinationReferencePriceSeriesId], [ProcessedAt])
		SELECT [Id], [TradeDate], [TradeTime], [NotedTime], [UserId], [Amount], [Price], [ReferringId], [TransTypeId], [InstrumentId], [PortfolioId], [StatusId], [ClearingTypeId], [OrderId], [AuthId], [ExchangeId], [BFeeCurrencyId], [CFeeCurrencyId], [CurrencyId], [CurrencyMargin], [PriceBasisId], [TicketNumber], [Comment], [CurrencySourceId], [DeliveryTypeId], [TimeZoneOffset], [TU_Id], [TUP_Id], [PriceUnitId], [OrgVolumeUnitId], [OrgPriceUnitId], [T_BDA_Id], [OrgAmount], [OrgPrice], [ExternalId], [ExternalSourceName], [ContractForm], [ExchangeRate], [ExchangedFrom], [VT_ID], [FromCountryId], [DistrParentId], [DistrAmount], [Markup], [ConfirmedByBroker], [ConfirmedByCounterparty], [Payout], [LowerTrigger], [UpperTrigger], [ExpiryTime], [MarketPriceMultiplicator], [SettlementRuleId], [InterconnectorId], [Interruptible], [UserSpecifiedName], [BalanceAreaId], [TriggerCurrencyId], [SchedulingAccountTypeId], [SchedulingNominationProcedureId], [ToCountryId], [EnvironmentLabelId], [ReplicationId], [IndexedPriceBookTemplateId], [SwapPriceTypeId], [MasterAgreementId], [CashSettlementPeriodContainerId], [SamplingFrom], [SamplingTo], [RiskValue], [GroupField1], [GroupField2], [GroupField3], [CustomCompanyId], [CustomCompanyName], [UnderlyingInstrumentID], [UnderlyingDeliveryTypeId], [TimeZoneId], [UTI], [TimeStampClearedUTC], [TimeStampConfirmationBrokerUTC], [TimeStampConfirmationCounterpartyUTC], [DealCompression], [TerminationDate], [PricebasisToAreaId], [EMIRStatus], [FlexibleTimeSeries], [ContractType], [CapacityId], [ModelTypeId], [LocationId], [InitiatorAggressorId], [RemitReporting], [CertificateLimitFactor], [CtCparty], [Originator], [AuthConfirmed], [OTCBroker], [TradeCompanyId], [DeclareId], [LoadProfileId], [GridPointId], [TraderId], [MinVol], [MaxVol], [FixPrice], [Threshold], [Paid], [DeclaredVolume], [ContractSplitId], [InitialPrice], [CapacityBidVolume], [CapacityBidPrice], [LastUpdatedUTC], [CapacityTradeVolume], [AuctionTypeId], [HistoricContractPriceSeriesId], [HistoricMarketPriceSeriesId], [CounterpartyTrader], [ReferencePriceSeriesId], [DestinationReferencePriceSeriesId], GetUTCDate()
		FROM [DAILY_QAECM191].[dbo].Transactions
		WHERE InstrumentId IN (
			SELECT InstrumentId from @duplicates
		)
		OR UnderlyingInstrumentID IN (
			SELECT InstrumentId from @duplicates
		)

		INSERT INTO [DAILY_QAECM191].[dbo].ELVIZ14214InstrumentsBkp ([InstrumentId], [InstrumentName], [InstrumentShortName], [InstrumentTypeId], [StatusId], [ExecutionVenueId], [CommodityId], [ExpiryOffset], [StripPeriodResolution], [BarrierOptionTypeId], [FromDate], [ToDate], [ExpiryDate], [Strike], [SamplingPeriodId], [PutCall], [Hours], [BaseCurrencyId], [CrossCurrencyId], [BookPriceTypeId], [CapFloorPricingPeriodTypeId], [FutureTypeId], [DeliveryTypeId], [ExpiryTime], [LoadProfileId], [PriceBasisId], [SamplingFrom], [SamplingTo], [SwapPriceTypeId], [TimeZoneId], [UnderlyingInstrumentId], [CurrencyId], [CurrencySourceId], [TU_Id], [PriceUnitId], [Payout], [LowerTrigger], [UpperTrigger], [TriggerCurrencyId], [MarketPriceFactor], [SettlementRuleId], [InterconnectorId], [Interruptible], [UserSpecifiedName], [EnvironmentLabelId], [IndexedPriceBookTemplateId], [PriceBasisToAreaId], [ModelTypeId], [MinVol], [MaxVol], [FixPrice], [Threshold], [HistoricContractPriceSeriesId], [HistoricMarketPriceSeriesId], [ReferencePriceSeriesId], [DestinationReferencePriceSeriesId], [PublishingPeriodTypeId], [ProductionFacilityId], [CertificateTypeId], [DateOfTransfer], [ProcessedAt])
		SELECT i.[InstrumentId], [InstrumentName], [InstrumentShortName], [InstrumentTypeId], [StatusId], [ExecutionVenueId], [CommodityId], [ExpiryOffset], [StripPeriodResolution], [BarrierOptionTypeId], [FromDate], [ToDate], [ExpiryDate], [Strike], [SamplingPeriodId], [PutCall], [Hours], [BaseCurrencyId], [CrossCurrencyId], [BookPriceTypeId], [CapFloorPricingPeriodTypeId], [FutureTypeId], [DeliveryTypeId], [ExpiryTime], [LoadProfileId], [PriceBasisId], [SamplingFrom], [SamplingTo], [SwapPriceTypeId], [TimeZoneId], [UnderlyingInstrumentId], [CurrencyId], [CurrencySourceId], [TU_Id], [PriceUnitId], [Payout], [LowerTrigger], [UpperTrigger], [TriggerCurrencyId], [MarketPriceFactor], [SettlementRuleId], [InterconnectorId], [Interruptible], [UserSpecifiedName], [EnvironmentLabelId], [IndexedPriceBookTemplateId], [PriceBasisToAreaId], [ModelTypeId], [MinVol], [MaxVol], [FixPrice], [Threshold], [HistoricContractPriceSeriesId], [HistoricMarketPriceSeriesId], [ReferencePriceSeriesId], [DestinationReferencePriceSeriesId], [PublishingPeriodTypeId], ic.[ProductionFacilityId], ic.[CertificateTypeId], ic.[DateOfTransfer], GetUTCDate()
		FROM [DAILY_QAECM191].[dbo].Instruments i
		LEFT JOIN [DAILY_QAECM191].[dbo].InstrumentCertificates ic
		ON i.InstrumentId = ic.InstrumentId
		WHERE i.InstrumentId IN (
			SELECT InstrumentId from @duplicates
		)

		UPDATE [DAILY_QAECM191].[dbo].Transactions
		SET InstrumentId = d.FirstInstrumentId
		FROM [DAILY_QAECM191].[dbo].Transactions t
		JOIN @duplicates d
		ON t.InstrumentId = d.InstrumentId

		UPDATE [DAILY_QAECM191].[dbo].Transactions
		SET UnderlyingInstrumentId = d.FirstInstrumentId
		FROM [DAILY_QAECM191].[dbo].Transactions t
		JOIN @duplicates d
		ON t.UnderlyingInstrumentId = d.InstrumentId


		DELETE [DAILY_QAECM191].[dbo].InstrumentCertificates where InstrumentId IN (
			SELECT InstrumentId from @duplicates
		)

		DELETE [DAILY_QAECM191].[dbo].Instruments where InstrumentId IN (
			SELECT InstrumentId from @duplicates
		)


		COMMIT TRAN
END TRY
BEGIN CATCH
		ROLLBACK
		SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH 