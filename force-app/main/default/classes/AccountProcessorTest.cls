@isTest
public class AccountProcessorTest {
    
    @isTest
    public static void MethodForTest()
    {
        
        Account acc=new Account();
        acc.name='Shree Cement Ltd';
        insert acc;
        contact cons=new contact();
        cons.FirstName='Shree';
        cons.LastName='Shree';
        cons.AccountId=acc.id;
        insert cons;
        List<id> lst=new List<id>{acc.id};
        Test.startTest() ;
        AccountProcessor.countContacts(lst);
        Test.stopTest();
        account  accList=[select id,name,(select Id, firstname from Contacts) from account where name='Shree Cement Ltd'];
        Integer count=accList.Contacts.size();
        system.assertequals(1,count);
            
        
    }

}