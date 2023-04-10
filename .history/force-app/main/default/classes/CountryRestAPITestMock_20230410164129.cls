@isTest
global with sharing class CountryRestAPITestMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"name": "United States of America","topLevelDomain": [".us"],"alpha2Code": "US","alpha3Code": "USA","callingCodes": [],"capital": "Washington, D.C.","altSpellings": ["US","USA","United States of America"],"region": "Americas"}');
        res.setStatusCode(200);
        return res;
    }