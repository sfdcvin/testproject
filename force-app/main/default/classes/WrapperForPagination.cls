global  class WrapperForPagination {
        public Boolean isSelected {get;set;}
        public Opportunity oppRecord {get;set;}
        public WrapperForPagination(Opportunity oppRecord, Boolean isSelected) {
            this.oppRecord = oppRecord;
            this.isSelected = isSelected;
        }
        public WrapperForPagination() {
    						     
        }
    
    /*    
public List<Opportunity>  getOpty()
{
List<Opportunity> optyList=(List<Opportunity>)controller.getRecords();

return optyList;
}
*/
}