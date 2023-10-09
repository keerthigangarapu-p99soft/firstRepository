public with sharing class apexcontroller {
@AuraEnabled
    public static string serverecho(string firstname)
    {
        firstname='bhavitha';
        return(firstname);
    }
    @auraenabled
    public static list<contact> getcontactlist(integer num){
        list<contact> contactlist=[select id,name from contact limit 10];
        for(contact con:contactlist){
            
        }
        return contactlist;
    }
}