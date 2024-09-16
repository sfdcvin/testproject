@isTest

public class Apex_test {
    @isTest
    static void call()
    {
        Opportunity opp=new Opportunity();
        opp.name='myntra';
        opp.CloseDate=system.today();
        opp.StageName='prospect';
        insert opp;
        
        Apex a=new Apex();
        Test.startTest();
             
            Id job= Database.executeBatch(a,2);
              
        Test.stopTest();
        opportunity oo=[select stagename from opportunity where id=:opp.Id];
           System.assertEquals('closed won', oo.stagename);
        
    }

}