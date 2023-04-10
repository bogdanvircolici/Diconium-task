public with sharing class LeadTriggerHandler {
    public static void beforeUpdate(Map<Id, Lead> newRecordsMap, Map<Id, Lead> oldRecordsMap){
        List<Country__c> countries = new List<Country__c>(); 
        for(Lead newLead : newRecordsMap.values()) {
            if (newLead.Country != oldRecordsMap.get(newLead.Id).Country) {
                
            }
        }
    }
}