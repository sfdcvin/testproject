@isTest
public class TestRestrictContactByName {

   @isTest
 public   static void testMyCode()
 {
     
     contact c =new contact();
     c.firstname='vineet';
     c.lastname='INVALIDNAME';
     
      //Test.startTest();
      Database.SaveResult result = Database.insert(c,false);
    // Test.stopTest();
     
     System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
     System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                             result.getErrors()[0].getMessage());
 }
    
}