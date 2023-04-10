public with sharing class CountryInfoSchedulable implements Schedulable{
    public void execute(SchedulableContext sc) {
        List<Country__c> resp = CountryRestAPI.makeGetAllCallout();
   }
   
   private void updateCountriesInformation(List<Country__c>) {

   }
}