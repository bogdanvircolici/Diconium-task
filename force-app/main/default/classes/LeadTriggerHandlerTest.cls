@isTest
public with sharing class LeadTriggerHandlerTest {
    @isTest
    public static void beforeUpdateTest() {

        Country__c c= new Country__c(name = 'United States of America',
                                              alpha2code__c = 'US', 
                                              alpha3code__c = 'USA',
                                              capital__c = 'Washington, D.C.',
                                              region__c = 'Americas');
        insert c;
        Lead l = new Lead(LastName = 'Test Lead',
                          Company = 'SC impord SRL',
                          Country = 'US');
        insert l;
        
        Test.startTest();
        l.Country = 'USA';
        update l;
        Test.stopTest();
        
        Lead leadToTest = [Select Id, Country from Lead where id = :l.Id LIMIT 1 ];
        System.assertEquals('United States of America', leadToTest.Country);
    }
}