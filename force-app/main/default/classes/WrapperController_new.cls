public class WrapperController_new {
   
    public List<Wrapper> wrapAccounts {set;get;}
    public list<Wrapper> selectedwrapper{get;set;}
   
    public WrapperController_new()
    {
       
        if(wrapAccounts==null)
        {
             wrapAccounts=new List<Wrapper>();
            list<account> ac=[select name,phone,(select firstname,phone from contacts) from account limit 10];
        for(Account a: ac)
        {
            wrapAccounts.add(new Wrapper(a,a.contacts));
            
        }
        
        }
    }
    
    public void showselected()
    {
         selectedwrapper=new list<Wrapper>();
        for(Wrapper wrapobj:wrapAccounts){
           if(wrapobj.flag==true){
           selectedwrapper.add(wrapobj);
              
           
         }

    }

    }
}