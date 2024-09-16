public class LeadController {

    @AuraEnabled(cacheable=true)
  public static List<Lead>  getLeadRecords()
    {
        try{
        return [select id,firstname,lastname,email from Lead  where firstname!=null and isdeleted=false];
        }catch(exception e)
        {
            throw new aurahandledexception('error occured :'+e.getmessage());
        }
    }
    
        @AuraEnabled(cacheable=true)
  public static string  getABC()
    {
        return 'abc';
    }
    
    @AuraEnabled
    public static void createLeadRecord(Lead lead)
    {
        insert lead;
    }
    
    @AuraEnabled()
        public static string  doLogin(String username,String password,string startURL)
        {
           // String startUrl = System.Label.Community_Url;
                    ApexPages.PageReference p=Site.login(username,password,startURL);
           // p.setRedirect(true);
            return p.getUrl();

        }
}