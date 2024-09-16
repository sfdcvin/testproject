trigger Trigger1 on Employee__c (before insert) {
    
    for(Employee__c e:trigger.new)
    {
        
        e.Technology__c='java';
    }

}