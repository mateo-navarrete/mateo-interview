public with sharing class FuriousController {

    @AuraEnabled(Cacheable=true)
    public static List<Map<String,Object>> getAllMovies() {
        List<Map<String,Object>> movies = new List<Map<String,Object>>();
        FuriousClient.Client client = new FuriousClient.Client();
        try {
           Map<String,Object> res = client.getMovies();
            List<Object> allMovies = (List<Object>) res.get('movies');
            for (Object movieInfo:  allMovies) {
                Map<String,Object> movie = (Map<String, Object>) movieInfo;
                String movieRevenue = (String)movie.get('opening_revenue');
                movie.put('opening_revenue', Integer.valueOf(movieRevenue.replaceAll(',','')));
                movies.add(movie);
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        return movies;
    }
}