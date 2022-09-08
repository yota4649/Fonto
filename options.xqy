xquery version "1.0-ml";
import module namespace rest="http://marklogic.com/appservices/rest" at "/MarkLogic/appservices/utils/rest.xqy";
import module namespace requests = "http://marklogic.com/appservices/requests" at "requests.xqy";

(: Process requests to be handled by this endpoint module. :)
let $_ := xdmp:log("OPTIONS.XQY")

let $request := $requests:options/rest:request[@endpoint = "options.xqy"][1]
(: Get parameter/value map from request. :)
let $params  := rest:process-request($request)
let $uri     := map:get($params, "__ml_options__")
let $accept  := xdmp:get-request-header("Accept")
let $params  := map:map()
(: Get request element that matches the specified URL. :)

(:
let $request := rest:matching-request($requests:options, $uri, "GET", $accept, $params)
:)
let $request := rest:matching-request($requests:options)
let $_ := xdmp:log("$REQUEST")
let $_ := xdmp:log($request)

let $_ := xdmp:log("$REQUESTS:OPTIONS")
let $_ := xdmp:log($requests:options)

return
  if ($uri = "/document")
  then
    let $_ := xdmp:add-response-header("Access-Control-Allow-Origin", "*")
    return $requests:options
  else
    $request








(:
let $_ := xdmp:log("OPTIONS.XQY")
let $_ := xdmp:log("------------")
let $_ := xdmp:log("REQUEST:OPTIONS")
let $_ := xdmp:log($requests:options)
let $_ := xdmp:log("------------")
let $request := $requests:options/rest:request[@endpoint = "options.xqy"][1]
let $_ := xdmp:log("------------")
let $_ := xdmp:log("REQUEST")
let $_ := xdmp:log($request)
let $_ := xdmp:log("------------")
let $map  := rest:process-request($request) 
let $_ := xdmp:log("------------")
let $_ := xdmp:log("MAP")
let $_ := xdmp:log($map)
let $_ := xdmp:log("------------")
let $docUri := map:get($map, "documentId") 
let $context := map:get($map, "context") 
let $includeAdditionalDoc := map:get($map, "includeAdditionalDocuments") 
let $_ := xdmp:log("------------")
let $_ := xdmp:log("$DocUri")
let $_ := xdmp:log($docUri)
let $_ := xdmp:log("$includeAdditionalDocument")
let $_ := xdmp:log($includeAdditionalDoc)
let $_ := xdmp:log("$context")
let $_ := xdmp:log($context)
let $_ := xdmp:log("------------")
return
  fn:doc($docUri)
:)
