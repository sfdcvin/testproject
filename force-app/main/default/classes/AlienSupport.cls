public class AlienSupport
{
    public String name {set;get;}
    public List<account> accList {set;get;}
       
    

public void getAccount()
{
    if(name!=null && name!='')
    {
     name=name+'%';
   accList=[select name,industry from account where name like :name];
    }
}

}