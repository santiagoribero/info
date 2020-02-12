:setvar dbA "DAILY_QAPrices192"
:setvar dbB "DAILY_QAPrices201"

;WITH AreaPricesSideA (AreaName, PriceUnitId, VolumeUnitId, UserDefined, TypeId, AreaPricePeriodTypeId, Price, PeriodStartTimeUTC) as (
	SELECT a.AreaName, PriceUnitId, VolumeUnitId, UserDefined, t.TypeId, period.AreaPricePeriodTypeId, prices.Price, prices.PeriodStartTimeUTC
	FROM $(dbA)..AreaPriceSeries serie
		join $(dbA)..Areas a on serie.AreaId = a.AreaId
		join $(dbA)..AreaPriceTypes t on t.TypeId = serie.TypeId
		join $(dbA)..AreaPrices prices on prices.AreaPriceSeriesId = serie.AreaPriceSeriesId
		join $(dbA)..AreaPricePeriodTypes period on serie.AreaPricePeriodTypeId= period.AreaPricePeriodTypeId
		JOIN $(dbA)..AreaPricesChangeSet changeSet on prices.AreaPricesChangeSetId = changeSet.AreaPricesChangeSetId
	where changeSet.SourceId = 2
),
AreaPricesSideB (AreaName, PriceUnitId, VolumeUnitId, UserDefined, TypeId, AreaPricePeriodTypeId, Price, PeriodStartTimeUTC) as (
	SELECT a.AreaName, PriceUnitId, VolumeUnitId, UserDefined, t.TypeId, period.AreaPricePeriodTypeId, prices.Price, prices.PeriodStartTimeUTC
	FROM $(dbB)..AreaPriceSeries serie
		join $(dbB)..Areas a on serie.AreaId = a.AreaId
		join $(dbB)..AreaPriceTypes t on t.TypeId = serie.TypeId
		join $(dbB)..AreaPrices prices on prices.AreaPriceSeriesId = serie.AreaPriceSeriesId
		join $(dbB)..AreaPricePeriodTypes period on serie.AreaPricePeriodTypeId= period.AreaPricePeriodTypeId
		JOIN $(dbB)..AreaPricesChangeSet changeSet on prices.AreaPricesChangeSetId = changeSet.AreaPricesChangeSetId
	where changeSet.SourceId = 2
)
select * from AreaPricesSideA a FULL OUTER JOIN AreaPricesSideB b ON
	(a.AreaName = b.AreaName)
	AND (a.PriceUnitId = b.PriceUnitId)
	AND (a.VolumeUnitId = b.VolumeUnitId)
	AND (a.UserDefined = b.UserDefined)
	AND (a.TypeId = b.TypeId)
	AND (a.Price = b.Price)
	AND (a.PeriodStartTimeUTC = b.PeriodStartTimeUTC)
	AND (a.AreaPricePeriodTypeId = b.AreaPricePeriodTypeId)
where a.AreaName IS NULL or b.AreaName is null

