public class Aliens_1 {
    public String name {set;get;}
    public List<Account> acc {set;get;}
    

   
    public void search()
    {
       string searchquery='select name,id from account where name like \'%'+name+'%\' Limit 20'; 
            acc=Database.query(searchquery)   ;
    }
}