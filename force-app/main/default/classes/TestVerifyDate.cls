@isTest

public class TestVerifyDate {
    
    
    @isTest
    
    public static void DateVerify1()
    {
        date d1 = date.newInstance(2018,02,08);
         date d2 = date.newinstance(2018,02,20);
         
        System.assertEquals(d2,VerifyDate.CheckDates(d1,d2));
    }
    
    @isTest
    public static void DateVerify2()
    {
       date d1 = date.newInstance(2018,03,31);
         date d2 = date.newinstance(2018,05,20);
        
        date d3 = date.newinstance(2018,03,31);
        System.assertEquals(d3,VerifyDate.CheckDates(d1,d2));
    }

}