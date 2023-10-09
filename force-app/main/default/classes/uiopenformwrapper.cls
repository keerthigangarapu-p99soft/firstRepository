public class uiopenformwrapper {
    @AuraEnabled
    public static id exampleControllerMethod(Parameters parameters){
        System.debug('parameters'+parameters);
        student__c st= new student__c();
        st.Name=parameters.name;
        insert st;
        return st.Id;
    }
    public class Parameters{
        @AuraEnabled

        public string Name {get; set;}

        @AuraEnabled

        public string Gender {get; set;}

        @AuraEnabled

        public string Phone {get; set;}

        @AuraEnabled

        public string Address {get; set;}

    }

}