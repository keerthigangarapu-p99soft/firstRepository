@isTest
public class triggerhandleroppTesrClass {
@isTest
    public static void updatedesc()
    
    {
        ///////create sample data
        list<opportunity> samdata = new list<opportunity>();
        for(integer i=1;i<5;i++)
        {
             opportunity newopp= new opportunity();
            newopp.Name= 'testopp'+i;
            newopp.CloseDate=system.today();
            newopp.StageName='prospecting';
            newopp.Amount=200000;
               samdata.add(newopp);
        }
        test.startTest();
        insert samdata;
        test.stopTest();
        list<opportunity> collopp=[select id,description from opportunity where id=:samdata[0].id];
        system.assertEquals('hot opportunitydescription',collopp[0].description);
            
    }
    
}