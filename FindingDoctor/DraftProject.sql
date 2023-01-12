--dwcFactUHC was given by insurance company in form of a pdf.
--dwcFactNPI was pulled from https://npiregistry.cms.hhs.gov/search
--00. Get initial count of providers

Select
[Providers] = count(*)
FROM [Main_DW].[dbo].[dwcFactUHC] (nolock) UHC

--Starting with 265 providers 

--01. Find all providers that can be match 1-for-1 on NPI database based on first name, last name, and in the state of Tennessee.

Select
	main.[ProviderName]
	,main.[UHC ID]
	,[ProviderCounter]  = sum(main.[SumVal])
Into #TempProvider
From (
	SELECT 
		[ProviderName] = UHC.[ProviderLastName] + ', ' + UHC.[ProviderFirstName]
		,UHC.[UHC ID]
		,[SumVal] = 
			case 
				when NPI.[NPI] is null
					then 0
				else 1
			end
	FROM [Main_DW].[dbo].[dwcFactUHC] (nolock) UHC
	Left Join [Main_DW].[dbo].[dwcFactNPI] (nolock) NPI
		on UHC.[ProviderFirstName] = NPI.[Provider First Name]
		and UHC.[ProviderLastName] = NPI.[Provider Last Name]
		and (NPI.[Provider Business Mailing Address State Name] = 'TN'
			or NPI.[Provider Business Practice Location Address State Name] = 'TN')
		) main
Group By
	main.[ProviderName]
	,main.[UHC ID]

Select [RemainingProviders] = count(*)
from #TempProvider main
Where main.[ProviderCounter] = 1

--There were 218 providers that matched the 1-to-1 criteria


--02. Narrow down providers to:
--a) only Nashville
--b) 1-to-1 match
--c)with facility name listed by insurance company

SELECT
	UHC.*
into #TempInsFac
FROM [Main_DW].[dbo].[dwcFactUHC] (nolock) UHC
Where UHC.[City] = 'Nashville'					--a
and UHC.[UHC ID] in								--b
	(
		Select
			[UHC ID]
		From #TempProvider tempProv
		Where tempProv.[ProviderCounter] = 1
	)
and UHC.[FacilityName] is not null				--c

Select [RemainingProviders] = count(*)
from #TempInsFac

--There were 71 providers that matched these three criteria

--03. Match addresses given by insurance company to NPI database addresses
--Used both [Provider First Line Business Mailing Address] and [Provider First Line Business Practice Location Address] to be safe.

SELECT
	main.*
	,NPI.[Provider First Line Business Mailing Address]
	,NPI.[Provider First Line Business Practice Location Address]
Into #TempFinal
FROM #TempInsFac main
Left Join [Main_DW].[dbo].[dwcFactNPI] (nolock) NPI
	on main.[ProviderFirstName] = NPI.[Provider First Name]
	and main.[ProviderLastName] = NPI.[Provider Last Name]
	and (NPI.[Provider Business Mailing Address State Name] = 'TN'
		or NPI.[Provider Business Practice Location Address State Name] = 'TN')
Where main.[Address] = NPI.[Provider First Line Business Mailing Address] 
	or main.[Address] = NPI.[Provider First Line Business Practice Location Address]

select
[RemainingProviders] = count(*)
from #TempFinal

--There were 26 providers the final criteria

Select
*
From #TempFinal
Order By 1