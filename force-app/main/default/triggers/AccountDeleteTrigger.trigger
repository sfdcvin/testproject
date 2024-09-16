trigger AccountDeleteTrigger on Account (after delete) {
    
    if(Trigger.isAfter && Trigger.isDelete)
    {
        for(Account a:Trigger.old)
        {
            System.debug('Deleted Account Id :'+a.id);
        }
    }

}