@isTest
public with sharing class CountryInfoSchedulableTest {
    @isTest
    public static void testExecute() {
        Test.setMock(HttpCalloutMock.class, new CountryRestAPITestMock());
        Test.startTest();
        CountryInfoSchedulable sch = new CountryInfoSchedulable();
        String chron = '0 0 23 * * ?';   
        System.schedule('CountryInfoSchedulable' +System.now(), chron, sch);
        Test.stopTest();
    }
}