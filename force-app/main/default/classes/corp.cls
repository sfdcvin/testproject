public class corp {
    
    public string str {set;get;}
    public list<Account> lists {set;get;}
    
    public void getData()
    {
        if(str !='')
        {
            str=str+'%';
            lists=[select name,industry,(select firstname,lastname from contacts) from account where name like : str];
            str=null;
            if(lists.size()==0)
            {
                lists=null;
            }
            
            
        }
        else
        {
            lists=null;
            str=null;
        }
        
        
    }
    
    
    

}