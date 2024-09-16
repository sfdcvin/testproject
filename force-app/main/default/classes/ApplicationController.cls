public class ApplicationController {
@AuraEnabled
 public static void   saveLead(Lead lead)
    {
        Try{
            insert lead;
        }
        Catch(Exception e)
        {
            system.debug('error message:'+e.getMessage());
        }
    }
    
    @AuraEnabled
 public static Id   saveEducation(Education__c education)
    {
        Try{
            upsert education;
            
        }
        Catch(Exception e)
        {
            system.debug('error message:'+e.getMessage());
        }
        return education.Id;
    }
    
    @AuraEnabled()
 public static String   saveAccount(Account account)
    {

        string error;
        Try{
            System.debug(account);
            update account;
        }
        Catch(Exception e)
        {
            system.debug('error message:'+e.getMessage());
            error =e.getMessage();
        }
        return error;
    }
}