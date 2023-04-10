public with sharing class LeadTriggerHandlerTest {
    public static void beforeUpdateTest() {

        Country__ c = new Country__c(name = 'United States of America',
                                              alpha2code__c = 'US', 
                                              alpha3code__c = 'USA',
                                              capital__c = 'Washington, D.C.',
                                              region__c = 'Americas');
        Lead l = new Lead(Name = 'Test Lead');
        insert l;
        l.Country = 'USA';
        update l;
        System.assertEquals(l.Country, 'United States of America');
    }
}