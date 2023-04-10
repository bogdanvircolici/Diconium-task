trigger LeadTrigger on Lead (before insert, before update) {

    if (Trigger.isBefore) {
        LeadTriggerHandler.beforeUpdate(Trigger.newMap, Trigger.oldMap);
    }
}