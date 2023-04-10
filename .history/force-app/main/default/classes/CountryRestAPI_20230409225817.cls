public with sharing class CountryRestAPI {
    public static HttpResponse makeGetCallout() {

        Http http = new Http();
        HttpRequest request = new HttpRequest();
      //request.setEndpoint('http://api.countrylayer.com/v2/all?access_key=5792fa0f19e2371acf2077c9d2d421f5');
        req.setEndpoint('callout:CountryEndpoint');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Received the following animals:');
            for(Object animal: animals) {
                System.debug(animal);
            }
        }
        return response;
    }

    private class Country {
        
        String name;
        String alpha2code;
        String alpha3code;
        String capital;
        String region;
    }
}