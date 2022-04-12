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

}
