public class DuplicateDocter {
    public String name {set;get;}
    public  List<Doctor__c> dr;
    
     public void save()
    {
        
        dr=[select name from Doctor__c where name=:name];
        if(dr.size()>0)
        {
            apexpages.Message msg=new apexpages.Message(ApexPages.Severity.ERROR, 'Duplicate Record Found');
             ApexPages.addMessage(msg);
        }else
        {
            Doctor__c d=new Doctor__c();
            d.name=name;
            insert d;
        }
    }

}