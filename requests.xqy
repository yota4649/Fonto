xquery version "1.0-ml";
module namespace     requests="http://marklogic.com/appservices/requests";
import module namespace rest = "http://marklogic.com/appservices/rest"
    at "/MarkLogic/appservices/utils/rest.xqy";
declare variable $requests:options as element(rest:options) :=
   <options xmlns="http://marklogic.com/appservices/rest">
      <request uri="^/rest/document" endpoint="endpoint.xqy">
          <uri-param name="documentId">$1</uri-param>
          <uri-param name="includeAdditionalDocuments">false</uri-param>
          <uri-param name="context"></uri-param>
          <http method="GET POST"/>
      </request>
      <request uri="^(.+)$" endpoint="options.xqy" user-params="allow">
          <uri-param name="__ml_options__">$1</uri-param>
          <http method="OPTIONS"/>
      </request>
      <request uri="^/rest/document" endpoint="options.xqy">
          <uri-param name="documentId">$1</uri-param>
          <uri-param name="includeAdditionalDocuments">false</uri-param>
          <uri-param name="context"></uri-param>
          <http method="OPTIONS"/>
      </request>
   </options>;

