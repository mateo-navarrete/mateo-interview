/**
 * @description       : 
 * @author            : mateo navarrete
 * @group             : 
 * @last modified on  : 04-12-2022
 * @last modified by  : mateo navarrete
**/
public class FastAndFuriousController {

    private static HttpRequest initCallout(){
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://api.gradientworks.dev/ff/movies');
        return req;
    }

    private static HttpResponse handleCallout(){
        HttpResponse res = new HttpResponse();
        HttpRequest request = initCallout();
        res = new Http().send(request);
        return res;
    }

    @AuraEnabled(cacheable=true)
    public static Map<string, object> getMappedResponse(){
        Map<string, object> resMap = new Map<string, object>();

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
