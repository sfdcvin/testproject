public with sharing  class PizzaClass {
    
    public List<Pizza__c> pizzas {set;get;}
    public Id id{set;get;}
   
        
        public void getPizzas()
    {
        pizzas=[select id,name,size__c from pizza__c ];    
    }
    
       public Pagereference deletePizza()
       {
           if(id!=null){
               // if (Schema.sObjectType.pizza__c.fields.size__c.isUpdateable()){
       				 pizza__c piz=[select name from pizza__c where Id=:id];
           			 //delete piz;
           			 piz.size__c=15;
                     update piz;
           			 id=null;
                      getPizzas();
           
      // }
              
                   // else {
               // ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error: User is unauthorized to delete the records'));
              //}
               
      }
           return null;
       }       

}