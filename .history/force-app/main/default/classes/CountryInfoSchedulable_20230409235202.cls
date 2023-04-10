public with sharing class CountryInfoSchedulable implements Schedulable{
    public void execute(SchedulableContext sc) {
        List<Country__c> countries = CountryRestAPI.makeGetAllCallout();
        updateCountriesInformation(countries);
   }
   
    private void updateCountriesInformation(List<Country__c> countries) {
        List<Country__c> existingRecords = [Select Name, alpha2code__c, alpha3code__c, capital__c, region__c from Country__c];

        upsert countries name;
   }
}