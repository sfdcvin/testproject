@isTest
public class Apex_11_Test {
         @isTest
       static void mytest()
       {
    Apex_11 ob=new Apex_11();
    ob.num=10;
    ob.fun();
    system.assertEquals('Aliens', ob.name);
    ob.num=20;
    ob.fun();
    system.assertEquals('Bodacious', ob.name);
    
}
}