public class taskhandler {
public static void triggerhandler(List<Account> newlist)
{
  
    for(Account A : newlist)
    {
        if(A.copyshippingaddress__c == true){
            
                A.ShippingCity = A.BillingCity;   // A.Target = A.Source
                A.ShippingCountry = A.BillingCountry;
                A.ShippingState = A.BillingState;
           
        }
        
    }
    
}
public static void trigger5(List<account> acc){
        for(account a:acc)
        {
            if(a.Active__c=='Yes')
            {
                a.adderror('cant delete active accounts');
            }
        }
    }
public static void trigger6(List<employee__c> ep)
{
    set<id> emptyep= new set<id>();
    for (employee__c emp:ep)
    {
        emptyep.add(emp.Account__c);
        
    }
    list <Account> ac = new List<Account>();
    
    list<Account> lstacc = [select id,leftEmployees__c,(select id from Employee__r) from Account where id =: emptyep];
    for(Account A : lstacc){
     
       A.leftemployees__c = A.Employee__r.size();
        ac.add(A);
    }
    update ac;
    
} 
public static void trigger7(list<opportunity> opportunities){
          Set<Id> accountIds = new Set<Id>();
        
        for (Opportunity opp : opportunities) {
            if (opp.AccountId != null && opp.Amount != null) {
                accountIds.add(opp.AccountId);
            }
        }
        
        if (!accountIds.isEmpty()) {
            List<Account> accountsToUpdate = new List<Account>();
            
            for (Id accId : accountIds) {
                AggregateResult aggResult = [SELECT SUM(Amount) sumAmount
                                             FROM Opportunity
                                             WHERE AccountId = :accId
                                             AND IsClosed = false
                                             AND Amount != null];
                
                if (aggResult != null) {
                    Decimal totalAmount = (Decimal) aggResult.get('sumAmount');
                    accountsToUpdate.add(new Account(Id = accId, AnnualRevenue = totalAmount));
                }
            }
            
            if (!accountsToUpdate.isEmpty()) {
                update accountsToUpdate;
            }
        }
 
}
  
    
    ///////testclasses................
    public static void triggerAcc(List<Account> newlist)
    {
        for(Account acc:newlist)
        {
            if(acc.industry=='media'||acc.industry=='energy')
            {
                acc.rating='hot';
            }
        }
    }
    ////////////////////////////////////////////////////////////
    public static void opportunityHandler(List<opportunity> newlist){
        for(opportunity op:newlist)
        {
          
            IF(op.Amount!=null && op.Amount>=100000 && op.Amount<=500000)
            {
                op.Description='hot opportunitydescription';
            }
        }
    }
    /////////////////////////////////////////////////////
    public static void createrelatedcon(List<account> newlist){
        list<contact> newcon = new List<contact>();
        for(Account acc:newList)
        {
            Contact c = new Contact();
            c.LastName='testlast'+acc.name;
                c.FirstName='testfirstname';
            c.AccountId=acc.id;
            newcon.add(c);
            
        }
        if(!newcon.isEmpty())
        {
            insert newcon;
        }
    }
    //////////////////////////////
    public static void latestcasenumber(List<case> newcase){
        List<Account> acclist = new List<Account>();
        for(case cs: newcase){
            if(cs.AccountId!=null)
                {
                    Account a= new Account();
                    a.Id=cs.AccountId;
                    a.latestcasenumber__c=cs.CaseNumber;

                        acclist.add(a);
                }
        } 
        if(!acclist.isempty())
        {
            update acclist;
        }
}
    ////////////////////////////
    public static void latestoppAmount(list<opportunity> newopp){
        list<Account> acclist = new List<Account>();
       for(opportunity o:newopp)
       {
          if(o.Amount!=null &&o.AccountId!=null)
          {
              account a= new Account();
              a.Id=o.AccountId;
              a.latestamount__c=o.Amount;
              acclist.add(a);
                  
          }
       }
        if(!acclist.isempty()){
            update acclist;
        }
    }
    
  //  if account phone is updated update phone description...
    public static void updatephoneDescr(List<account> acclist,map<id,account> olmap){
        for(Account acc :acclist)
        {
            if(acc.phone!=olmap.get(acc.id).phone)
            {
                acc.description='phone field is updated/i.e old value :'+olmap.get(acc.id).phone+'new value:'+acc.phone;
            }
        }
    }
    //////copy shipping address to billing address
    public static void copbiltoshipping(list<account> acclist,map<id,Account> oldmap){
        for(Account a:acclist){
            if(oldmap==null&&a.copyshippingaddress__c==true||(a.copyshippingaddress__c==true &&a.copyshippingaddress__c!=oldmap.get(a.id).copyshippingaddress__c)){
                a.ShippingCity=a.BillingCity;
                a.ShippingCountry=a.BillingCountry;
                a.ShippingState=a.BillingState;
            }
        }
    }
    /////////UPON ACCOUNT CREATION OR UPDATION  IF INDUSRY IS MEDIA THEN POPULATE RATING IS HOT....
    public static void popurating(List<Account> acclist,map<id,account> oldmap){
        for(Account a:acclist)
        {
            if((oldmap==null && a.Industry!=null && a.Industry=='media') ||(a.Industry!=null && a.Industry=='media' &&a.Industry!=oldmap.get(a.id).industry))
            {
                a.Rating='hot';
            }
        }
    }
    
