public with sharing class CountryInfoSchedulable implements Schedulable{
    public void execute(SchedulableContext sc) {
        HttpResponse resp = CountryRestAPI.makeGetCallout();
   }
}