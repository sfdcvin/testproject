@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager {
      @HttpGet
    global static account getAccount()
    {
        
          RestRequest request = RestContext.request;
        // grab the accountId from the end of the URL
       

     String accid= request.requestURI.substringBetween('Accounts/','/contacts');
        Account result;
        
            result =  [SELECT id,name,(select id,firstname from contacts) from account where id=: accid];
        system.debug(result.name);
       
        
        
            
                        
        return result;        
      
    }
    
    
    
}