public class pagination1 {
    
    
    public  ApexPages.StandardSetController controller {set;get;} 
    public string searchByString {set;get;}
    public Integer size {set;get;}
    public string id {set;get;}
    
    //  Map<Id, WrapperForPagination> mapHoldingSelectedRecords{get;set;}
    
    public List<opportunity> optyList {set;get;}
    //public List<opportunity> WrapoptyList {set;get;}
    
    public List<WrapperClass> wrapperRecordList {set;get;}
    public pagination1(ApexPages.StandardController controller) {
    }
    public pagination1(){
        size=10;
        //  mapHoldingSelectedRecords = new Map<Id, WrapperForPagination>();
        wrapperRecordList=new List<WrapperClass>();
        optyList=[select name,stagename,closeDate from opportunity order by name ASC];
        
        controller=new Apexpages.StandardSetController(optyList);
        controller.setPageSize(size);
        wrapperRecordList= getRecordList();
        //   List<opportunity>  opty=(List<Opportunity>)controller.getRecords();
        //  for(opportunity op:opty)
        //  {
        //     wrapperRecordList.add(new WrapperClass(op, false));
        // }
    }
    
    public void afterSizePageChange()
    {
        //  wrapperRecordList.clear();
        
        controller.setPageSize(size);
        wrapperRecordList= getRecordList();
        //   List<opportunity>  opty=(List<Opportunity>)controller.getRecords();
        //  for(opportunity op:opty)
        //  {
        //     wrapperRecordList.add(new WrapperClass(op, false));
        // }
    }
    public void searchOpportunity()
    {
        
        // wrapperRecordList.clear();
        string  name=searchByString+'%';    
        optylist=[select name,stagename,closeDate from Opportunity where name like : name order by name ASC];
        controller=new Apexpages.StandardSetController(optyList);
        controller.setPageSize(size);
        wrapperRecordList= getRecordList();
        //   List<opportunity>  opty=(List<Opportunity>)controller.getRecords();
        //  for(opportunity op:opty)
        //  {
        //     wrapperRecordList.add(new WrapperClass(op, false));
        // }
    }
    
    public List<wrapperClass>  getRecordList()
    {
        List<opportunity>  opty=(List<Opportunity>)controller.getRecords();
        for(opportunity op:opty)
        {
            wrapperRecordList.add(new WrapperClass(op, false));
        }
        return wrapperRecordList;
    }
    
    
    
    
    
    public void deleteRecord()
    {
        wrapperRecordList.clear();
        
        list<opportunity> opp =[select id,name from opportunity where id =:id];
        
        
        optyList=[select name,stagename,closeDate from Opportunity order by name ASC];
        
        controller=new Apexpages.StandardSetController(optyList);
        controller.setPageSize(size);
        
        List<opportunity>  opty=(List<Opportunity>)controller.getRecords();
        for(opportunity op:opty)
        {
            wrapperRecordList.add(new WrapperClass(op, false));
        }
        
        /*
List<Opportunity> oppo=new list<Opportunity>();
for(WrapperForPagination wrp : wrapperRecordList){
if(wrp.isSelected){
oppo.add(wrp.oppRecord);

}
delete oppo;
*/
        
    }
    
    
    
    
    //wrapper class being used for checkbox showing.
    public  class WrapperClass {
        public Boolean isSelected {get;set;}
        public Opportunity oppRecord {get;set;}
        public WrapperClass(Opportunity oppRecord, Boolean isSelected) {
            this.oppRecord = oppRecord;
            this.isSelected = isSelected;
        }
        
        
    }   
}