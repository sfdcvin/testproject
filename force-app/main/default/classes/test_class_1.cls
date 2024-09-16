@isTest
private class test_class_1 {
    
    @isTest
    static void test_method()
    {
        Apex_class_1 ac=new Apex_class_1();
        ac.call();
        
        System.assertEquals('vineet', ac.name);
        System.assertEquals(12345, ac.phone);
        
    }
}