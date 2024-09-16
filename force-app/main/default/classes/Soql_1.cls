public class Soql_1 {
    
  public   List<Account> acclist {set;get;}
    
   public PageReference call()
   {
       acclist=[select id,name from Account  ];
       
       PageReference p=new PageReference('/apex/renderasExample');
           return p;
   }

}