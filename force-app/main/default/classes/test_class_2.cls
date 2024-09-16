@isTest
private class test_class_2 {
    
    @isTest
    static void test_method()
    {
        Apex_class_2 ac=new Apex_class_2();
        
        ac.type='new customer';
        ac.call();
        System.assertEquals(System.Today(), ac.closeDate);
        System.assertEquals('closed won', ac.stagename);
        
        ac.type='old customer';
        ac.call();
        System.assertEquals(System.Today()+15, ac.closeDate);
        System.assertEquals('closed Lost', ac.stagename);
        
    }
}