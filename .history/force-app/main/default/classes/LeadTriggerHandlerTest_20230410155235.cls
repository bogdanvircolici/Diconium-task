public with sharing class LeadTriggerHandlerTest {
    public static void beforeUpdateTest() {
        Lead l = new Lead(Name = 'Test Lead');
        insert l;
        l.Country = 'USA';
        update l;
        System.assertEquals(l.Country, 'United States of America');
    }
}