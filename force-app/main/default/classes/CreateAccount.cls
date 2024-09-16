public class CreateAccount {
     
    @AuraEnabled()
    public static Account createAccounts(String accName, String gstNo){
        Account acc=new Account();
        acc.Name=accName;
        acc.GSTN__c=gstNo;
        insert acc;
        return acc;
    }
}