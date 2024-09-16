@isTest

public class DailyLeadProcessorTest {

    public static String CRON_EXP = '20 59 19 14 6 ? 2019';
     @testSetup 
    static void setup() {
        List<Lead> leads=new List<Lead>();
        for(integer i=1;i<=200;i++)
        {
            Lead ld=new Lead();
            ld.FirstName='xyz';
            ld.LastName='abc';
            ld.LeadSource='';
            ld.company='Alien';
           leads.add(ld);
            
        }
        insert leads;
    }
    @isTest
    public static void methodTest()
    {
        DailyLeadProcessor dlp=new DailyLeadProcessor();
        Test.startTest();
        
        String jobId = System.schedule('DailyLeadProcessorTest',
            CRON_EXP, 
            dlp); 
       
        Test.stopTest();
        
    }
    
}