trigger trigger2 on Course__c (before insert) {
    
    for(Course__c crs:Trigger.New)
    {
        if(crs.Name=='java')
        {
            crs.Faculty__c='Natraj Choudhary';
        }
        
    }

}