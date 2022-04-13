/**
 * @description       : client for connecting the frontend Movies LWC to the backend FastAndFuriousController
 * @author            : mateo navarrete
 * @group             : interviewees
 * @last modified on  : 04-12-2022
 * @last modified by  : mateo navarrete
**/
public class FastAndFuriousClient {

    private static string openingRevenue = '';
    private static Map<string, object> movie;
    private static Map<string, object> response;
    private static List<Map<string, object>> results;

    static {
        movie = new Map<string, object>();
        response = new Map<string, object>();
        results = new List<Map<string, object>>();
    }
    
    @AuraEnabled(cacheable=true)
    public static List<Map<string, object>> getMovies(){
        try {
            response = FastAndFuriousController.getMappedResponse('movies');
            results = formatResponse();
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return results;
    }

    private static List<Map<string, object>> formatResponse(){
        List<object> movies = (List<object>)response.get('movies');        
        for (object m: movies){
            formatOpeningRevenue(m);
            results.add(movie);
        }
        return results;
    }

    private static void formatOpeningRevenue(object m){
        movie = (Map<string, object>)m;
        if (movie.containsKey('opening_revenue')){
            openingRevenue = (string)movie.get('opening_revenue');
            openingRevenue = openingRevenue.replaceAll(',', '');
            movie.put('opening_revenue', openingRevenue);
        }
    }

}
