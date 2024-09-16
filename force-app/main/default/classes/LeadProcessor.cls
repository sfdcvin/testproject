global  class LeadProcessor   implements Database.Batchable<sObject>
     {
      
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('select id,firstname,lastname,leadsource from lead');
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        
        List<lead> leads=new List<lead>();
        for(lead l:scope)
        {
            l.LeadSource ='Dreamforce';
            leads.add(l);
        }
       update leads;
        
    }    
    global void finish(Database.BatchableContext bc){
        
    }    
}