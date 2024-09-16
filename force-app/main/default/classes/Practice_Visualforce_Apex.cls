public class Practice_Visualforce_Apex {
  //  public  string  acc{get;set;}
     public   Account  acc {get;set;}
    public  boolean  isClicked  {get;set;}
    public  String  gstin  {get;set;}
    public  List<Account>  accn  {get;set;}
    public boolean dupTable {get;set;}
    public boolean newRecord {get;set;}
        public String RecordTypeId{get;set;}
     public RecordType RecordTypeName {get;set;}
public ApexPages.StandardController std;
    public Practice_Visualforce_Apex(ApexPages.StandardController stdc)
    {
     std=stdc;
          this.Acc = (Account)stdc.getRecord(); 
        RecordTypeId= this.Acc.RecordTypeId;
        RecordTypeName=[Select id,name from recordtype where Id=:RecordTypeId];
        
        dupTable=false;
        newRecord=false;
    }
    public void getData()
    {
            system.debug('vineet test');
    }
    public void retDate(){
         accn=[Select id,name,gstn__c,owner.name from account where gstn__c=:gstin];
        if(accn.size()>0)
        {
            dupTable=true;
            newRecord =false;
            gstin=null;
        }
        else
        {
            dupTable=false;
            newRecord =true;
        }
        
        acc.description='Test desc';
          system.debug('vineet test' +isClicked);
    //acc='Test name'; 
      //  system.debug('vineet test   '+ acc);
    }
}