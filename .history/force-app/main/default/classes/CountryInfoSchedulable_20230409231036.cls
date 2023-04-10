public with sharing class CountryInfoSchedulable implements Schedulable{
    global void execute(SchedulableContext sc) {
        HttpResponse resp = CountryRestAPI.makeGetCallout();
   }
}