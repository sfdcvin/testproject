public class Quick_Quote1 {
    public Account acc {set;get;}
    public Contact con {set;get;}
    public Opportunity opp {set;get;}
    public Quote quotes		{set;get;}
    
          public   Quick_Quote1(ApexPages.StandardController controller)
      {
          
          acc=(Account)controller.getRecord();
          con=new Contact();
          opp=new Opportunity();
          quotes =new Quote();
          
      }
    
    public PageReference save()
    {
        try{
        insert acc;
        con.accountId=acc.Id;
        insert con;
        opp.accountId=acc.Id;
        insert opp;
        quotes.name=acc.Name+'-'+opp.name;
        quotes.contactId=con.Id;
        quotes.opportunityId=opp.Id;
        insert quotes;
        }catch(Exception e)
        {
            System.debug(e.getMessage()
                        );
        }
         PageReference p=new PageReference('/'+opp.Id);
        return p;
        
    }
}