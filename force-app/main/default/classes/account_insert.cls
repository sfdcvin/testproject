public class account_insert {
    
    public string name {set;get;}
    public Account acc;
    
    public void createAccount()
    {
        try
        {
        acc=new Account();
        acc.name=name;
        insert acc;
        }catch (DmlException e) {
    System.debug('A DML exception has occurred: ' +
                e.getMessage());
}
        
    }

}