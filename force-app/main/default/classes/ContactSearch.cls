public class ContactSearch {
    
    
    public static list<contact>  searchForContacts(string arg1,string arg2)
    {
         list<contact> cont=[select firstname from contact where (lastname=:arg1 AND MailingPostalCode=:arg2)];
        return cont;
    }

}