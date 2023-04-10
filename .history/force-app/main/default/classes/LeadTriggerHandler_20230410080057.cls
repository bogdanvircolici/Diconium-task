public with sharing class LeadTriggerHandler {
    public static void beforeInsertAndUpdate(Map<Id, Lead> newRecordsMap, Map<Id, Lead> oldRecordsMap){
        System.debug('logLevel');
    }
}