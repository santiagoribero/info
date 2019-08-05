--In Management Studio, enable Query --> SQLCMD Mode


:setvar ECMdbname "P11ECM" 
:setvar Pricesdbname "P11Prices"



IF NOT EXISTS ( SELECT 1 FROM $(Pricesdbname).[dbo].InstallShield WHERE ISSchema = '2017.1.1.02' )
BEGIN
	THROW 50001, 'The script cannot run in Prices versions prior to 2017.1.1.02', 1
END

if ('2018.2.1.01' < (SELECT MAX(ISSchema) FROM $(Pricesdbname).[dbo].InstallShield) OR '2019.1.0.03' < (SELECT MAX(ISSchema) FROM $(ECMdbname).[dbo].InstallShield))
BEGIN
	THROW 50001, 'The script was not verified with this version of the database. Please confirm the compatibility with a developer', 1
END



if not exists (select * from $(Pricesdbname).[dbo].sysobjects where name='ELVIZ14213PublishingPeriodTypeIdBkp' and xtype='U')
	CREATE TABLE $(Pricesdbname).[dbo].[ELVIZ14213PublishingPeriodTypeIdBkp](
		[ProdId] [int] NOT NULL,
		[PublishingPeriodTypeId] [int] NULL,
		[NewPublishingPeriodTypeId] [int] NOT NULL,
		[UpdatedAt] [DateTime] NOT NULL
	) ON [PRIMARY]
go



SET XACT_ABORT ON
BEGIN TRY
		BEGIN TRAN

		UPDATE $(Pricesdbname).[dbo].Products
		SET PublishingPeriodTypeId = newPublishingPeriodTypeId.PeriodTypeId
		OUTPUT inserted.ProdId, deleted.PublishingPeriodTypeId, inserted.PublishingPeriodTypeId, GetUTCDate()
		INTO $(Pricesdbname).[dbo].ELVIZ14213PublishingPeriodTypeIdBkp
		FROM 
		(
			select ProdId, MIN(patterns.PeriodTypeId) PeriodTypeId
			FROM $(Pricesdbname).[dbo].Products p
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
				from $(ECMdbname).[dbo].FutureConfiguration fc
				JOIN $(Pricesdbname).[dbo].PeriodTypes pt
				on fc.Period = pt.PeriodTypeName
				JOIN $(ECMdbname).[dbo].Commodities c
				ON fc.CommodityId = c.CommodityId
			) patterns
			on (p.ProdName like patterns.pattern and p.CommodityId = patterns.VizPricesCommodityId)
			where p.TypeId = 3 --UPDATE ONLY Future $(Pricesdbname).[dbo].Products
			and p.PublishingPeriodTypeId IS NULL --UPDATE ONLY $(Pricesdbname).[dbo].Products that don't have a PublishingPeriodTypeId
			group by ProdId
			having count(*) = 1 --UPDATE ONLY if it is clear which one is the PeriodTypeId for the Instrument


		) newPublishingPeriodTypeId
		JOIN $(Pricesdbname).[dbo].Products p
		ON (p.ProdId = newPublishingPeriodTypeId.ProdId)


		COMMIT TRAN
END TRY
BEGIN CATCH
		ROLLBACK
		SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH 