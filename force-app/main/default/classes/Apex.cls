global class Apex implements Database.Batchable<sobject> {
   
  global  Database.QueryLocator start(Database.BatchableContext bc)
    {
        
        Database.QueryLocator result=Database.getQueryLocator('select id,name,stagename from Opportunity');
        return result;
    }
    
 global   void execute(Database.BatchableContext bc,List<Opportunity> op)
    {
        for(Opportunity o:op)
            {
                o.stagename='closed won';  
            }
        update op;
            
        
    }
    
   global void finish(Database.BatchableContext bc)
    {
        
    }
    

}