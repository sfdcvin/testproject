public class Soql_Query_find {
    
    public  Soql_Query_find(ApexPages.StandardController controller){}
    public String accountholdername  {set;get;}
    public List<Account> result {set;get;}
    
    
    public void call(){
    result=[select id,name,industry from Account where name=:accountholdername];
    }

}