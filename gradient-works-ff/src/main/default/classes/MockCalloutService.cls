/**
 * @description       : test class for mocking response data
 * @author            : mateo navarrete
 * @group             : interviewees
 * @last modified on  : 04-12-2022
 * @last modified by  : mateo navarrete
**/
@isTest
global class MockCalloutService implements HttpCalloutMock {
        
    global HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"movies":[{"id": 1,"title": "The Fast and the Furious","release_date": "2001-06-22T00:00:00Z","opening_revenue": "40,089,015"}]}');
        res.setStatusCode(200);
        return res;
    }
}
