public with sharing class LeadTriggerHandler {
    public static void beforeUpdate(Map<Id, Lead> newRecordsMap, Map<Id, Lead> oldRecordsMap){
        for(Lead newLead : newRecordsMap) {
            if (newLead.Country != oldRecordsMap.get(newLead.Id).Country) {
                System.debug('Say yes');
            }
        }
    }
}