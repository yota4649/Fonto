xquery version "1.0-ml"; 
 
import module namespace rest="http://marklogic.com/appservices/rest"
      at "/MarkLogic/appservices/utils/rest.xqy";

declare default function namespace "http://www.w3.org/2005/xpath-functions";

declare option xdmp:mapping "false";

let $options :=
    <rest:options>
      <rest:request uri="^/rest/document" endpoint="getDocument.sjs">
        <rest:http method="GET POST"/>
      </rest:request>
      <rest:request uri="^/rest" endpoint="options.xqy" user-params="allow">
        <rest:uri-param name="__ml_options__">$1</rest:uri-param>
        <rest:http method="OPTIONS"/>
      </rest:request>
    </rest:options>
 
let $rewrite := rest:rewrite($options,("uri","method"))
let $_ := xdmp:log("--------")
let $_ := xdmp:log("REWRITE")
let $_ := xdmp:log($rewrite)
let $_ := xdmp:log("--------")
let $parameters := rest:get-raw-query-params()
let $_ := xdmp:log("--------")
let $_ := xdmp:log("QUERY PARAMETERS")
let $_ := xdmp:log($parameters)
let $_ := xdmp:log("--------")
 
  return
    $rewrite
