--select top 1 * from VendorSku
--select top 1 * from [cdvn].Vendor
--select top 1 * from [cdvn].Employee
--select top 1 * from [cdvn].Customer
--select top 1 * from [cdvn].BaseProduct
--select top 1 * from [cdvn].MarketPurchase 
--select top 1 * from [cdvn].OrderProductVariant
--select top 1 * from [cdvn].ProductVariantSellingPrice
--select top 1 * from [cdvn].ProductVariant
--select top 1 * from [cdvn].[Order]


select  CONVERT(DATE, cpvsp.SetOn AT TIME ZONE 'Bangladesh Standard Time') [PriceSetDate],
        cpv.Id [PVID],
		cpv.NameEnglish [Product],
		cpvsp.Price [CostPrice],
		ce.ChaldalBadgeId [CDBD],
		ce.ChaldalUserName [Name],
		ce.ChaldalDesignation [Designation]

from [cdvn].ProductVariant cpv
join [cdvn].ProductVariantSellingPrice cpvsp on cpv.Id = cpvsp.ProductVariantId 
left join [cdvn].Employee ce on ce.UserId  = cpvsp.SetBy
left join VendorSku vs on cpv.Id = vs.Sku
left join ProductVariant pv on pv.Id = vs.ProductVariantId 

where cpv.Id in (37)
and cpvsp.Price = 235

group by CONVERT(DATE, cpvsp.SetOn AT TIME ZONE 'Bangladesh Standard Time') ,
        cpv.Id ,
		cpv.NameEnglish ,
		cpvsp.Price ,
		ce.ChaldalBadgeId ,
		ce.ChaldalUserName ,
		ce.ChaldalDesignation 


--===========================================================================================================
-----Calculation Part
--===========================================================================================================

select SUBSTRING(ce.ChaldalBadgeId, PATINDEX ('%[0-9]%', ce.ChaldalBadgeId ), LEN (ce.ChaldalBadgeId)) CDBD
from [cdvn].Employee ce 


select *
from [cdvn].ProductVariant cpv
where cpv.Id in (37)


select top 1 * 
from [cdvn].BaseProduct cbp
where cbp.id in (217)


select *
from [cdvn].ProductVariant cpv
where cpv.BaseProductId in (217)


select * 
from [cdvn].ProductVariantSellingPrice cpvsp
left join [cdvn].Employee ce on ce.UserId  = cpvsp.SetBy
where cpvsp.ProductVariantId in (37)
