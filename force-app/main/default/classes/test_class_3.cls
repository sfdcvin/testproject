@isTest
private class test_class_3 {
@isTest
    static void test_method()
    {
        Apex_class_3 ac=new Apex_class_3();
        ac.create();
        Integer count;
        count=[select count() from Lead where email='123@gmail.com'];
        System.assertEquals(1,count);
        
    }
}