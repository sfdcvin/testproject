global class New_Batch_Class implements Database.Batchable<Sobject>{
    
    
    global Database.queryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('select id,closeDate from Opportunity where stageName=\'prospecting\' and createdDate=today');
    }
    
    
    global void execute(Database.BatchableContext bc,List<Opportunity> opp)
    {
        for (Opportunity op:opp)
        {
            op.closeDate=System.today();
        }
        update opp;
    }
    global void finish(Database.BatchableContext bc)
    {}
    
    
    
    
    
    

    
    
    
}