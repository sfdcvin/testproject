public class Inbound_example implements  Messaging.InboundEmailHandler{
    
    public messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail ie,Messaging.InboundEnvelope env)
    {
        messaging.InboundEmailResult result=new messaging.InboundEmailResult();
        
        try
        {
            contact con=[select id from Contact where email=:ie.fromAddress ];
            
            Case c=new Case();
                c.subject=ie.subject;
                c.Priority='low';
                c.Status='new';
                c.ContactId=con.Id;
                c.Description=ie.plainTextBody;
            insert c;
            result.success=true;
                
       }        
       catch(Exception e)
       {
           result.success=false;
       }
        
        return result;
    }
}