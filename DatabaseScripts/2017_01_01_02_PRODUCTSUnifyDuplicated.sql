IF NOT EXISTS ( SELECT 1 FROM [DAILY_QAPrices191].[dbo].InstallShield WHERE ISSchema = '2017.1.1.02' )
BEGIN
	THROW 50001, 'The script cannot run in Prices versions prior to 2017.1.1.02', 1
END

if ('2018.2.1.01' < (SELECT MAX(IISchema) FROM [DAILY_QAPrices191].[dbo].InstallShield) OR '2019.1.0.03' < (SELECT MAX(IISchema) FROM [DAILY_QAECM191].[dbo].InstallShield))
BEGIN
	THROW 50001, 'The script was not verified with this version of the database. Please confirm the compatibility with a developer', 1
END

if not exists (select * from [DAILY_QAPrices191].[dbo].sysobjects where name='ELVIZ14214ProductsBkp' and xtype='U')
CREATE TABLE [DAILY_QAPrices191].[dbo].[ELVIZ14214ProductsBkp](
	[ProdId] [int] NOT NULL,
	[ProdName] [varchar](255) NOT NULL,
	[TypeId] [int] NOT NULL,
	[LastTradeDate] [datetime] NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[Hours] [int] NULL,
	[SourceId] [int] NOT NULL,
	[CommodityId] [int] NOT NULL,
	[PriceUnitId] [int] NOT NULL,
	[TimeStamp] [datetime] NULL,
	[ExecutionVenueId] [int] NULL,
	[AreaId] [int] NULL,
	[LoadTypeId] [int] NULL,
	[FirstTradeDate] [datetime] NULL,
	[DeliveryTypeId] [int] NULL,
	[CfdBaseAreaId] [int] NULL,
	[ProductVenueId] [int] NULL,
	[IsCall] [int] NULL,
	[Strike] [float] NULL,
	[FutureTypeId] [int] NULL,
	[PublishingPeriodTypeId] [int] NULL,
	[ProductCodeTypeId] [int] NULL,
	[Code] [varchar](255) NULL,
	[ProcessedAt] [datetime] NOT NULL,
	[NewProdId] [int] NOT NULL
	)

