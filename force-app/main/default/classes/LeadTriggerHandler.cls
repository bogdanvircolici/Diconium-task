public with sharing class LeadTriggerHandler {
    //Once an Lead country standard information is updated, then I take all the informations from my custom object Country__c in order to update all lead informations about country.
    // Example: Update Lead.Country = USA to US. Then the result would be: Lead.country =  United States of America, Lead.capital = Washington, D.C., Etc.
    public static void beforeUpdate(Map<Id, Lead> newRecordsMap, Map<Id, Lead> oldRecordsMap){

        Set<String> countriesSet = new Set<String>(); 
        
        List<Lead> leadsToUpdateCountry = new List<Lead>();
        for(Lead newLead : newRecordsMap.values()) {
            if (newLead.Country != oldRecordsMap?.get(newLead.Id).Country) {
                leadsToUpdateCountry.add(newLead);
                countriesSet.add(newLead.Country);
            }
        }
        
        List<Country__c> countries = [select Id, OwnerId, IsDeleted, Name, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, alpha2Code__c, alpha3Code__c, Capital__c, Region__c from Country__c where Name IN :countriesSet OR alpha2Code__c IN :countriesSet OR alpha3Code__c IN :countriesSet];
        
        for(Country__c countryRecord : countries) {
            for (Lead leadRecord : leadsToUpdateCountry) {
                if(leadRecord.Country != null && (leadRecord.Country.equals(countryRecord.name) || leadRecord.Country.equals(countryRecord.alpha3Code__c) || leadRecord.Country.equals(countryRecord.alpha2Code__c))) {
                    leadRecord.Country = countryRecord.name;
                    leadRecord.Alpha2Code__c = countryRecord.alpha2Code__c;
                    leadRecord.Alpha3Code__c = countryRecord.alpha3Code__c;
                    leadRecord.Region__c = countryRecord.region__c;
                    leadRecord.Capital__c = countryRecord.capital__c;
                }
            }
        }
    }
}