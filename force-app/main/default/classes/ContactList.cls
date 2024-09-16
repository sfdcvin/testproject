public class ContactList {

      @AuraEnabled
    public static List<Contact> ContactLists () {  
 
        List<Contact> contacts = [SELECT FirstName, LastName, Email FROM Contact ];
 
        return contacts;
    }
}