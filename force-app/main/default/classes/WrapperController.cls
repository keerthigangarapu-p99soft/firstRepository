public class WrapperController {
 @AuraEnabled
    public static WrapperSample returnWrapper(){
        WrapperSample ws = new WrapperSample();
        ws.Accounts = new List<Account>([select id,Name,phone,AnnualRevenue,Rating from Account limit 10]);
        ws.Contacts = new List<Contact>([select id,Name,phone,Fax,Title from Contact limit 10]);
        ws.Opportunities = new List<Opportunity>([select id,Name, StageName,Amount from Opportunity limit 10]);
        return ws;
    }
    public class WrapperSample{
        @AuraEnabled
        public List<Account> Accounts;
        @AuraEnabled
        public List<Contact> Contacts;
        @AuraEnabled
        public List<Opportunity> Opportunities;
    }
}