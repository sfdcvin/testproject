public class soql_dml_1 {
    
    public Account acc {set;get;}
    public Contact con {set;get;}
    
    public soql_dml_1(){
        
        acc=new Account();
        con=new Contact();
    }
    
    
    public PageReference save(){
        Integer count=[select count() from Account where name=:acc.Name];
        if(count>0){
           Apexpages.Message msg=new ApexPages.Message(Apexpages.Severity.Error,'Duplicate Record found');
           Apexpages.addMessage(msg);
            // return null means return back to same vf page
                return null;
        }else{
        try
        {
            insert acc;
            con.accountId=acc.Id;
            insert con;
        PageReference p=new PageReference('/'+acc.Id);
        return p;
            
        }
        catch(Exception e)
        {
            ApexPages.Message msg=new  ApexPages.Message(ApexPages.severity.error,e.getMessage());
                ApexPages.addMessage(msg);
            return null;
        }
        }
    }
    
    public PageReference cancel(){
         acc=new Account();
        con=new Contact();
         return null;
    }
        
    
   
}