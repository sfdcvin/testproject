public class AccountTriggerHandler {
    
    public static  boolean flag=false;
    public static void CreateAccounts (List<Account> accList)
    {
        
                if(flag==false)
        {
        flag=true;
        RecursionHandler.recursionCount++;
        List<Account> accList1=new List<Account>();

        for(Account acc:accList)
        {
            
            //    System.debug('Max depth no '+MAX_RECURSION_DEPTH);
            Account a=new Account();
            a.id=acc.id;
            a.description='vk123';
            accList1.add(a);
            
            
        }
        update accList1;
        }
      //  flag=false;
    }
}