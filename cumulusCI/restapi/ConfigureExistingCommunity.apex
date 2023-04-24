/**
* @description - Use REST API to update an existing Community
* @date - 2023-04-24
*/

static final String API_VERSION = 'v57.0';
static final String CMMTY_NAME = 'Test Community';
static final String S_OBJECT = 'Network'; // This could be use with other sobjects

Network currNetwork = [Select Id From Network Where Name = :CMMTY_NAME];

String endpointURL = 
    URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/' + API_VERSION + '/sobjects';

// Update Network Object
String options = 
    '{"OptionsAllowInternalUserLogin":true, "OptionsNicknameDisplayEnabled":false, "Description":\"Brian Test\"}';

HttpRquest req = new HttpRequest();
req.setMethod('PATCH');
req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
req.setHeader('Content-Type', 'application/json;charset=UTF-8');
req.setBody(options);
req.setEndPoint(endpointURL + '/' + S_OBJECT);

Http http = new Http();
HttpResponse responseMember = http.send(req);