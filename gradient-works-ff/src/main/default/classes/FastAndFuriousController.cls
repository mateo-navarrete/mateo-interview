/**
 * @description       : callout service for retrieving data from the ff api
 * @author            : mateo navarrete
 * @group             : interviewees
 * @last modified on  : 04-12-2022
 * @last modified by  : mateo navarrete
**/
public class FastAndFuriousController {

    private static string suffix = '';


    private static HttpRequest initCallout(){
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://api.gradientworks.dev/ff/' + suffix);
        return req;
    }

    private static HttpResponse handleCallout(){
        HttpResponse res = new HttpResponse();
        HttpRequest request = initCallout();
        res = new Http().send(request);
        return res;
    }

    @AuraEnabled(cacheable=true)
    public static Map<string, object> getMappedResponse(string destination){
        Map<string, object> resMap = new Map<string, object>();
        suffix = destination;

        try {
            HttpResponse res = handleCallout();
            string resBody = res.getBody();
            resMap = (Map<string, object>)JSON.deserializeUntyped(resBody);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return resMap;
    } 

}
