trigger CreateMultipleContacts on Contract  (after insert,  after update) {
    
    List<Contract_Renewal__c> contractFinalListToInsert = New List<Contract_Renewal__c>();
    
    if(Trigger.isInsert || Trigger.isUpdate){
        for(Contract  c : Trigger.New) {
            if(c.Renew__c == true) {
                Integer fetchingAlreadyExistedRecords = [SELECT count() FROM Contract_Renewal__c WHERE Contract__c=:c.Id and Not_Renewed__c=:false and Multi_Year__c=:true];
                
                if(fetchingAlreadyExistedRecords!=null) {
                    // We are only creating a records when there at least one Contract record exists.
                    for(Integer i=0; i<fetchingAlreadyExistedRecords; i++) {
                        Contract_Renewal__c con = new Contract_Renewal__c();
                        con.Contract__c = c.Id;
                        contractFinalListToInsert.add(con);
                        
                    }
                }
            }
            
            try{
                if(!contractFinalListToInsert.IsEmpty()){
                    INSERT contractFinalListToInsert;
                }
            }
            catch(Exception e){
                System.debug('The thrown exception for CreatingAutoRecords is:: ' + e.getMessage());
            }
        }
    }
}