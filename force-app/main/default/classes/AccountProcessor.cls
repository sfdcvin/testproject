public class AccountProcessor
{

    @future
    public static void countContacts(List<id>  ids)
    {
        List<account> acc=new list<account>();
        for(Id d:ids)
        {
        List<contact> count=[select Id,firstname from contact where Contact.AccountId =:d];
        Integer i=count.size();
            
            for(account actnt:[select id,name from account where id=:d])
            {
            actnt.Number_of_Contacts__c=i;
                acc.add(actnt);
        }
    }
        update acc;
    
}
}