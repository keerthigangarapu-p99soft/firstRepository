public class performanceTasks {
/*public static void method1()
{
    List <Account> accqu =[ select id ,name ,CreatedDate from Account where CreatedDate = last_n_days:7];
    List<Opportunity> opp= new List<Opportunity>();
    
    for( Account acc: accqu)
    {
        Opportunity op = new Opportunity();
        op.Name= acc.Name;
        op.AccountId=acc.id;
        op.StageName='Prospesting';
        op.CloseDate=system.today();
        
            opp.add(op);
    }
    insert opp;
}
   
   //////TASK2
   public static void task2 (List <Account> accqu)
   {
       accqu =[ select id ,name ,CreatedDate from Account where CreatedDate = last_n_days:7];
       List<Account> eacc= new List<Account>();
        for( Account acc: accqu)
        {
            acc.Phone='1234567800';
            eacc.add(acc);
        }
    update eacc;
   }
    /////TASK 3
    public static void task3(List<opportunity> opp)
    {
         opp = [select id, name ,stagename ,CreatedDate from Opportunity where CreatedDate = last_n_days:7];
        for (Opportunity oppa:opp)
        {
          if(oppa.stagename=='closed won') 
          {
              oppa.Description='Opportunity is Closed Won';
          }
            else if(oppa.StageName =='closed lost')
            {
                oppa.Description='Opportunity is Closed Lost';
            }
        }
    }
   ///TASK 4.....
    public static void task4(LIST<account> acc) {
        acc = [select id,name,(select id,name from contacts) from Account where CreatedDate=Last_N_MONTHS:1];
        for (Account acclp:acc)
        {
            integer count = acclp.contacts.size();
            if(count>0)
            { 
                
          //  acclp.noofcontacts__c = count;
        }


        else{
          //  acclp.noofcontacts__c = 0;
        }
    }
    if(!acc.Isempty()){
        update acc;
    }
        system.debug('accountsToUpdate:::'+acc);
       }
    /////////////..task5....
    public static void  task5()    
    {
    List<contact> con = [select id,lastname,phone, account.id,account.name,account.phone from contact where CreatedDate =last_n_weeks:1];
        for  (Contact cont :con)
        {
            if(cont.phone==null)
            {
                cont.phone=cont.account.phone;
                
            }    
        }
        system.debug(con);
        }
    /////task6 ....
   public static  void task6()
   {
       List<Account> acc = [select name,noofemployee__c ,(select name from employee__r) from Account where createddate=last_n_days:19];
       for(Account var:acc)
       {
           decimal count = var.employee__r.size();
           if(count >0)
           {
               var.noofemployee__c=count;
               system.debug('noofemployeecount:'+count);
           }
           
       }
   }
    /////////TASK7.....
    public static void task7()
    {
      list<employee__c> var = [select name,phone__c,account__r.name,account__r.phone  from employee__c where createddate=last_n_days:7];
        for (employee__c ep:var)
        {
            if(ep.phone__c==null)
            {
                ep.phone__c=ep.account__r.phone;
                system.debug('updated phonenumber:'+ep);
            }
        }
    }
    //////////TASK8.......
    public static void task8(list<Account> var)
    {
      var=[select name,totalsalary__c,(select name,salary__c from employee__r) from account where  createddate=last_n_days:7];
         for (Account acc:var) 
         {
             //AggregateResult ar = [select sum(salary__c) tosal  from employee__c group by Account__r.name];
             system.debug('total salary of account of employees:'+ar);
             acc.totalsalary__c = (decimal)ar.get('tosal');
         } 
       
     list<employee__c> vary= [select name,phone__c,account__r.name,account__r.totalsalary__c  from employee__c where createddate=last_n_days:7];
        for(employee__c acc: vary)
         {
             AggregateResult ar = [select sum(salary__c) tosal  from employee__c group by Account__r.name];
             system.debug('total salary of account of employees:'+ar);
             acc.account__r.totalsalary__c= (decimal)ar.get('tosal');
       
    }
    
    public static void task9()
    {
        list<contact> var=[select lastname,phone ,(select name,phone__c from employee__r) from contact];
        for(contact con :var)
        {
            if(con.phone==null)
            {
                for(employee__c emp: con.employee__r){
                    con.phone=emp.Phone__c;
                }
                system.debug('info'+con);
                
            }
        }
    }*/
    
    
    
    public static void trigger1(list<account> empacc)
    {
        list<account> acc= new list<Account>();
        
        for(Account accc: empacc)
        {
           if(accc.Industry!=null && accc.Industry=='Media')
           {
               accc.Rating='Hot';
           }
            
        }
        
    }   
  /*  public static void trigger2(list<account> var)
    {
        list <opportunity> var1 = new List<opportunity>();
        for (Account acc:var)
        {
            opportunity a= new opportunity();
                a.Name=acc.name;
            a.AccountId=acc.id;
                a.CloseDate=system.today();
            a.StageName='prospecting';
            var1.add(a);
        }
        insert var1;
        
    }*/
    public static void trigger3(List<account> acc,Map<id,Account> map1){
        List<Account> coll= new List<Account>();
        for (account a :acc)
        {
            if(a.phone!=null && a.phone!=map1.get(a.id).phone)
            {
                a.Description='phoneis updated';
                 coll.add(a);
            }
            
              
        }
        update coll;
       
    }
    }