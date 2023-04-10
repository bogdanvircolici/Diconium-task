trigger LeadTrigger on Lead (before insert, before update) {

    if (Trigger.isBefore) {
        LeadTriggerHandler.beforeInsertAndUpdate(Trigger.newMap, Trigger.oldMap);
    }
}