public virtual class WU_AbstractWorkUnit {
    public List<Sobject> oldRecords=new List<Sobject>();
    public Map<Id,sObject> oldRecordsMap=new Map<Id,sObject>();
    
    public List<Sobject> newrecords=new List<Sobject>();
    public Map<Id,sObject> newRecordsMap=new Map<Id,sObject>();
    
    private String WorkUnit_ID='';
    
    public WU_AbstractWorkUnit(String WorkUnitid){
        this.WorkUnit_ID=WorkUnitid;
        
    }
    
    public virtual string getWorkUnitID()
        {
            return this.WorkUnit_ID;
        }
    
    public virtual void bulkBeforeInsert(List<Sobject> newrecords)
    {
        
    }
    
    public virtual void bulkBeforeUpdate(List<Sobject> oldRecords,List<Sobject> newRecords){
        
    }
    
    public virtual void workCommitOnAfter(){
        
    }

}