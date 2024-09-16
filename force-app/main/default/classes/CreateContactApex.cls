public  class CreateContactApex {
    @AuraEnabled
    public static void insertContact(List<Contact> c)
    {
        Try{
        Insert c;
        }catch(exception e)
        {
            throw new aurahandledexception('Error occured '+e.getMessage());
          
        }
    }
       
    
     

   @AuraEnabled() 
    public static List<Contact> getContacts()
    {
       // List<Contact> conList=[Select id,FirstName,LastName,Email from Contact];
       // return conList;
       throw new AuraHandledException('Forced error');
    }

    @AuraEnabled
    public static void updateAccount(Account acc)
    {
update Acc;
    }

}