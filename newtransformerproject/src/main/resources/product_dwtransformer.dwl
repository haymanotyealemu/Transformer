%dw 1.0
%output application/xml
%var conversionRate=lookup("newtransformerprojectFlow1",inboundProperties.'http.query.params'.country)
%function getconversionRate(price)price*conversionRate
%var getconversionRate=(price)->price*conversionRate
%function getImages(images){
	(
		images map {image: $}
	)
}
---
products: {((
	
 payload map {product: {pname: $.name ++ $$,
	                       pid: $.productId,
	                       offerPrice:getconversionRate ($.offer.offerPrice),
	                       brandName: $.brandName,
	                       images: getImages($.images)
	                       }
	
}
	
) 

	
) 
	
}

	                       
 