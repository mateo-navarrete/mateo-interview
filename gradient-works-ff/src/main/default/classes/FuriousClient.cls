public class FuriousClient {
public class Client {
    public String baseEndpoint;
    public Client() {
        this.baseEndpoint = 'https://api.gradientworks.dev/ff';
    }

    private HttpRequest buildRequest(String endpoint) {
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint(endpoint);
        return req;
    }

    public Map<String, Object> getMovies() {
        Map<String,Object> response = new Map<String,Object>();
        String endpoint = this.baseEndpoint + '/movies';
        HttpRequest req = this.buildRequest(endpoint);

        try {
            HttpResponse res = new Http().send(req);
            String resBody = res.getBody();
            response = (Map<String,Object>) JSON.deserializeUntyped(resBody);

        } catch (Exception e) {
            throw e;
        }


        return response;
    } }
}