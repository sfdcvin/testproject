trigger Account_Trigger_approval on Account (before insert) {

   
    User u1=[select id from User where alias='akhan'];
     User u2=[select id from User where alias='vkuma'];
    for(Account a:Trigger.new)
    {
        
        if(a.AnnualRevenue>50000)
        {
        Approval.ProcessSubmitRequest psr=new  Approval.ProcessSubmitRequest();
        psr.setObjectId(a.id);
        psr.setSubmitterId(u1.id);
        
        List<Id> approvers =new List<Id>{u2.id};
        psr.setNextApproverIds(approvers);
        /* To which process you are submitting */
        psr.setProcessDefinitionNameOrId('Testing');
            Approval.ProcessResult result = Approval.process(psr);
        }
    }  

}