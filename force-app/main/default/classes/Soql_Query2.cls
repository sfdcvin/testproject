public class Soql_Query2 {
    
    public List<Account> acc  {get;set;}
    string query='select Id,Name from Account limit 5';
    public void call()
    {
    acc=Database.query(query);
    }
    
    

}