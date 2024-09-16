@isTest
public class  AnimalLocatorTest{
    @isTest
    public static  void testGetCallout() {
        // Set mock callout class 
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
    // This causes a fake response to be sent
    // from the class that implements HttpCalloutMock. 
    string actualValue = AnimalLocator.getAnimalNameById(123);
     
    //System.debug(response.getBody());
    String expectedValue = 'majestic badger';
    System.assertEquals(actualValue, expectedValue);
    // System.assertEquals(200, response.getStatusCode());  
    
    
      }
    
}