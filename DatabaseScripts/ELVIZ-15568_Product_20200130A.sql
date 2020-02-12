:setvar dbA "DAILY_QAPrices192"
:setvar dbB "DAILY_QAPrices201"

;WITH ProductPricesSideA (ProdName, ProductTypeId, LastTradeDate, FromDate, ToDate, Hours, CommodityId, PriceUnitId, ExecutionVenueId, AreaId, LoadTypeId, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId, ProductCodeTypeId, Code, TradeDate, PriceTypeId, Value, CurrencyId) as (
	SELECT ProdName, pd.TypeId ProductTypeId, LastTradeDate, FromDate, ToDate, Hours, CommodityId, PriceUnitId, ExecutionVenueId, AreaId, LoadTypeId, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId, ProductCodeTypeId, Code, TradeDate, pc.TypeId PriceTypeId, Value, CurrencyId
	FROM $(dbA)..Products pd
		JOIN $(dbA)..Prices pc on pd.ProdId = pc.ProdId
		LEFT JOIN $(dbA)..ProductCodes pdc on pd.ProdId = pdc.ProductId
	where pd.SourceId = 2
),
ProductPricesSideB (ProdName, ProductTypeId, LastTradeDate, FromDate, ToDate, Hours, CommodityId, PriceUnitId, ExecutionVenueId, AreaId, LoadTypeId, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId, ProductCodeTypeId, Code, TradeDate, PriceTypeId, Value, CurrencyId) as (
	SELECT ProdName, pd.TypeId ProductTypeId, LastTradeDate, FromDate, ToDate, Hours, CommodityId, PriceUnitId, ExecutionVenueId, AreaId, LoadTypeId, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId, ProductCodeTypeId, Code, TradeDate, pc.TypeId PriceTypeId, Value, CurrencyId
	FROM $(dbB)..Products pd
		JOIN $(dbB)..Prices pc on pd.ProdId = pc.ProdId
		LEFT JOIN $(dbB)..ProductCodes pdc on pd.ProdId = pdc.ProductId
	where pd.SourceId = 2
)
select * from ProductPricesSideA a FULL OUTER JOIN ProductPricesSideB b ON
(a.ProdName = b.ProdName)
AND (a.ProductTypeId = b.ProductTypeId)
AND ((a.LastTradeDate = b.LastTradeDate) OR (a.LastTradeDate IS NULL AND b.LastTradeDate IS NULL))
AND ((a.FromDate = b.FromDate) OR (a.FromDate IS NULL AND b.FromDate IS NULL))
AND ((a.ToDate = b.ToDate) OR (a.ToDate IS NULL AND b.ToDate IS NULL))
AND ((a.Hours = b.Hours) OR (a.Hours IS NULL AND b.Hours IS NULL))
AND (a.CommodityId = b.CommodityId)
AND (a.PriceUnitId = b.PriceUnitId)
AND ((a.ExecutionVenueId = b.ExecutionVenueId) OR (a.ExecutionVenueId IS NULL AND b.ExecutionVenueId IS NULL))
AND ((a.AreaId = b.AreaId) OR (a.AreaId IS NULL AND b.AreaId IS NULL))
AND ((a.LoadTypeId = b.LoadTypeId) OR (a.LoadTypeId IS NULL AND b.LoadTypeId IS NULL))
AND ((a.DeliveryTypeId = b.DeliveryTypeId) OR (a.DeliveryTypeId IS NULL AND b.DeliveryTypeId IS NULL))
AND ((a.CfdBaseAreaId = b.CfdBaseAreaId) OR (a.CfdBaseAreaId IS NULL AND b.CfdBaseAreaId IS NULL))
AND ((a.ProductVenueId = b.ProductVenueId) OR (a.ProductVenueId IS NULL AND b.ProductVenueId IS NULL))
AND ((a.IsCall = b.IsCall) OR (a.IsCall IS NULL AND b.IsCall IS NULL))
AND ((a.Strike = b.Strike) OR (a.Strike IS NULL AND b.Strike IS NULL))
AND ((a.FutureTypeId = b.FutureTypeId) OR (a.FutureTypeId IS NULL AND b.FutureTypeId IS NULL))
AND ((a.PublishingPeriodTypeId = b.PublishingPeriodTypeId) OR (a.PublishingPeriodTypeId IS NULL AND b.PublishingPeriodTypeId IS NULL))
AND ((a.ProductCodeTypeId = b.ProductCodeTypeId) OR (a.ProductCodeTypeId IS NULL AND b.ProductCodeTypeId IS NULL))
AND ((a.Code = b.Code) OR (a.Code IS NULL AND b.Code IS NULL))
AND (a.TradeDate = b.TradeDate)
AND (a.PriceTypeId = b.PriceTypeId)
AND ((a.Value = b.Value) OR (a.Value IS NULL AND b.Value IS NULL))
AND (a.CurrencyId = b.CurrencyId)
where a.ProdName IS NULL or b.ProdName is null


