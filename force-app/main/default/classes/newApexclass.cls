public class newApexclass {
@auraenabled
    public static List<contact> getcontactlist(string accountId){
        list<contact> conlist = new list<contact>([select id , firstname ,lastname,email,phone from
                                                   contact where email!=null and AccountId=:accountId ]);
        return conlist;
    }
   @auraenabled
       public static Contact createcontact(Contact con, Id AccountId){
           con.AccountId=AccountId;
           insert con;
        
           return con;
       }
}