require "http/client"

headers = HTTP::Headers.new

headers["Accept-Encoding"] = "application/json"
headers["Content-Type"] = "application/json"
headers["WM_SVC.NAME"] = "order-service"
headers["WM_SVC.ENV"] = "stg"
headers["WM_SVC.VERSION"] = "2.0.0"
headers["WM_QOS.CORRELATION_ID"] = "84240cda-c522-4353-b0b8-b9ab3968b64e"
headers["WM_CONSUMER.ID"] = "da55d307-2db9-4336-aaa8-de2372d0b326"

#response = HTTP::Client.get("http://ultra-esb.stg0.esb.platform.glb.prod.walmart.com/service/order-service/v2/orders?groupOrderNo=1460347928265&response_groups=orderlookup.COMPLETE", headers: headers, body: nil)
#puts response.body

string = "Stringifying..."

puts `echo #{string}`
