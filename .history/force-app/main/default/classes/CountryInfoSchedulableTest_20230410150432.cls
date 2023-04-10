@isTest
public with sharing class CountryInfoSchedulableTest {
    @isTest
    public static void testExecute() {
        Test.startTest();
        CountryInfoSchedulable sch = new CountryInfoSchedulable();
        System.schedule(sch, null)
        Test.stopTest();
    }
}