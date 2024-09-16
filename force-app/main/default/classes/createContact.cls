public class createContact {
    
    @AuraEnabled
    public static Id saveContact(Contact con)
    {
        insert con;
        System.debug('Con===>>'+con);
        return con.Id;
    }
        @AuraEnabled
    public static id callMe(Id accountId)
    {
        System.debug('Account Id'+accountId);
      // system.debug(ApexPages.currentPage().getParameters().get('id') );
        contact c=new contact();
        c=[select id from contact where id='0037F00001frZrVQAU' limit 1];
        c.AccountId=accountId;
        update c;
        return c.id;    

    }
    
}