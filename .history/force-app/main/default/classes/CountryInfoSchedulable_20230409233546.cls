public with sharing class CountryInfoSchedulable implements Schedulable{
    public void execute(SchedulableContext sc) {
        List<Country__c> countries = CountryRestAPI.makeGetAllCallout();
        updateCountriesInformation(countries);
   }
   
   private void updateCountriesInformation(List<Country__c> countries) {
        upsert countries name;
   }
}