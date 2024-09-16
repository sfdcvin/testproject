@isTest
public class AddPrimaryContactTest {

     @testSetup 
    static void setup() {
        List<Account> accList=new List<Account>();
        for(integer i=1;i<=50;i++)
        {
            Account ac=new Account();
            ac.name='acc'+i;
            ac.BillingState='NY';
            accList.add(ac);
        }
        insert accList;
        accList=new List<Account>();
        for(integer i=1;i<=50;i++)
        {
            Account ac=new Account();
            ac.name='acc'+i;
            ac.BillingState='CA';
            accList.add(ac);
        }
        insert accList;
    }
    
    
    
    @isTest
    public static void methodTest()
    {
      Test.startTest();
        contact con=new Contact();
        con.firstname='Prateek';
        con.lastname='kumar';
        AddPrimaryContact apc=new AddPrimaryContact(con,'CA');
        System.enqueueJob(apc);
	Test.stopTest();
    }
}