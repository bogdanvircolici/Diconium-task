public with sharing class LeadTriggerHandler {
    public static void beforeUpdate(Map<Id, Lead> newRecordsMap, Map<Id, Lead> oldRecordsMap){

        Set<String> countriesSet = new Set<String>(); 
        
        List<Lead> leadsToUpdateCountry = new List<Lead>();
        for(Lead newLead : newRecordsMap.values()) {
            if (newLead.Country != oldRecordsMap.get(newLead.Id).Country) {
                leadsToUpdateCountry.add(newLead);
                countriesSet.add(newLead.Country);
            }
        }
        
        List<Country__c> countries = [select Id, OwnerId, IsDeleted, Name, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, alpha2Code__c, alpha3Code__c, Capital__c, Region__c from Country__c where Name IN :countriesSet OR alpha2Code__c IN :countriesSet OR alpha3Code__c IN :countriesSet];
        
        for(Country__c countryRecord : countries) {
            for (Lead leadRecord : leadsToUpdateCountry) {
                if(leadRecord.Country != null && (leadRecord.Country.equals(countryRecord.name) || leadRecord.Country.equals(countryRecord.alpha3Code__c) || leadRecord.Country.equals(countryRecord.alpha2Code__c)) {
                    Lead.Country = countryRecord.name;
                    Lead.alpha2Code__c = countryRecord.alpha2Code__c;
                    Lead.alpha2Code__c = countryRecord.alpha3Code__c;
                    Lead.region__c = countryRecord.region__c;
                    Lead.capital__c = countryRecord.capital__c;
                }
            }
        }
    }
}