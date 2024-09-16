public class DuplicateSearch1 {
    public String name {set;get;}
    public  List<AggregateResult> acc ;
    
     public DuplicateSearch1()
    {
        acc=[select count(name) from account where name=:name];
        if(acc.size()>0)
        {
            apexpages.Message msg=new apexpages.Message(ApexPages.Severity.FATAL, 'Duplicate Record Found');
             ApexPages.addMessage(msg);
        }
    }
}