    //////upon on creation or insertion on stagename opp desc should be updated
    public static void updateoppdesbasedonstage(list<opportunity> newlist ,map<id,opportunity> oldmap)
    {
        for(opportunity opp:newlist)
        {
            if(oldmap==null||opp.StageName!=oldmap.get(opp.Id).stagename)
            {
                if(opp.StageName=='closed won')
                {
                    opp.Description='opportunity is closed won';
                }
                else if(opp.StageName=='closed lost')
                {
                    opp.Description='opportunity is lost won';
                }
                else
                {
                    opp.Description='opportunity is open';
                }
            }
        }
    }
    
    ////when account phoneis updated then populate account phone number on all related contacts in phone field
    
    public static void updatedrelatedconphonefield(list<account> acclist, map<id, account> oldmap)
    
    {
        map<id,account> accids= new map<id, Account>();
        list<contact> conlist= new list<contact>();
        for(Account a : acclist)
        {
            if(a.phone!=null && a.phone!=oldmap.get(a.id).phone && oldmap!=null){
                accids.put(a.id,a);
            }
        }
        if(accids.size()>0)
        {
            for(contact c: [select id ,phone , accountid from contact where AccountId IN:accids.keyset()])
            {
                if(accids.containskey(c.AccountId))
                {
                    c.Phone=accids.get(c.AccountId).phone;
                    conlist.add(c);
                        
                }
            }
        }
        if(conlist.size()>0)
        {
            update conlist;
        }
    }
    //////////////when account billing address is updated related contact mailing adddress is updated
    public static void updatedrelatedconmailingaddress(list<Account> acclist , map<id,account> oldmap)
    {
       // map<id,account> accids =  new map<id,account>();
       // by using parent to child query
       set<id> setids = new set<id>();
        
        list<contact> conlist = new list<contact>();
        for(Account a:acclist)
        {
            if((a.BillingCity!=oldmap.get(a.id).billingcity )||(a.BillingCountry!=oldmap.get(a.Id).billingcountry) && oldmap!=null)
            {
                //accids.put(a.Id,a);
                setids.add(a.id);
            }
        }
        /*for (contact c:[select id,accountid from contact where accountid IN:accids.keyset()])
        {
            if(accids.containskey(c.AccountId))
            {
                c.MailingCity=accids.get(c.AccountId).billingcity;
                c.MailingCountry=accids.get(c.AccountId).billingcountry;
                conlist.add(c);
            }
        }*/
        ///// writing parent to child query.....onparent
        for(Account a : [select id,billingcity,billingcountry ,(select id from contacts)from account where id IN:setids])
        {
            if(a.contacts!=null)
            {
                for(contact con:a.contacts)
                {
                    con.mailingcity=a.BillingCity;
                    con.mailingcountry=a.BillingCountry;
                    conlist.add(con);
                }
            }
        }
        if(conlist.size()>0)
        {
            update conlist;
        }
    }
    //////////whenever stagename is changed related task should be created..
    public static void createtaskwhenstageischanged(List<opportunity> oplist, Map<id, opportunity> oldmap){
        list<task> tasklist =  new  list<task>();
        for(opportunity o: oplist)
        {
            if(o.StageName!=oldmap.get(o.Id).stagename)
            {
                Task t = new task();
                t.WhatId=o.Id;
                t.Subject='demo';
                t.OwnerId=o.OwnerId;//userinfo.getuserid
                t.Priority='normal';
                t.Status='not started';
                tasklist.add(t);
            }
        }
        if(!tasklist.isempty()){
            insert tasklist;
        }
    }
    
    //Update related Opportunity when Account is updated
    public static void oppclosedlost(list<Account> acclist,map<id,Account> oldmap){
        set<id> accids = new set<id>();
        list<opportunity> opplist= new list<opportunity>();
        for(Account a :acclist){
            if(a.Active__c=='no'&& oldmap.get(a.Id).Active__c=='yes'){
               accids.add(a.Id);
            }
            
        }
        if(!accids.isempty()){
            for(Account acc:[select id ,Active__c,(select id,stagename from opportunities ) from account where id IN :accids])
            {
                if(acc.opportunities!=null)
                {
                    for(opportunity o:acc.opportunities)
                    {
                        if(o.StageName!='closed won'&&o.StageName!='closed lost')
                        {
                            o.StageName='closed lost';
                            opplist.add(o);
                            
                        }
                    }
                }
            }
        }
        if(!opplist.isEmpty()){
            update opplist;
        }
    }
}