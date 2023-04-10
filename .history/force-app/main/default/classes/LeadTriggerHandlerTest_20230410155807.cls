public with sharing class LeadTriggerHandlerTest {
    public static void beforeUpdateTest() {

        Country__c c= new Country__c(name = 'United States of America',
                                              alpha2code__c = 'US', 
                                              alpha3code__c = 'USA',
                                              capital__c = 'Washington, D.C.',
                                              region__c = 'Americas');
        insert c;
        Lead l = new Lead(LastName = 'Test Lead');
        insert l;
        l.Country = 'USA';
        update l;
        System.assertEquals(l.Country, 'United States of America');
    }
}