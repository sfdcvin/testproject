@isTest
public class AccountTriggerTest {
    @isTest
    public static void test()
    {
        list<account> accList=new List<Account>();
        for(Integer i=1;i<=200;i++)
        {
            Account acc=new account();
            acc.name='acc'+i;
            acc.BillingCity='CA';
            accList.add(acc);
        }
        insert accList;
        
        for(account acc:accList)
        {
          
           System.assertEquals(acc.ShippingState,'CA');
   
        } 
    }
}