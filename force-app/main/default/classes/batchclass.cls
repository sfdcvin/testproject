global class batchclass implements Database.Batchable<Sobject>, database.stateful, schedulable{
    integer count=0;
  global  Database.QueryLocator start(Database.BatchableContext bc){
        
        return Database.getQueryLocator('select id,Name from Account');
        
    }
    
 global   void execute(Database.BatchableContext bc,List<Account> scope){
  /*   count++;
        list<account> lists=new list<account>();
        for(Account acc:scope)
        {
            //acc.description='batch';
          lists.add(acc);
        }
        update lists;
    }  */
     FutureMethod.iAmFuture();
 }
    
    
  global void  finish(Database.BatchableContext bc){
        system.debug(count);
    }
    
  global void  execute(System.SchedulableContext sc)
  {
     // batchclass bc=new batchclass();
     // Id jobId=database.executeBatch(bc);    
  }

}