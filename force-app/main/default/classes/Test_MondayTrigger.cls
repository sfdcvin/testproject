@isTest
public class Test_MondayTrigger {

    
    public static testMethod void testMe()
    {
        account ac=new Account();
        ac.name='x';
        ac.active__c='yes';
        insert ac;
        ac=[select industry from account where name=:ac.name];
        system.assertEquals('Banking', ac.industry);
        
    }
}