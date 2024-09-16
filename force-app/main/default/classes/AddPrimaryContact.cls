public class AddPrimaryContact implements Queueable {

    
    private contact con;
    private string state;
    
    
     public AddPrimaryContact( contact con, string State)
     {
         this.con=con;
         this.state=state;
         
     }
         
      public void execute(QueueableContext context) {
       
                   List<account>  accounts=new List<account>();
                   accounts=[select id from account where BillingState=:state limit 200];
                       system.debug('vineet');
                       list<contact> conslead=new list<contact>();
                          for(account acc:accounts)
                          {
                             
                              contact cons=con.clone(false, false, false, false);
  							  cons.AccountId=acc.Id;
                              conslead.add(cons);
                         
                          }
                        insert conslead;
                 }
   
}