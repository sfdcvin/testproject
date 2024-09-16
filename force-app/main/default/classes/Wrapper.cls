public class Wrapper {
    
    public Account acc {set;get;}
    public List<contact> con {set;get;}
    public Boolean flag {set;get;}
    
    public Wrapper(Account a,list<contact> cn)
    {
        
        acc=a;
        con=cn;
        flag=false;
        
    }

}