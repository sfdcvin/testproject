@isTest

public class LeadProcessorTest {
    
    @testSetup 
    static void setup() {
        integer i;
    List<lead> leads=new List<lead>();
    for(  i=0;i<200;i++)                    
    {
        lead l=new lead();
        l.FirstName='lead'+i;
        l.LastName='Alien';
        l.company='xyz ltd';
        leads.add(l);
    }
    insert leads;
    }
    
    @isTest
    static  void test() { 
         
 
        
         Test.startTest();
        LeadProcessor LP = new  LeadProcessor();
        Id batchId = Database.executeBatch(LP);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from lead where leadsource='Dreamforce']);
    }

}