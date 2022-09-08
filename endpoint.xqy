xquery version "1.0-ml";
import module namespace rest = "http://marklogic.com/appservices/rest"
    at "/MarkLogic/appservices/utils/rest.xqy";

import module namespace requests =   "http://marklogic.com/appservices/requests" at "requests.xqy";

import module namespace json="http://marklogic.com/xdmp/json" at "/MarkLogic/json/json.xqy";
 
let $config := json:config("full") => map:with("whitespace", "ignore")

let $_ := xdmp:log("ENDPOINT.XQY")
let $_ := xdmp:log("------------")
let $_ := xdmp:log("REQUEST:OPTIONS")
let $_ := xdmp:log($requests:options)
let $_ := xdmp:log("------------")
let $request := $requests:options/rest:request[@endpoint = "endpoint.xqy"][1]
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

let $_ := xdmp:set-response-content-type("application/json")
let $result := '{ "documentId": "74257961-EDE3-4180-AF17-0A435EE8FB7B", "content": "<?xml version=\"1.0\" encoding=\"UTF-8\"?><emp:employee xmlns:emp="http://example.org/emp" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://example.org/emp emp.xsd" hireDate="2001-04-02"><number>557</number><status>FT</status></emp:employee>", "lock": { "isLockAcquired": true, "isLockAvailable": true } }'

let $resultJson := json:transform-to-json( fn:doc($docUri) , $config )
return
  $result
