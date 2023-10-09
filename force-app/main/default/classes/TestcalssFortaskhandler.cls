@istest
private class TestcalssFortaskhandler {
 @istest
    private static void testMethode(){
        Account acc = new Account();
        acc.Name = 'A';
        acc.BillingCity = 'hyd';
        acc.BillingCountry = 'IND';
        acc.BillingState = 'ts';
        acc.copyshippingaddress__c = true;
        
        insert acc;
        
         List<Account> lstacc = [select id,BillingCity,BillingCountry,ShippingCountry,ShippingCity from Account where Id =: acc.Id];
         for(Account A : lstacc){
            
            system.assertEquals('hyd', A.BillingCity);
            system.assertEquals('IND', A.BillingCountry);
             system.assertEquals('ts', A.BillingState);
        }
         
           
            
            
            
            
            }
}