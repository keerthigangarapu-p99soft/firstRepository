@isTest
public class triggerAccountTestClass {
@istest
    public static void updaterating()
    {
        //////////create sample data...
        List<account> newlist = new list<Account>();
        for(integer i=1;i<5;i++)
        {
            Account acc= new Account();
            acc.Name='testacc'+i;
            acc.Industry='energy';
            newlist.add(acc);
                
        }
        test.startTest();
        insert newlist;
        test.stopTest();
        list<Account> updatedlist=[select id ,rating from account where id =:newlist[0].id];
        //apply assert condition
        system.assertEquals('Hot', updatedlist[0].rating);
            
    }
}