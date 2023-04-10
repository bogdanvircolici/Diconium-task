trigger LeadTrigger on Lead (before insert, before update) {

    if (Trigger.isBefore) {
        LeadTriggerHandler.beforedUpdate(Trigger.newMap, Trigger.oldMap);
    }
}