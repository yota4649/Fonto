
const rest = require("/MarkLogic/appservices/utils/rest.xqy");
xdmp.setResponseContentType("application/json");


/*
$result := '{ "documentId": "74257961-EDE3-4180-AF17-0A435EE8FB7B", "content": "<?xml version=\"1.0\" encoding=\"UTF-8\"?><emp:employee xmlns:emp="http://example.org/emp" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://example.org/emp emp.xsd" hireDate="2001-04-02"><number>557</number><status>FT</status></emp:employee>", "lock": { "isLockAcquired": true, "isLockAvailable": true } }'
*/

xdmp.log("PARAMETERS getDocument.sjs");
xdmp.log(rest.getRawQueryParams( ));

var params = rest.getRawQueryParams();
xdmp.log(params.documentId);

var documentId = params.documentId;

//result.content = fn.head(xdmp.unquote("<employee><number>557</number><status>FT</status></employee>"));
//result.content = fn.head(fn.doc("fried-guinea-pig.xml"));
//result.content = fn.head(xdmp.unquote("<?xml version=\"1.0\" encoding=\"UTF-8\"?><employee><number>557</number><status>FT</status></employee>"));

//result.content = fn.head(xdmp.unquote("<?xml version=\"1.0\" encoding=\"UTF-8\"?><emp:employee xmlns:emp=\"http://example.org/emp\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://example.org/emp emp.xsd\"><emp:number>557</emp:number><emp:status>FT</emp:status></emp:employee>"));
//result.content = fn.head(xdmp.unquote("<?xml version=\"1.0\" encoding=\"UTF-8\"?><emp:employee xmlns:emp=\"http://example.org/emp\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" ><emp:number>557</emp:number><emp:status>FT</emp:status></emp:employee>"));



let result = {};
result.documentId = documentId;
result.content = cts.doc(documentId);
result.lock = {};
result.lock.isLockAcquired = true;
result.lock.isLockAvailable = true;

result;
