public class List_Example {
    public List<Account> accounts {Set;get;}
    public Account acc			  {Set;get;}
    public List_Example(){
        accounts =new List<Account>();
        acc=new Account();
    }
    public void add(){
        accounts.add(acc);
      acc=new Account();
    }
    public void clear(){
        accounts.clear();
    }
}