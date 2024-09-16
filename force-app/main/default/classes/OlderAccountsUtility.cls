public class OlderAccountsUtility {
    
    public static void updateOlderAccounts()
    {
        Account[] acc=[select id,description,createdDate from Account order by createdDate ASC limit 5];
        
        for(Account ac:acc)
        {
            ac.description='Heritage Account';
        }
        update acc;
    }

}