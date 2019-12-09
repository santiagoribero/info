SET IDENTITY_INSERT Instruments ON

INSERT INTO Instruments (InstrumentId, InstrumentName, InstrumentShortName, InstrumentTypeId, StatusId, ExecutionVenueId, CommodityId, ExpiryOffset, StripPeriodResolution, BarrierOptionTypeId, FromDate, ToDate, ExpiryDate, Strike, SamplingPeriodId, PutCall, Hours, BaseCurrencyId, CrossCurrencyId, BookPriceTypeId, CapFloorPricingPeriodTypeId, FutureTypeId, DeliveryTypeId, ExpiryTime, LoadProfileId, PriceBasisId, SamplingFrom, SamplingTo, SwapPriceTypeId, TimeZoneId, UnderlyingInstrumentId, CurrencyId, CurrencySourceId, TU_Id, PriceUnitId, Payout, LowerTrigger, UpperTrigger, TriggerCurrencyId, MarketPriceFactor, SettlementRuleId, InterconnectorId, Interruptible, UserSpecifiedName, EnvironmentLabelId, IndexedPriceBookTemplateId, PriceBasisToAreaId, ModelTypeId, MinVol, MaxVol, FixPrice, Threshold, HistoricContractPriceSeriesId, HistoricMarketPriceSeriesId, ReferencePriceSeriesId, DestinationReferencePriceSeriesId, PublishingPeriodTypeId)
SELECT InstrumentId, InstrumentName, InstrumentShortName, InstrumentTypeId, StatusId, ExecutionVenueId, CommodityId, ExpiryOffset, StripPeriodResolution, BarrierOptionTypeId, FromDate, ToDate, ExpiryDate, Strike, SamplingPeriodId, PutCall, Hours, BaseCurrencyId, CrossCurrencyId, BookPriceTypeId, CapFloorPricingPeriodTypeId, FutureTypeId, DeliveryTypeId, ExpiryTime, LoadProfileId, PriceBasisId, SamplingFrom, SamplingTo, SwapPriceTypeId, TimeZoneId, UnderlyingInstrumentId, CurrencyId, CurrencySourceId, TU_Id, PriceUnitId, Payout, LowerTrigger, UpperTrigger, TriggerCurrencyId, MarketPriceFactor, SettlementRuleId, InterconnectorId, Interruptible, UserSpecifiedName, EnvironmentLabelId, IndexedPriceBookTemplateId, PriceBasisToAreaId, ModelTypeId, MinVol, MaxVol, FixPrice, Threshold, HistoricContractPriceSeriesId, HistoricMarketPriceSeriesId, ReferencePriceSeriesId, DestinationReferencePriceSeriesId, PublishingPeriodTypeId
from [ELVIZ14214InstrumentsBkp]

SET IDENTITY_INSERT Instruments OFF



update t
set t.InstrumentId = tbkp.InstrumentId,
t.UnderlyingInstrumentID = tbkp.UnderlyingInstrumentID
FROM Transactions t
JOIN ELVIZ14214TransactionsBkp tbkp
ON T.Id = tbkp.Id


truncate table ELVIZ14214TransactionsBkp
truncate table ELVIZ14214InstrumentsBkp
