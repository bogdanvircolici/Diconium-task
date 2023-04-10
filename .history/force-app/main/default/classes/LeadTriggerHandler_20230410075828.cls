public with sharing class LeadTriggerHandler {
    public static void beforeInsertAndUpdate(){
        System.debug('logLevel');
    }
}