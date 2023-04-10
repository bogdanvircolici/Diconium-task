public with sharing class CountryInfoSchedulable implements Schedulable{
    public void execute(SchedulableContext sc) {
        updateCountriesInformation();
   }
   @future(callout = true)
    private void updateCountriesInformation() {
        List<Country__c> countries = CountryRestAPI.makeGetAllCallout();
        if(countries != null && !countries.isEmpty()) {
            upsert countries name;
        }
   }
}