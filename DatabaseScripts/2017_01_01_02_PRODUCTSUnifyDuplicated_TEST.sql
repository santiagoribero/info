
if NOT exists (select * from [DAILY_QAPrices191].[dbo].sysobjects where name='ProductsTest' and xtype='U')
CREATE TABLE [DAILY_QAPrices191].[dbo].[ProductsTest](
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
	[PublishingPeriodTypeId] [int] NULL
	)
ELSE
	TRUNCATE TABLE [DAILY_QAPrices191].[dbo].[ProductsTest]


if not exists (select * from [DAILY_QAPrices191].[dbo].sysobjects where name='PricesTest' and xtype='U')
CREATE TABLE [DAILY_QAPrices191].[dbo].[PricesTest](
	[TradeDate] [datetime] NOT NULL,
	[ProdId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[Value] [float] NULL,
	[SourceId] [int] NOT NULL,
	[TimeStamp] [datetime] NULL,
	[CurrencyId] [int] NOT NULL
	)
ELSE
	TRUNCATE TABLE [DAILY_QAPrices191].[dbo].[PricesTest]



if not exists (select * from [DAILY_QAPrices191].[dbo].sysobjects where name='ProductCodesTest' and xtype='U')
CREATE TABLE [DAILY_QAPrices191].[dbo].[ProductCodesTest](
	[ProductId] [int] NOT NULL,
	[ProductCodeTypeId] [int] NOT NULL,
	[Code] [varchar](255) NOT NULL)
ELSE
	TRUNCATE TABLE [DAILY_QAPrices191].[dbo].[ProductCodesTest]





INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (1, 'GoO NO BM - 2020', 4, NULL, NULL, NULL, NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 3, NULL, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (2, 'AAA', 4, NULL, NULL, NULL, NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 3, NULL, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (3, 'GoO NO BM - 2020', 5, NULL, NULL, NULL, NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 3, NULL, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (4, 'GoO NO BM - 2020', 4, '2019-02-21 13:22:53.623', NULL, NULL, NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 3, NULL, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (5, 'GoO NO BM - 2020', 4, NULL, '2019-02-21 13:22:53.623', NULL, NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 3, NULL, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (6, 'GoO NO BM - 2020', 4, NULL, NULL, '2019-02-21 13:22:53.623', NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 3, NULL, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (7, 'GoO NO BM - 2020', 4, NULL, NULL, NULL, 123, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 3, NULL, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (8, 'GoO NO BM - 2020', 4, NULL, NULL, NULL, NULL, 8, 11, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 3, NULL, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (9, 'GoO NO BM - 2020', 4, NULL, NULL, NULL, NULL, 68, 10, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 3, NULL, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (10, 'GoO NO BM - 2020', 4, NULL, NULL, NULL, NULL, 68, 11, 2, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 3, NULL, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (11, 'GoO NO BM - 2020', 4, NULL, NULL, NULL, NULL, 68, 11, 1, '2019-03-21 13:22:53.623', 10, 273, NULL, NULL, 3, NULL, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (12, 'GoO NO BM - 2020', 4, NULL, NULL, NULL, NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 11, 273, NULL, NULL, 3, NULL, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (13, 'GoO NO BM - 2020', 4, NULL, NULL, NULL, NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 274, NULL, NULL, 3, NULL, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (14, 'GoO NO BM - 2020', 4, NULL, NULL, NULL, NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 273, 1, NULL, 3, NULL, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (15, 'GoO NO BM - 2020', 4, NULL, NULL, NULL, NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, '2019-02-21 13:22:53.623', 3, NULL, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (16, 'GoO NO BM - 2020', 4, NULL, NULL, NULL, NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 2, NULL, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (17, 'GoO NO BM - 2020', 4, NULL, NULL, NULL, NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 3, 1, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (18, 'GoO NO BM - 2020', 4, NULL, NULL, NULL, NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 3, NULL, 15, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (19, 'GoO NO BM - 2020', 4, NULL, NULL, NULL, NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 3, NULL, 14, 1, 343, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (20, 'GoO NO BM - 2020', 4, NULL, NULL, NULL, NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 3, NULL, 14, NULL, NULL, 1, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (21, 'GoO NO BM - 2020', 4, NULL, NULL, NULL, NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 3, NULL, 14, NULL, NULL, NULL, 14)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (22, 'GoO NO BM - 2020', 4, NULL, NULL, NULL, NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 3, NULL, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (23, 'AAA', 4, NULL, NULL, NULL, NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 3, NULL, 14, NULL, NULL, NULL, NULL)
INSERT INTO [DAILY_QAPrices191].[dbo].ProductsTest (ProdId, ProdName, TypeId, LastTradeDate, FromDate, ToDate, Hours, SourceId, CommodityId, PriceUnitId, TimeStamp, ExecutionVenueId, AreaId, LoadTypeId, FirstTradeDate, DeliveryTypeId, CfdBaseAreaId, ProductVenueId, IsCall, Strike, FutureTypeId, PublishingPeriodTypeId) VALUES (24, 'GoO NO BM - 2020', 4, NULL, NULL, NULL, NULL, 68, 11, 1, '2019-02-21 13:22:53.623', 10, 273, NULL, NULL, 3, NULL, 14, NULL, NULL, NULL, NULL)





INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 1, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 1, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 1, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 1, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 2, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 2, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 2, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 2, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 3, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 3, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 3, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 3, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 4, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 4, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 4, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 4, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 5, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 5, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 5, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 5, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 6, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 6, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 6, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 6, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 7, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 7, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 7, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 7, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 8, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 8, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 8, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 8, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 9, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 9, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 9, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 9, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 10, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 10, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 10, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 10, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 11, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 11, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 11, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 11, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 12, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 12, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 12, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 12, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 13, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 13, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 13, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 13, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 14, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 14, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 14, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 14, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 15, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 15, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 15, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 15, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 16, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 16, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 16, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 16, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 17, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 17, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 17, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 17, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 18, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 18, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 18, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 18, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 19, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 19, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 19, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 19, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 20, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 20, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 20, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 20, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 21, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 21, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 21, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 21, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 22, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-01 00:00:00.000', 22, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 22, 3, 1.475, 68, '2019-02-21 13:22:53.890', 4)
INSERT INTO [DAILY_QAPrices191].[dbo].PricesTest (TradeDate, ProdId, TypeId, Value, SourceId, TimeStamp, CurrencyId) VALUES ('2019-02-02 00:00:00.000', 22, 2, 12.3, 68, '2019-02-21 13:22:53.890', 4)
