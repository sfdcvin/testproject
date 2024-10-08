// Trigger for listening to Cloud_News events.
trigger CloudNewsTrigger on Cloud_News__e (after insert) {    
    // List to hold all cases to be created.
    system.debug('vineet');
    List<Case> cases = new List<Case>();
    
    // Get queue Id for case owner
 //   Group queue = [SELECT Id FROM Group WHERE Name='Regional Dispatch' AND Type='Queue'];
       User u=[SELECT id FROM User WHERE name='vineet khandelwal'];
    // Iterate through each notification.
    for (Cloud_News__e event : Trigger.New) {
        if (event.Urgent__c == true) {
            // Create Case to dispatch new team.
            Case cs = new Case();
            cs.Priority = 'High';
             cs.Status = 'New';
            cs.Origin = 'Web';
              cs.Type = 'Mechanical';
            cs.Subject = 'News team dispatch to ' + 
                event.Location__c;
             cs.CurrencyIsoCode='U.S. Dollar';
            cs.OwnerId = u.Id;
            cases.add(cs);
        }
   }
    
    // Insert all cases corresponding to events received.
    insert cases;
}