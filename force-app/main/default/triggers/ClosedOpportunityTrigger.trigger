trigger ClosedOpportunityTrigger on Opportunity (before insert) {
    List<Task> Task=new List<Task>();
    for(Opportunity o:Trigger.New)
    {
        if(o.StageName=='Closed Won')
        {
            Task t = new Task();
            //t.OwnerId = userId;
            t.Subject = 'Follow Up Test Task';
            t.Status = 'Open';
            t.Priority = 'Normal';
            t.WhatId = o.Id;
            Task.add(t);
            
                        
        }
        
        
    }
    insert Task;

}