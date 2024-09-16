public class ActionPoolerExample {

    public integer leadCount {set;get;}
     public integer AccountCount {set;get;}
     public integer OpportunityCount {set;get;}
     public integer CaseCount {set;get;}
    public void callMethod()
    {
        leadCount=[select count() from lead where createdDate=today];
        CaseCount=[select count() from case where status='open'];
        OpportunityCount=[select count() from opportunity where stagename='closed lost'];
        AccountCount=[select count() from account where annualrevenue>10000];
    }
   


}