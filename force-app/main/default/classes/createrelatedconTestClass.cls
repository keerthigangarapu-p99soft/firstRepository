@istest
public class createrelatedconTestClass {
    @istest
    public static void updatedclosedlost(){
        list<Account> acclist = new list<Account>();
        for(integer i =1;i<5;i++){
            Account a= new Account(); 
            a.Name='testaccount'+i;
            a.Active__c='yes';
            acclist.add(a);
                
        }
        test.startTest();
        insert acclist;
        list<opportunity> oplist = new list<opportunity>();
        
        for(Account a:acclist){
            opportunity op = new opportunity();
            op.name='testopportiu';
            op.stagename='prospecting';
            op.closedate= system.today();
            op.accountid=a.id;
            oplist.add(op);
        }
        insert oplist;
        for(account a:acclist)
        {
            a.Active__c='no';
        }
        update acclist;
       
        list<opportunity> upop= [select id,stagename from opportunity where id =:oplist[0].id ];
        system.assertEquals('Closed Lost', upop[0].stagename);
    }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    @istest
    public static void createtaskbasedonstage()
    {
        list<opportunity> oplist = new  list<opportunity>();
        for(integer i=1;i<5;i++){
            opportunity o= new opportunity();
            o.Name='testopp';
            o.StageName='prospecting';
            o.CloseDate=system.today();
            oplist.add(o);
                
        }
        test.startTest();
        insert oplist;
         test.stopTest();
        for(opportunity opp:oplist)
        {
           opp.StageName='value proposition';
            
            
        }
        update oplist;
        //test.stopTest();
        list<task> updatask=[select id from task where whatid=:oplist[0].id];
        system.assertEquals(1, updatask.size());
            
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @istest
    public static void updatrelconmailingaddress(){
        list<Account> acclist = new list<Account>();
        list<Contact> conlist= new list<Contact>();
        for (integer i=1;i<5;i++)
        {
            Account a = new Account();
            a.Name='accountTest'+i;
            a.BillingCity='testcity';
            a.BillingCountry='testcountry';
            acclist.add(a);
        }
        test.startTest();
        insert acclist;
        for (Account a:acclist)
        {
            contact c= new contact(lastname=a.Name);
           c.AccountId=a.Id;
            conlist.add(c);
    }
        insert conlist;
        for(Account a:acclist)
        {
            a.BillingCity='hyderabad';
        }
        update acclist;
        test.stopTest();
        list<contact> upcon= [select id, mailingcity from contact where id=:conlist[0].id];
        system.assertEquals('hyderabad',upcon[0].mailingcity );
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   /* @istest
    public static void updatephonerelatedcon(){
        list<Account> acclist = new list<Account>();
        list<Contact> conlist= new list<Contact>();
        for (integer i=1;i<5;i++)
        {
            Account a = new Account();
            a.Name='accountTest';
            a.phone='3456789056';
            acclist.add(a);
        }
        test.startTest();
        insert acclist;
        for (Account a:acclist)
        {
            contact c= new contact(lastname=a.Name);
           c.AccountId=a.Id;
            conlist.add(c);
        }
        insert conlist;
        for(Account a:acclist)
        {
            a.Phone='987654455';
        }
        update acclist;
        test.stopTest();
        list<contact> updcon = [select id,phone,accountid from contact where id=:conlist[0].id];
        system.assertEquals('987654455', updcon[0].phone);
    }*/
    
    
    
    
    
    
    
    
    
    
    
    
  @istest
    public static void updatedescbasedondesc()
    {
        list<opportunity> op= new list<opportunity>();
        for(integer i=1;i<5;i++)
        {
            opportunity o = new opportunity();
            o.name='testoppor'+i;
            o.CloseDate=system.today();
            o.stagename='prospesting';
            op.add(o);
            
        }
        test.startTest();
        insert op;
        for(opportunity o:op)
        {
            
        }
        test.stopTest();
        list<opportunity> updaop=[select id,description from opportunity where id=:op[0].id];
        system.assertEquals('opportunity is open',  updaop[0].description);
    }
    
    
    
    
    
    
    
    
    
    @istest
    public static void updaterating(){
        list<account> acclist = new List<Account>();
        for(integer i=1;i<=5;i++)
        {
            Account a= new Account();
            a.Name='testaccount'+i;
            a.Industry='media';
            acclist.add(a);
            
        }
        test.startTest();
        insert acclist;
        test.stopTest();

        list<Account> updaacc = [select id,rating from account where id=: acclist[0].id];
        system.assertEquals('Hot', updaacc[0].rating);
    }
    
    
    
    
    
    
    
    
 @istest
    public static void updatephonedescription()
    {
        list<Account> acclist = new List<Account>();
        for(integer i=1;i<=5;i++)
        {
            Account a = new Account();
            a.Name= 'test'+i;
            a.phone='3456789034';
               acclist.add(a); 
        }
        test.startTest();
        insert acclist;
        for(Account acc :acclist)
        {
            acc.phone='3451234567';
        }
        update acclist;
        test.stopTest();
        list<Account> upacc =[select id,phone from Account where id=:acclist[0].id];
        system.assertEquals('3451234567', acclist[0].phone, 'phone is not updated');
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @istest
    public static void updatelatestamount(){
      list<opportunity> op= new list<opportunity>();
        list<Account> acc= new List<Account>();
        for(integer i=1;i<5;i++)
        {
            Account a = new Account();
           a.Name= 'latestacamm'+i; 
            acc.add(a);
        }
         insert acc;
        for(Account al :acc){
            opportunity opp= new opportunity();
            opp.Name=al.name;
           // opp.AccountId=acc.id;
            opp.CloseDate=system.today();
            opp.StageName='prospecting';
            opp.Amount=430330;
            opp.AccountId=al.Id;
             op.add(opp);   
                
        }
        test.startTest();
        insert op;
        test.stopTest();
        
        list<Account> upacc =[select id,latestamount__c from account where Id =: acc[0].id];
        system.assertEquals(430330, upacc[0].latestamount__c);
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 @istest
    public static void latestcasenumber(){
        list<case> caselist = new List<case>();
        list<Account> aclist= new list<account>();
        for(integer i=1;i<5;i++)
        {
            
           Account a= new Account();
            a.name='testacc'+i;
            aclist.add(a);
            
        }
        insert aclist;
        for(Account acc:aclist)
        {
            case c= new case();
            c.AccountId=acc.id;
            c.Status='New';
            c.Origin='Phone';
            caselist.add(c);
            
        }
        test.startTest();
        insert caselist;
        test.stopTest();
        list<Account> a = [select id,latestcasenumber__c from account where id =:aclist[0].id];
        list<case> lc = [select id, casenumber from case where id=:caselist[0].id ];
        system.assertEquals(lc[0].casenumber, a[0].latestcasenumber__c );
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
@istest
    public static void createdconmethod(){
        //// create sample day
        list<account> newlist = new List<Account>();
        for(integer i=1;i<5;i++)
        {
            Account a = new Account();
            a.Name= 'testacc1'+i;
            newlist.add(a);
        }
        ///insert date.
       
        test.startTest();
        insert newlist;
        test.stopTest();
        list<contact> updatedcon =[select id from contact where AccountId=:newlist[0].id];
            System.assert(updatedcon!=null, 'contact is not created');
    }
}