trigger AcTriiggger on Account (before update) {


  Map<Id, Account> rejectedStatements 
             = new Map<Id, Account>{};

  for(Account inv: trigger.new)
  {
    /* 
      Get the old object record, and check if the approval status 
      field has been updated to rejected. If so, put it in a map 
      so we only have to use 1 SOQL query to do all checks.
    */
      rejectedStatements.put(inv.Id, inv);  
  }
   
  if (!rejectedStatements.isEmpty())  
  {
    // UPDATE 2/1/2014: Get the most recent approval process instance for the object.
    // If there are some approvals to be reviewed for approval, then
    // get the most recent process instance for each object.
    List<Id> processInstanceIds = new List<Id>{};
    
    for (Account invs : [SELECT (SELECT ID
                                              FROM ProcessInstances
                                              ORDER BY CreatedDate DESC
                                              LIMIT 1)
                                      FROM Account
                                      WHERE ID IN :rejectedStatements.keySet()])
    {
        processInstanceIds.add(invs.ProcessInstances[0].Id);
    }
      
    // Now that we have the most recent process instances, we can check
    // the most recent process steps for comments.  
    for (ProcessInstance pi : [SELECT TargetObjectId,
                                   (SELECT Id, StepStatus, Comments 
                                    FROM Steps
                                    ORDER BY CreatedDate DESC
                                    LIMIT 1 )
                               FROM ProcessInstance
                               WHERE Id IN :processInstanceIds
                               ORDER BY CreatedDate DESC])   
    {                   
      if ((pi.Steps[0].Comments == null || 
           pi.Steps[0].Comments.trim().length() == 0))
      {
        rejectedStatements.get(pi.TargetObjectId).addError(
          'Operation Cancelled: Please provide a rejection reason!');
      }
    }  
  }

    

       /*      List<Account> acc =  [Select id,Name,(Select Id, Comments  FROM ProcessSteps)  From Account WHERE Id IN : Trigger.new];
                 
                                    system.debug(acc[0].ProcessSteps[0].Comments);
*/

}