if not exists (select * from sysobjects where name='ELVIZ14214ProductsBkp' and xtype='U')
CREATE TABLE [dbo].[ELVIZ14214ProductsBkp](
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

if not exists (select * from sysobjects where name='ELVIZ14214PricesBkp' and xtype='U')
CREATE TABLE [dbo].[ELVIZ14214PricesBkp](
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

		;WITH FirstInstance ([ProdId], [ProdName], [TypeId], [LastTradeDate], [FromDate], [ToDate], [Hours], [CommodityId], [PriceUnitId], [ExecutionVenueId], [AreaId], [LoadTypeId], [FirstTradeDate], [DeliveryTypeId], [CfdBaseAreaId], [ProductVenueId], [IsCall], [Strike], [FutureTypeId], [PublishingPeriodTypeId], [ProductCodeTypeId], [Code])
		AS
		(
			SELECT MIN(p.[ProdId]) [ProdId], [ProdName], [TypeId], [LastTradeDate], [FromDate], [ToDate], [Hours], [CommodityId], [PriceUnitId], [ExecutionVenueId], [AreaId], [LoadTypeId], [FirstTradeDate], [DeliveryTypeId], [CfdBaseAreaId], [ProductVenueId], [IsCall], [Strike], [FutureTypeId], [PublishingPeriodTypeId], pc.[ProductCodeTypeId], pc.[Code]
			FROM dbo.Products p
			LEFT JOIN dbo.ProductCodes pc
			ON p.ProdId = pc.ProductId
			GROUP BY [ProdName], [TypeId], [LastTradeDate], [FromDate], [ToDate], [Hours], [CommodityId], [PriceUnitId], [ExecutionVenueId], [AreaId], [LoadTypeId], [FirstTradeDate], [DeliveryTypeId], [CfdBaseAreaId], [ProductVenueId], [IsCall], [Strike], [FutureTypeId], [PublishingPeriodTypeId], pc.[ProductCodeTypeId], pc.[Code]
			HAVING Count(1) > 1
		)
		insert into @duplicates (ProdId, FirstProdId)
		SELECT p.ProdId, fi.ProdId
		FROM Products p
		LEFT JOIN dbo.ProductCodes pc
		ON p.ProdId = pc.ProductId
		JOIN FirstInstance fi
		ON (
			(fi.[ProdName] = p.[ProdName] OR (fi.[ProdName] IS NULL AND p.[ProdName] IS NULL))
			AND (fi.[TypeId] = p.[TypeId] OR (fi.[TypeId] IS NULL AND p.[TypeId] IS NULL))
			AND (fi.[LastTradeDate] = p.[LastTradeDate] OR (fi.[LastTradeDate] IS NULL AND p.[LastTradeDate] IS NULL))
			AND (fi.[FromDate] = p.[FromDate] OR (fi.[FromDate] IS NULL AND p.[FromDate] IS NULL))
			AND (fi.[ToDate] = p.[ToDate] OR (fi.[ToDate] IS NULL AND p.[ToDate] IS NULL))
			AND (fi.[Hours] = p.[Hours] OR (fi.[Hours] IS NULL AND p.[Hours] IS NULL))
			AND (fi.[CommodityId] = p.[CommodityId] OR (fi.[CommodityId] IS NULL AND p.[CommodityId] IS NULL))
			AND (fi.[PriceUnitId] = p.[PriceUnitId] OR (fi.[PriceUnitId] IS NULL AND p.[PriceUnitId] IS NULL))
			AND (fi.[ExecutionVenueId] = p.[ExecutionVenueId] OR (fi.[ExecutionVenueId] IS NULL AND p.[ExecutionVenueId] IS NULL))
			AND (fi.[AreaId] = p.[AreaId] OR (fi.[AreaId] IS NULL AND p.[AreaId] IS NULL))
			AND (fi.[LoadTypeId] = p.[LoadTypeId] OR (fi.[LoadTypeId] IS NULL AND p.[LoadTypeId] IS NULL))
			AND (fi.[FirstTradeDate] = p.[FirstTradeDate] OR (fi.[FirstTradeDate] IS NULL AND p.[FirstTradeDate] IS NULL))
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


		INSERT INTO ELVIZ14214PricesBkp ([TradeDate], [ProdId], [TypeId], [Value], [SourceId], [TimeStamp], [CurrencyId], [ProcessedAt], [NewProdId])
		SELECT [TradeDate], p.[ProdId], [TypeId], [Value], [SourceId], [TimeStamp], [CurrencyId], GetUtcDate(), d.FirstProdId
		FROM Prices p
		JOIN @duplicates d
		ON p.ProdId = d.ProdId


		INSERT INTO ELVIZ14214ProductsBkp ([ProdId], [ProdName], [TypeId], [LastTradeDate], [FromDate], [ToDate], [Hours], [SourceId], [CommodityId], [PriceUnitId], [TimeStamp], [ExecutionVenueId], [AreaId], [LoadTypeId], [FirstTradeDate], [DeliveryTypeId], [CfdBaseAreaId], [ProductVenueId], [IsCall], [Strike], [FutureTypeId], [PublishingPeriodTypeId], [ProductCodeTypeId], [Code], [ProcessedAt], [NewProdId])
		SELECT p.[ProdId], p.[ProdName], p.[TypeId], p.[LastTradeDate], p.[FromDate], p.[ToDate], p.[Hours], p.[SourceId], p.[CommodityId], p.[PriceUnitId], p.[TimeStamp], p.[ExecutionVenueId], p.[AreaId], p.[LoadTypeId], p.[FirstTradeDate], p.[DeliveryTypeId], p.[CfdBaseAreaId], p.[ProductVenueId], p.[IsCall], p.[Strike], p.[FutureTypeId], p.[PublishingPeriodTypeId], pc.[ProductCodeTypeId], pc.[Code], GetUtcDate(), d.FirstProdId
		FROM Products p
		LEFT JOIN dbo.ProductCodes pc
		ON p.ProdId = pc.ProductId
		JOIN @duplicates d
		ON p.ProdId = d.ProdId


		INSERT INTO Prices ([ProdId],[TradeDate],[TypeId],[Value],[SourceId],[TimeStamp],[CurrencyId])
		SELECT subquery.FirstProdId, p3.[TradeDate], p3.[TypeId], p3.[Value], p3.[SourceId], p3.[TimeStamp], p3.[CurrencyId]
		FROM Prices p3
		JOIN
		(
			SELECT d.FirstProdId, p.TypeId, p.TradeDate, MAX(p.ProdId) ProdId
			FROM Prices p
			JOIN @duplicates d
			ON d.ProdId = p.ProdId
			WHERE NOT EXISTS
			(
				SELECT 1
				FROM Prices p2
				WHERE p2.ProdId = d.FirstProdId
				AND p2.TypeId = p.TypeId
				AND p2.TradeDate = p.TradeDate
			)
			GROUP BY d.FirstProdId, p.TypeId, p.TradeDate
		) as subquery
		ON (p3.ProdId = subquery.ProdID
			AND p3.TypeId = subquery.TypeId
			AND p3.TradeDate = subquery.TradeDate)
		
		
		DELETE Prices
		WHERE ProdId IN ( SELECT ProdId FROM @duplicates )

		DELETE ProductCodes
		WHERE ProductId IN ( SELECT ProdId FROM @duplicates )

		DELETE Products
		WHERE ProdId IN ( SELECT ProdId FROM @duplicates )
		

		COMMIT TRAN
END TRY
BEGIN CATCH
		ROLLBACK
		SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH 


