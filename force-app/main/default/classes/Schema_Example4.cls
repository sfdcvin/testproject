public class Schema_Example4 {
    public List<SelectOption> options {set;get;}
    public Schema_Example4(){
        options =new List<SelectOption>();
        /* Get the description about the picklist field */
        Schema.DescribeFieldResult result=Account.Industry.getDescribe();
        /* Get all the picklist entries of a given field */
        List<Schema.PicklistEntry> entries =result.getPicklistValues();
        /* Take one by one option and create a label */
        for(Schema.PickListEntry p:entries){
            SelectOption op=new SelectOption(p.getValue(),p.getLabel());
            options.add(op);
        }
    }
    
    
}