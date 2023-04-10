public with sharing class CountryRestAPI {
    public static List<Country__c> makeGetAllCallout() {

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        List<Country__c> countriesResponseList = new List<Country__c>();
        //Plain text only for test purpose. For prod, named credentials can be used.
        request.setEndpoint('http://api.countrylayer.com/v2/all?access_key=5792fa0f19e2371acf2077c9d2d421f5');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            List<Country> countries = (List<Country>) JSON.deserialize(response.getBody(), List<Country>.class);

            if(checkForAnyUpdate(JSON.serialize(countries, false))) {
                System.debug('Get Here');
                for(Country country: countries) {
                    countriesResponseList.add(new Country__c(name = country.name,
                                              alpha2code__c = country.alpha2code, 
                                              alpha3code__c = country.alpha3code,
                                              capital__c = country.capital,
                                              region__c = country.region));
                }
            }
        }
        return countriesResponseList;
    }
    
    public static Boolean checkForAnyUpdate(String responseBody) {

        List<Country__c> existingRecords = [Select Name, alpha2code__c, alpha3code__c, capital__c, region__c from Country__c order by Name];
        if (existingRecords == null || existingRecords.isEmpty() == true) {
            return true;
        }
        List<Country> countryListToCompare = new List<Country>();
        
        for(Country__c dbCountry : existingRecords) {
            Country jsonCountry = new Country();
            jsonCountry.name = dbCountry.name;
            jsonCountry.alpha2code = dbCountry.alpha2code__c;
            jsonCountry.alpha3code = dbCountry.alpha3code__c;
            jsonCountry.capital = dbCountry.capital__c;
            jsonCountry.region = dbCountry.region__c;
            countryListToCompare.add(jsonCountry);
        }
        String dbJson = JSON.serialize(countryListToCompare, false);
        return dbJson.equals(responseBody);
    }
    //regionalBlocs is not available for trail version of this API
    private class Country {
        String name;
        String alpha2code;
        String alpha3code;
        String capital;
        String region;
    }
}