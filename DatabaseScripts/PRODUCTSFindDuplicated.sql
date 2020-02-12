;WITH FirstInstance ([ProdId], [ProdName], [TypeId], [CommodityId], [ExecutionVenueId], [AreaId], [LoadTypeId] , [DeliveryTypeId], [CfdBaseAreaId], [ProductVenueId], [IsCall], [Strike], [FutureTypeId], [PublishingPeriodTypeId], [ProductCodeTypeId], [Code])
AS
(
	SELECT MAX(p.ProdId) [ProdId], p.[ProdName], p.[TypeId], p.[CommodityId], p.[ExecutionVenueId], p.[AreaId], p.[LoadTypeId], p.[DeliveryTypeId], p.[CfdBaseAreaId], p.[ProductVenueId], p.[IsCall], p.[Strike], p.[FutureTypeId], p.[PublishingPeriodTypeId], pc.[ProductCodeTypeId], pc.[Code]
	FROM [dbo].Products p
	LEFT JOIN [dbo].ProductCodes pc
	ON p.ProdId = pc.ProductId
	JOIN [dbo].DataSources ds
	ON ds.SourceId = p.SourceId
	JOIN (

			SELECT p2.[ProdName], p2.[TypeId], p2.[CommodityId], p2.[ExecutionVenueId], p2.[AreaId], p2.[LoadTypeId], p2.[DeliveryTypeId], p2.[CfdBaseAreaId], p2.[ProductVenueId], p2.[IsCall], p2.[Strike], p2.[FutureTypeId], p2.[PublishingPeriodTypeId], pc2.[ProductCodeTypeId], pc2.[Code], MIN(
				CASE 
				WHEN ds2.SourceName like '%manual%'
					or ds2.SourceName like '%excel%'
					or ds2.SourceName like '%import%'
					or ds2.SourceName like '%external%'
				THEN 2
				ELSE 1
				END) as SourcePriority
			FROM [dbo].Products p2
			LEFT JOIN [dbo].ProductCodes pc2
			ON p2.ProdId = pc2.ProductId
			JOIN [dbo].DataSources ds2
			ON ds2.SourceId = p2.SourceId

			GROUP BY p2.[ProdName], p2.[TypeId], p2.[CommodityId], p2.[ExecutionVenueId], p2.[AreaId], p2.[LoadTypeId], p2.[DeliveryTypeId], p2.[CfdBaseAreaId], p2.[ProductVenueId], p2.[IsCall], p2.[Strike], p2.[FutureTypeId], p2.[PublishingPeriodTypeId], pc2.[ProductCodeTypeId], pc2.[Code]
			having count(1) > 1
		) subquery
	ON (
		(p.[ProdName] = subquery.[ProdName] OR (p.[ProdName] IS NULL AND subquery.[ProdName] IS NULL))
		AND (p.[TypeId] = subquery.[TypeId] OR (p.[TypeId] IS NULL AND subquery.[TypeId] IS NULL))
		AND (p.[CommodityId] = subquery.[CommodityId] OR (p.[CommodityId] IS NULL AND subquery.[CommodityId] IS NULL))
		AND (p.[ExecutionVenueId] = subquery.[ExecutionVenueId] OR (p.[ExecutionVenueId] IS NULL AND subquery.[ExecutionVenueId] IS NULL))
		AND (p.[AreaId] = subquery.[AreaId] OR (p.[AreaId] IS NULL AND subquery.[AreaId] IS NULL))
		AND (p.[LoadTypeId] = subquery.[LoadTypeId] OR (p.[LoadTypeId] IS NULL AND subquery.[LoadTypeId] IS NULL))
		AND (p.[DeliveryTypeId] = subquery.[DeliveryTypeId] OR (p.[DeliveryTypeId] IS NULL AND subquery.[DeliveryTypeId] IS NULL))
		AND (p.[CfdBaseAreaId] = subquery.[CfdBaseAreaId] OR (p.[CfdBaseAreaId] IS NULL AND subquery.[CfdBaseAreaId] IS NULL))
		AND (p.[ProductVenueId] = subquery.[ProductVenueId] OR (p.[ProductVenueId] IS NULL AND subquery.[ProductVenueId] IS NULL))
		AND (p.[IsCall] = subquery.[IsCall] OR (p.[IsCall] IS NULL AND subquery.[IsCall] IS NULL))
		AND (p.[Strike] = subquery.[Strike] OR (p.[Strike] IS NULL AND subquery.[Strike] IS NULL))
		AND (p.[FutureTypeId] = subquery.[FutureTypeId] OR (p.[FutureTypeId] IS NULL AND subquery.[FutureTypeId] IS NULL))
		AND (p.[PublishingPeriodTypeId] = subquery.[PublishingPeriodTypeId] OR (p.[PublishingPeriodTypeId] IS NULL AND subquery.[PublishingPeriodTypeId] IS NULL))
		AND (pc.[ProductCodeTypeId] = subquery.[ProductCodeTypeId] OR (pc.[ProductCodeTypeId] IS NULL AND subquery.[ProductCodeTypeId] IS NULL))
		AND (pc.[Code] = subquery.[Code] OR (pc.[Code] IS NULL AND subquery.[Code] IS NULL))
		AND CASE 
				WHEN ds.SourceName like '%manual%'
					or ds.SourceName like '%excel%'
					or ds.SourceName like '%import%'
					or ds.SourceName like '%external%'
				THEN 2
				ELSE 1
				END = subquery.SourcePriority
		)

	GROUP BY p.[ProdName], p.[TypeId], p.[CommodityId], p.[ExecutionVenueId], p.[AreaId], p.[LoadTypeId], p.[DeliveryTypeId], p.[CfdBaseAreaId], p.[ProductVenueId], p.[IsCall], p.[Strike], p.[FutureTypeId], p.[PublishingPeriodTypeId], pc.[ProductCodeTypeId], pc.[Code]
)

