;WITH FirstInstance ([InstrumentId], [InstrumentName], [InstrumentShortName], [InstrumentTypeId], [StatusId], [ExecutionVenueId], [CommodityId], [ExpiryOffset], [StripPeriodResolution], [BarrierOptionTypeId], [FromDate], [ToDate], [ExpiryDate], [Strike], [SamplingPeriodId], [PutCall], [Hours], [BaseCurrencyId], [CrossCurrencyId], [BookPriceTypeId], [CapFloorPricingPeriodTypeId], [FutureTypeId], [DeliveryTypeId], [ExpiryTime], [LoadProfileId], [PriceBasisId], [SamplingFrom], [SamplingTo], [SwapPriceTypeId], [TimeZoneId], [UnderlyingInstrumentId], [CurrencyId], [CurrencySourceId], [TU_Id], [PriceUnitId], [Payout], [LowerTrigger], [UpperTrigger], [TriggerCurrencyId], [MarketPriceFactor], [SettlementRuleId], [InterconnectorId], [Interruptible], [UserSpecifiedName], [EnvironmentLabelId], [IndexedPriceBookTemplateId], [PriceBasisToAreaId], [ModelTypeId], [MinVol], [MaxVol], [FixPrice], [Threshold], [HistoricContractPriceSeriesId], [HistoricMarketPriceSeriesId], [ReferencePriceSeriesId], [DestinationReferencePriceSeriesId], [PublishingPeriodTypeId], ProductionFacilityId, CertificateTypeId, DateOfTransfer)
AS
(
	SELECT MIN(i.InstrumentId) [InstrumentId], i.[InstrumentName], i.[InstrumentShortName], i.[InstrumentTypeId], i.[StatusId], i.[ExecutionVenueId], i.[CommodityId], COALESCE(i.[ExpiryOffset], 0), i.[StripPeriodResolution], i.[BarrierOptionTypeId], i.[FromDate], i.[ToDate], i.[ExpiryDate], i.[Strike], i.[SamplingPeriodId], i.[PutCall], i.[Hours], i.[BaseCurrencyId], i.[CrossCurrencyId], i.[BookPriceTypeId], i.[CapFloorPricingPeriodTypeId], i.[FutureTypeId], i.[DeliveryTypeId], i.[ExpiryTime], i.[LoadProfileId], i.[PriceBasisId], i.[SamplingFrom], i.[SamplingTo], i.[SwapPriceTypeId], i.[TimeZoneId], i.[UnderlyingInstrumentId], i.[CurrencyId], i.[CurrencySourceId], i.[TU_Id], i.[PriceUnitId], i.[Payout], i.[LowerTrigger], i.[UpperTrigger], i.[TriggerCurrencyId], i.[MarketPriceFactor], i.[SettlementRuleId], i.[InterconnectorId], i.[Interruptible], i.[UserSpecifiedName], i.[EnvironmentLabelId], i.[IndexedPriceBookTemplateId], i.[PriceBasisToAreaId], i.[ModelTypeId], i.[MinVol], i.[MaxVol], i.[FixPrice], i.[Threshold], i.[HistoricContractPriceSeriesId], i.[HistoricMarketPriceSeriesId], i.[ReferencePriceSeriesId], i.[DestinationReferencePriceSeriesId], i.[PublishingPeriodTypeId], ProductionFacilityId, CertificateTypeId, DateOfTransfer
	FROM Instruments i
	LEFT JOIN InstrumentCertificates ic
	ON i.InstrumentId = ic.InstrumentId
	WHERE i.UnderlyingInstrumentId IS NULL --I'll only unify instruments that don't have an underlying instrument
	AND i.InstrumentId NOT IN ( SELECT InstrumentId FROM Authorisations ) --I'll only unify instruments without Authorisations
	AND i.InstrumentId NOT IN ( SELECT RefId FROM Instrument_PropertyBools ) --I'll only unify instruments without PropertyBools
	AND i.InstrumentId NOT IN ( SELECT RefId FROM Instrument_PropertyDates ) --I'll only unify instruments without PropertyDates
	AND i.InstrumentId NOT IN ( SELECT RefId FROM Instrument_PropertyFloats ) --I'll only unify instruments without PropertyFloats
	AND i.InstrumentId NOT IN ( SELECT RefId FROM Instrument_PropertyIntegers ) --I'll only unify instruments without PropertyIntegers
	AND i.InstrumentId NOT IN ( SELECT RefId FROM Instrument_PropertyStrings ) --I'll only unify instruments without PropertyStrings
	GROUP BY i.[InstrumentName], i.[InstrumentShortName], i.[InstrumentTypeId], i.[StatusId], i.[ExecutionVenueId], i.[CommodityId], COALESCE(i.[ExpiryOffset], 0), i.[StripPeriodResolution], i.[BarrierOptionTypeId], i.[FromDate], i.[ToDate], i.[ExpiryDate], i.[Strike], i.[SamplingPeriodId], i.[PutCall], i.[Hours], i.[BaseCurrencyId], i.[CrossCurrencyId], i.[BookPriceTypeId], i.[CapFloorPricingPeriodTypeId], i.[FutureTypeId], i.[DeliveryTypeId], i.[ExpiryTime], i.[LoadProfileId], i.[PriceBasisId], i.[SamplingFrom], i.[SamplingTo], i.[SwapPriceTypeId], i.[TimeZoneId], i.[UnderlyingInstrumentId], i.[CurrencyId], i.[CurrencySourceId], i.[TU_Id], i.[PriceUnitId], i.[Payout], i.[LowerTrigger], i.[UpperTrigger], i.[TriggerCurrencyId], i.[MarketPriceFactor], i.[SettlementRuleId], i.[InterconnectorId], i.[Interruptible], i.[UserSpecifiedName], i.[EnvironmentLabelId], i.[IndexedPriceBookTemplateId], i.[PriceBasisToAreaId], i.[ModelTypeId], i.[MinVol], i.[MaxVol], i.[FixPrice], i.[Threshold], i.[HistoricContractPriceSeriesId], i.[HistoricMarketPriceSeriesId], i.[ReferencePriceSeriesId], i.[DestinationReferencePriceSeriesId], i.[PublishingPeriodTypeId], ProductionFacilityId, CertificateTypeId, DateOfTransfer
	HAVING Count(1) > 1
)

SELECT i.InstrumentId, fi.InstrumentId
FROM Instruments i
LEFT JOIN InstrumentCertificates ic
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
AND i.InstrumentId NOT IN ( SELECT InstrumentId FROM Authorisations ) --I'll only unify instruments without Authorisations
AND i.InstrumentId NOT IN ( SELECT RefId FROM Instrument_PropertyBools ) --I'll only unify instruments without PropertyBools
AND i.InstrumentId NOT IN ( SELECT RefId FROM Instrument_PropertyDates ) --I'll only unify instruments without PropertyDates
AND i.InstrumentId NOT IN ( SELECT RefId FROM Instrument_PropertyFloats ) --I'll only unify instruments without PropertyFloats
AND i.InstrumentId NOT IN ( SELECT RefId FROM Instrument_PropertyIntegers ) --I'll only unify instruments without PropertyIntegers
AND i.InstrumentId NOT IN ( SELECT RefId FROM Instrument_PropertyStrings ) --I'll only unify instruments without PropertyStrings

