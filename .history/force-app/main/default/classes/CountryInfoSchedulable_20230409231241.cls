public with sharing class CountryInfoSchedulable implements Schedulable{
    global static void execute(SchedulableContext sc) {
        HttpResponse resp = CountryRestAPI.makeGetCallout();
   }
}