SELECT p.ProdId ProdId, fi.ProdId FirstProdId
FROM [dbo].Products p
LEFT JOIN [dbo].ProductCodes pc
ON p.ProdId = pc.ProductId
JOIN FirstInstance fi
ON (
	(fi.[ProdName] = p.[ProdName] OR (fi.[ProdName] IS NULL AND p.[ProdName] IS NULL))
	AND (fi.[TypeId] = p.[TypeId] OR (fi.[TypeId] IS NULL AND p.[TypeId] IS NULL))
	AND (fi.[CommodityId] = p.[CommodityId] OR (fi.[CommodityId] IS NULL AND p.[CommodityId] IS NULL))
	AND (fi.[ExecutionVenueId] = p.[ExecutionVenueId] OR (fi.[ExecutionVenueId] IS NULL AND p.[ExecutionVenueId] IS NULL))
	AND (fi.[AreaId] = p.[AreaId] OR (fi.[AreaId] IS NULL AND p.[AreaId] IS NULL))
	AND (fi.[LoadTypeId] = p.[LoadTypeId] OR (fi.[LoadTypeId] IS NULL AND p.[LoadTypeId] IS NULL))
	AND (fi.[DeliveryTypeId] = p.[DeliveryTypeId] OR (fi.[DeliveryTypeId] IS NULL AND p.[DeliveryTypeId] IS NULL))
	AND (fi.[CfdBaseAreaId] = p.[CfdBaseAreaId] OR (fi.[CfdBaseAreaId] IS NULL AND p.[CfdBaseAreaId] IS NULL))
	AND (fi.[ProductVenueId] = p.[ProductVenueId] OR (fi.[ProductVenueId] IS NULL AND p.[ProductVenueId] IS NULL))
	AND (fi.[IsCall] = p.[IsCall] OR (fi.[IsCall] IS NULL AND p.[IsCall] IS NULL))
	AND (fi.[Strike] = p.[Strike] OR (fi.[Strike] IS NULL AND p.[Strike] IS NULL))
	AND (fi.[FutureTypeId] = p.[FutureTypeId] OR (fi.[FutureTypeId] IS NULL AND p.[FutureTypeId] IS NULL))
	AND (fi.[PublishingPeriodTypeId] = p.[PublishingPeriodTypeId] OR (fi.[PublishingPeriodTypeId] IS NULL AND p.[PublishingPeriodTypeId] IS NULL))
	AND (fi.[ProductCodeTypeId] = pc.[ProductCodeTypeId] OR (fi.[ProductCodeTypeId] IS NULL AND pc.[ProductCodeTypeId] IS NULL))
	AND (fi.[Code] = pc.[Code] OR (fi.[Code] IS NULL AND pc.[Code] IS NULL))
	AND fi.ProdId <> p.ProdId
)

