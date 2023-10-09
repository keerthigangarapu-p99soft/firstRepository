public class stucontroller {
  @AuraEnabled
    public static id insertStudent(Student__c student) {
         System.debug('student'+student);
        student__c st = new student__c();
        st.Name=student.Name;
        st.phone__c=student.phone__c;
        insert st;
        return st.Id;
    
}

    public class Studentc{
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