if not exists (select * from [DAILY_QAPrices191].[dbo].sysobjects where name='ELVIZ14214PricesBkp' and xtype='U')
CREATE TABLE [DAILY_QAPrices191].[dbo].[ELVIZ14214PricesBkp](
	[TradeDate] [datetime] NOT NULL,
	[ProdId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[Value] [float] NULL,
	[SourceId] [int] NOT NULL,
	[TimeStamp] [datetime] NULL,
	[CurrencyId] [int] NOT NULL,
	[ProcessedAt] [datetime] NOT NULL,
	[NewProdId] [int] NOT NULL
	)



DECLARE @duplicates as Table (
ProdId INT not null primary key,
FirstProdId INT not null
)


SET XACT_ABORT ON
BEGIN TRY
		BEGIN TRAN

		;WITH FirstInstance ([ProdId], [ProdName], [TypeId], [CommodityId], [ExecutionVenueId], [AreaId], [LoadTypeId] , [DeliveryTypeId], [CfdBaseAreaId], [ProductVenueId], [IsCall], [Strike], [FutureTypeId], [PublishingPeriodTypeId], [ProductCodeTypeId], [Code])
		AS
		(
			SELECT MAX(p.ProdId) [ProdId], p.[ProdName], p.[TypeId], p.[CommodityId], p.[ExecutionVenueId], p.[AreaId], p.[LoadTypeId], p.[DeliveryTypeId], p.[CfdBaseAreaId], p.[ProductVenueId], p.[IsCall], p.[Strike], p.[FutureTypeId], p.[PublishingPeriodTypeId], pc.[ProductCodeTypeId], pc.[Code]
			FROM [DAILY_QAPrices191].[dbo].Products p
			LEFT JOIN [DAILY_QAPrices191].[dbo].ProductCodes pc
			ON p.ProdId = pc.ProductId
			JOIN [DAILY_QAPrices191].[dbo].DataSources ds
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
					FROM [DAILY_QAPrices191].[dbo].Products p2
					LEFT JOIN [DAILY_QAPrices191].[dbo].ProductCodes pc2
					ON p2.ProdId = pc2.ProductId
					JOIN [DAILY_QAPrices191].[dbo].DataSources ds2
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
		insert into @duplicates (ProdId, FirstProdId)
		SELECT p.ProdId, fi.ProdId
		FROM [DAILY_QAPrices191].[dbo].Products p
		LEFT JOIN [DAILY_QAPrices191].[dbo].ProductCodes pc
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


		INSERT INTO [DAILY_QAPrices191].[dbo].ELVIZ14214PricesBkp ([TradeDate], [ProdId], [TypeId], [Value], [SourceId], [TimeStamp], [CurrencyId], [ProcessedAt], [NewProdId])
		SELECT [TradeDate], p.[ProdId], [TypeId], [Value], [SourceId], [TimeStamp], [CurrencyId], GetUtcDate(), d.FirstProdId
		FROM [DAILY_QAPrices191].[dbo].Prices p
		JOIN @duplicates d
		ON p.ProdId = d.ProdId


		INSERT INTO [DAILY_QAPrices191].[dbo].ELVIZ14214ProductsBkp ([ProdId], [ProdName], [TypeId], [LastTradeDate], [FromDate], [ToDate], [Hours], [SourceId], [CommodityId], [PriceUnitId], [TimeStamp], [ExecutionVenueId], [AreaId], [LoadTypeId], [FirstTradeDate], [DeliveryTypeId], [CfdBaseAreaId], [ProductVenueId], [IsCall], [Strike], [FutureTypeId], [PublishingPeriodTypeId], [ProductCodeTypeId], [Code], [ProcessedAt], [NewProdId])
		SELECT p.[ProdId], p.[ProdName], p.[TypeId], p.[LastTradeDate], p.[FromDate], p.[ToDate], p.[Hours], p.[SourceId], p.[CommodityId], p.[PriceUnitId], p.[TimeStamp], p.[ExecutionVenueId], p.[AreaId], p.[LoadTypeId], p.[FirstTradeDate], p.[DeliveryTypeId], p.[CfdBaseAreaId], p.[ProductVenueId], p.[IsCall], p.[Strike], p.[FutureTypeId], p.[PublishingPeriodTypeId], pc.[ProductCodeTypeId], pc.[Code], GetUtcDate(), d.FirstProdId
		FROM [DAILY_QAPrices191].[dbo].Products p
		LEFT JOIN [DAILY_QAPrices191].[dbo].ProductCodes pc
		ON p.ProdId = pc.ProductId
		JOIN @duplicates d
		ON p.ProdId = d.ProdId


		INSERT INTO [DAILY_QAPrices191].[dbo].Prices ([ProdId],[TradeDate],[TypeId],[Value],[SourceId],[TimeStamp],[CurrencyId])
		SELECT subquery.FirstProdId, p3.[TradeDate], p3.[TypeId], p3.[Value], p3.[SourceId], p3.[TimeStamp], p3.[CurrencyId]
		FROM [DAILY_QAPrices191].[dbo].Prices p3
		JOIN
		(
			SELECT d.FirstProdId, p.TypeId, p.TradeDate, MAX(p.ProdId) ProdId
			FROM [DAILY_QAPrices191].[dbo].Prices p
			JOIN @duplicates d
			ON d.ProdId = p.ProdId
			WHERE NOT EXISTS
			(
				SELECT 1
				FROM [DAILY_QAPrices191].[dbo].Prices p2
				WHERE p2.ProdId = d.FirstProdId
				AND p2.TypeId = p.TypeId
				AND p2.TradeDate = p.TradeDate
			)
			GROUP BY d.FirstProdId, p.TypeId, p.TradeDate
		) as subquery
		ON (p3.ProdId = subquery.ProdID
			AND p3.TypeId = subquery.TypeId
			AND p3.TradeDate = subquery.TradeDate)
		
		
		DELETE [DAILY_QAPrices191].[dbo].Prices
		WHERE ProdId IN ( SELECT ProdId FROM @duplicates )

		DELETE [DAILY_QAPrices191].[dbo].ProductCodes
		WHERE ProductId IN ( SELECT ProdId FROM @duplicates )

		DELETE [DAILY_QAPrices191].[dbo].Products
		WHERE ProdId IN ( SELECT ProdId FROM @duplicates )
		

		COMMIT TRAN
END TRY
BEGIN CATCH
		ROLLBACK
		SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH 


