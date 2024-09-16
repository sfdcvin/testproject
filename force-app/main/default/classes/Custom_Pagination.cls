public class Custom_Pagination {
    
    public ApexPages.StandardSetController controller {set;get;}
    
    
    public Custom_Pagination(ApexPages.StandardSetController ssc)
    {
        List<Pagination_Object__c> po=[select name,city__c from Pagination_Object__c order BY name ASC];
        controller=new ApexPages.StandardSetController(po);
        controller.setPageSize(100);
        
        
        
    }
    
    public list<Pagination_Object__c> getObj()
    {
         List<Pagination_Object__c> objList=(List<Pagination_Object__c>) controller.getRecords();
        return objList;
    }
}