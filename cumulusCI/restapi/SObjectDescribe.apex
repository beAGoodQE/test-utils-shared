/**
* @description - Use REST API Describe endpoint to return Field and other Metadata for an SObject
* @date - 2023-04-24
*/

static final String API_VERSION = 'v57.0';
static final String S_OBJECT = 'Network'; // This could be use with other sobjects

String endpointURL = 
    URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/' + API_VERSION + '/sobjects';

HttpRquest req = new HttpRequest();
req.setMethod('GET');
req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
req.setHeader('Content-Type', 'application/json;charset=UTF-8');
req.setEndPoint(endpointURL + '/' + S_OBJECT + '/describe');

Http http = new Http();
HttpResponse responseMember = http.send(req);
System.debug(response.getBody());