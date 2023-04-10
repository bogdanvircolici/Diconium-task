@isTest
public with sharing class CountryInfoSchedulableTest {
    @isTest
    public static void testExecute() {
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new CountryRestAPITestMock());
        CountryInfoSchedulable sch = new CountryInfoSchedulable();
        String chron = '0 0 23 * * ?';   
        System.schedule('CountryInfoSchedulable' +System.now(), chron, sch);
        Test.stopTest();
    }
}