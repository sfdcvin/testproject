public class WU_WorkUnitHandler {
    private static Set<String> INACTIVE_WORKUNITS=new Set<String>();
         private static  Map<String,List<WU_AbstractWorkUnit>> WorkUnitsMap=new Map<String,List<WU_AbstractWorkUnit>>();

     private static  Map<String,Boolean> sobjectEnabledMap=new Map<String,Boolean>();
    
    private String salesforceObject='';
    
    public WU_WorkUnitHandler(String sobjectName)
        {
            if(SobjectEnabled(salesforceObject))
            {
                List<WU_AbstractWorkUnit> WorkUnits;
                if(WorkUnitsMap.containsKey(sobjectName)){
                   WorkUnits=WorkUnitsMap.get(sObjectName);
                }Else {
                    WorkUnits=prepareWorkUnits(sObjectName);
                                       WorkUnits=WorkUnitsMap.put(sObjectName,WorkUnits);
                    
                }
                this.salesforceObject=sObjectName;
                execute();
            }
        }
    
    private static Boolean SobjectEnabled(String sObjectName)
        {
            if(sobjectEnabledMap.isEmpty()){
                for(WU_Trigger_Availability__mdt sobjectTriggerAvailability :[select id,label,enabled__c from WU_Trigger_Availability__mdt])
                    {
                        
sobjectEnabledMap.put(sobjectTriggerAvailability.label,sobjectTriggerAvailability.Enabled__c)  ;                      
                    }
            }
                
                if(!sobjectEnabledMap.containsKey(sobjectName))
                    {
                        return false;
                    }
                return sobjectEnabledMap.get(sobjectName);
            
        }

    private void execute(){
        for(WU_AbstractWorkUnit workUnit:WorkUnitsMap.get(this.salesforceObject)){
            if(WU_WorkUnitHandler.WorkUnitIsEnabled(workUnit.getWorkUnitId()))
            {
                   If(Trigger.New!=NULL)
                   {
                       workUnit.newRecords=trigger.New;
                   }
                If(Trigger.NewMap!=null)
                    {
                        workUnit.newrecordsMap=Trigger.newMap;
                    }
                if(Trigger.old!=NULL)
                    {
                        workUnit.oldrecords=Trigger.old;
                    }
                                if(Trigger.oldMap!=NULL)
                    {
                        workUnit.oldrecordsMap=Trigger.oldMap;
                    }
                if(Trigger.isBefore)
                    
                {
                    if(trigger.isInsert)
                    {
                    workUnit.bulkBeforeInsert(Trigger.New);
                    }
                else if(Trigger.isUpdate)
                    {
                        workUnit.bulkBeforeUpdate(Trigger.Old,Trigger.New);
                    }
                  //  workUnit.workCommitOnBefore();
                }
    }
        }
            }
    
    private static List<WU_AbstractWorkUnit> prepareWorkUnits(String sObjectName){
        List<WU_AbstractWorkUnit> WorkUnitsList=new List<WU_AbstractWorkUnit>();
        
        for(WU_Work_Unit__mdt WorkUnit: [Select developerName,Execution_Order__c
                                        from WU_Work_Unit__mdt
                                         where Sobject__c=:sObjectName and Enabled__c=true order by Execution_Order__c asc]){
                                           Type t=Type.forName(WorkUnit.DeveloperName)  ;
                                         
        if(WU_WorkUnitHandler.WorkUnitIsEnabled(WorkUnit.DeveloperName)){
            try{
                WorkUnitsList.add((WU_AbstractWorkUnit) t.newInstance());
            }Catch(Exception e)
                {
                    
                }
        }
                                         }
        return WorkUnitsList;
    }
    
    public static Boolean WorkUnitIsEnabled(String WorkUnitId){
        return !INACTIVE_WORKUNITS.contains(WorkUnitId);
    }
}