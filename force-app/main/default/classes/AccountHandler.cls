public class AccountHandler extends WU_AbstractWorkUnit {
    public AccountHandler()
    {
        Super(String.valueOf(AccountHandler.Class));
    }
    
    public override void bulkBeforeInsert(List<Sobject> newRecords)
    {
        //( List<Account>)newRecords  and use
    }
     public static  Account insertNewAccount(string name)
    {
     
       Account acc=new Account();
        
        try
        {
                  acc.Name=name;
                   insert acc;
                  return acc;
         }catch (DmlException e) {
            
                return null;
                     }
      
       
    }     
 }