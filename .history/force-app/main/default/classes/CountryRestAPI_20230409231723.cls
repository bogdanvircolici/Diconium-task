public with sharing class CountryRestAPI {
    public static HttpResponse makeGetAllCallout() {

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        List<Country__c> countries = new List<Country__c>();
        //Plain text only for test purpose. For prod, named credentials can be used.
        request.setEndpoint('http://api.countrylayer.com/v2/all?access_key=5792fa0f19e2371acf2077c9d2d421f5');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            List<Country> countries = (List<Country>) JSON.deserialize(response.getBody(), List<Country>.class);
            
            for(Country country: countries) {
                System.debug(country);
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