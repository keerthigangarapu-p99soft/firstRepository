public class api_authorize_dotnet {
    //variables to store values
    public static string apikey;
    public static string transid;
    public static void getauthoizevalues(){
        authorize_net_settings__c obj = authorize_net_settings__c.getinstance('api login');
        authorize_net_settings__c obj1= authorize_net_settings__c.getinstance('trans key');
      apikey=  obj.value__c;
       transid= obj1.value__c;
        system.debug('apikeyvalue'+apikey);
        system.debug('keyvalue'+transid);
        
    }
}