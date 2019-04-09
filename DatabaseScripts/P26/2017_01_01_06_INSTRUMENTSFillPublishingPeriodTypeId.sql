IF NOT EXISTS ( SELECT 1 FROM [P26ECM].[dbo].InstallShield WHERE ISSchema = '2017.1.1.06' )
BEGIN
	THROW 50001, 'The script cannot run in ECM versions prior to 2017.1.1.06', 1
END

if ('2018.2.1.01' < (SELECT MAX(ISSchema) FROM [P26Prices].[dbo].InstallShield) OR '2019.1.0.03' < (SELECT MAX(ISSchema) FROM [P26ECM].[dbo].InstallShield))
BEGIN
	THROW 50001, 'The script was not verified with this version of the database. Please confirm the compatibility with a developer', 1
END


if not exists (select * from [P26ECM].[dbo].sysobjects where name='ELVIZ14213PublishingPeriodTypeIdBkp' and xtype='U')
	CREATE TABLE [P26ECM].[dbo].[ELVIZ14213PublishingPeriodTypeIdBkp](
		[InstrumentId] [int] NOT NULL,
		[PublishingPeriodTypeId] [int] NULL,
		[NewPublishingPeriodTypeId] [int] NOT NULL,
		[UpdatedAt] [DateTime] NOT NULL
	) ON [PRIMARY]
go



SET XACT_ABORT ON
BEGIN TRY

		BEGIN TRAN

		UPDATE [P26ECM].[dbo].Instruments
		SET PublishingPeriodTypeId = newPublishingPeriodTypeId.PeriodTypeId
		OUTPUT inserted.InstrumentId, deleted.PublishingPeriodTypeId, inserted.PublishingPeriodTypeId, GetUTCDate()
		INTO [P26ECM].[dbo].ELVIZ14213PublishingPeriodTypeIdBkp
		FROM 
		(
			select InstrumentId, MIN(patterns.PeriodTypeId) PeriodTypeId
			FROM [P26ECM].[dbo].Instruments i
			JOIN
			(
				select distinct pt.PeriodTypeId, fc.CommodityId, 
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
				from [P26ECM].[dbo].FutureConfiguration fc
				JOIN [P26ECM].[dbo].PeriodTypes pt
				on pt.Name = CASE fc.Period
					WHEN 'Unknown' THEN NULL
					WHEN 'WeekEnd' THEN NULL
					WHEN 'WorkDayWeek' THEN NULL
					WHEN 'WorkDay' THEN 'Day'
					WHEN 'CoalMonth' THEN 'Month'
					ELSE fc.Period
					END
			) patterns
			on (i.InstrumentName like patterns.pattern and i.CommodityId = patterns.CommodityId)
			where i.InstrumentTypeId = 2 --UPDATE ONLY Future Instruments
			and i.PublishingPeriodTypeId IS NULL --UPDATE ONLY Instruments that don't have a PublishingPeriodTypeId
			group by InstrumentId
			having count(*) = 1 --UPDATE ONLY if it is clear which one is the PeriodTypeId for the Instrument
		) newPublishingPeriodTypeId
		JOIN [P26ECM].[dbo].Instruments i
		ON (i.InstrumentId = newPublishingPeriodTypeId.InstrumentId)

		COMMIT TRAN
END TRY
BEGIN CATCH
		ROLLBACK
END CATCH 