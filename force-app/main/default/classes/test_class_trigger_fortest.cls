@isTest
public class test_class_trigger_fortest {
   @isTest
    static void call()
    {
        
        Lead ld=new Lead();
        ld.FirstName='satish';
        ld.LastName='Myla';
        ld.Company='myla pvt ltd';
       
        ld.Industry='banking';
        ld.Rating='cold';
        insert ld;
        Lead leads=[select id,status from Lead where id=:ld.Id];
        
        System.assertEquals('open - not contacted',leads.status);
        
    }
    
    
    

}