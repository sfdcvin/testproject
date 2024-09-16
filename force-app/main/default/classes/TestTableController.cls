public class TestTableController {
    public List<Account> accountList{get{
        return new List<Account>([Select Id, Name, Website, BillingStreet, BillingCity From Account Where BillingStreet != null LIMIT 10]);
    }
    set;}
    public TestTableController(){
    }
}