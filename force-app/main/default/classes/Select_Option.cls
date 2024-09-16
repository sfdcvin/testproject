public class Select_Option {
    public List<SelectOption> options  {set;get;}
    public static  String selectedOption  {set;get;}
    public Select_Option(){
              options=new List<SelectOption>();

        for(Account acc:[SELECT ID,Name from Account])
        {
            options.add(new SelectOption(acc.Id,acc.Name));
        }        
    }
    
    public void callMe()
    {
        system.debug('HHHHHHHHHH'+selectedOption);
    }
}