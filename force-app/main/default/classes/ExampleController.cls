public class ExampleController {

@AuraEnabled(Cacheable=true)
public static List<Contact> showContacts()
{
    return [Select id,name,email from contact];
}

@AuraEnabled(Cacheable=true)
public static String getPopulationData()
{
    HTTP h=new HTTP();
    HTTPRequest req=new HTTPRequest();
    req.setEndpoint('https://datausa.io/api/data?drilldowns=Nation&measures=Population');
    //req.setEndpoint('https://datausa.io');
    req.setMethod('GET');
    HTTPResponse res= new HTTPResponse();
    res=h.send(req);
    if(res.getStatusCode()==200)
    {
        System.debug(res.getBody());
    }
    return res.getBody();

}

}