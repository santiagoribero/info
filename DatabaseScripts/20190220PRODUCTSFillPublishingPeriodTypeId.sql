IF NOT EXISTS ( SELECT 1 FROM DAILY_QAPrices191.dbo.InstallShield WHERE ISSchema = '2017.1.1.02' )
BEGIN
	THROW 50001, 'The script cannot run in Prices versions prior to 2017.1.1.02', 1
END



if not exists (select * from sysobjects where name='ELVIZ14213PublishingPeriodTypeIdBkp' and xtype='U')
	CREATE TABLE DAILY_QAPrices191.[dbo].[ELVIZ14213PublishingPeriodTypeIdBkp](
		[ProdId] [int] NOT NULL,
		[PublishingPeriodTypeId] [int] NULL,
		[NewPublishingPeriodTypeId] [int] NOT NULL,
		[UpdatedAt] [DateTime] NOT NULL
	) ON [PRIMARY]
go



SET XACT_ABORT ON
BEGIN TRY
		BEGIN TRAN

		UPDATE DAILY_QAPrices191.dbo.Products
		SET PublishingPeriodTypeId = newPublishingPeriodTypeId.PeriodTypeId
		OUTPUT inserted.ProdId, deleted.PublishingPeriodTypeId, inserted.PublishingPeriodTypeId, GetUTCDate()
		INTO DAILY_QAPrices191.[dbo].ELVIZ14213PublishingPeriodTypeIdBkp
		FROM 
		(
			select ProdId, MIN(patterns.PeriodTypeId) PeriodTypeId
			FROM DAILY_QAPrices191.dbo.Products p
			JOIN
			(
				select distinct pt.PeriodTypeId, c.VizPricesCommodityId, 
				REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE( REPLACE(
				DisplayTickerRule, '{Ww}', '[0-9][0-9]'),
					'{yy}', '[0-9][0-9]'),
					'{q}', '[1-4]'),
					'{yyyy}', '[0-9][0-9][0-9][0-9]'),
					'{Mmm}', '[JjFfMmAaSsOoNnDd][AaEePpUuCcOo][NnBbRrYyLlGgPpTtVvCc]'),
					'{Mmm:periodend}', '[JjFfMmAaSsOoNnDd][AaEePpUuCcOo][NnBbRrYyLlGgPpTtVvCc]'),
					'{Mm}', '[01][0-9]'),
					'{dd}', '[0-9][0-9]'),
					'{dd:periodstart}', '[0-9][0-9]'),
					'{y}', '[0-9]') pattern
				from DAILY_QAECM191.dbo.FutureConfiguration fc
				JOIN DAILY_QAPrices191.dbo.PeriodTypes pt
				on fc.Period = pt.PeriodTypeName
				JOIN DAILY_QAECM191.dbo.Commodities c
				ON fc.CommodityId = c.CommodityId
			) patterns
			on (p.ProdName like patterns.pattern and p.CommodityId = patterns.VizPricesCommodityId)
			where p.TypeId = 3 --UPDATE ONLY Future DAILY_QAPrices191.dbo.Products
			and p.PublishingPeriodTypeId IS NULL --UPDATE ONLY DAILY_QAPrices191.dbo.Products that don't have a PublishingPeriodTypeId
			group by ProdId
			having count(*) = 1 --UPDATE ONLY if it is clear which one is the PeriodTypeId for the Instrument


		) newPublishingPeriodTypeId
		JOIN DAILY_QAPrices191.dbo.Products p
		ON (p.ProdId = newPublishingPeriodTypeId.ProdId)


		COMMIT TRAN
END TRY
BEGIN CATCH
		ROLLBACK
		SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH 