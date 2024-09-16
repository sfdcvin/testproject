@isTest
public class RestSeviceClass_Test {

    @isTest
    public static void testMethod1()
    {
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/myservice'; 
        req.httpMethod = 'GET';
        req.params.put('name', '9876543210');
        req.addHeader('Content-Type', 'application/json'); 
        RestContext.request = req;
        String name=RestServiceClass.doGet();
       // RestContext.response = res;
        system.debug(name);



    }
}