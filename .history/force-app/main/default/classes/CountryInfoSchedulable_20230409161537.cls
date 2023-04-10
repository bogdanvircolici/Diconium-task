public with sharing class CountryInfoSchedulable implements Schedulable{
    global void execute(SchedulableContext sc) {
      Batchable b = new Batchable(); 
      Database.executeBatch(b);
   }
}