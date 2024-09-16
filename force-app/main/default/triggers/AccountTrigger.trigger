trigger AccountTrigger on Account (after update) {
    Integer MAX_RECURSION_DEPTH = 1;
System.debug('count :'+RecursionHandler.recursionCount);
    RecursionHandler.recursionCount++;
    if(Trigger.isAfter ) 
    {
       
        //MAX_RECURSION_DEPTH++;
        //RecursionHandler.flag=true;
AccountTriggerHandler.CreateAccounts(Trigger.New);
//RecursionHandler.flag=false;
    }
    
   
}