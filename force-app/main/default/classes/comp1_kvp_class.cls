public class comp1_kvp_class {
  
    
          @auraEnabled
    public static List<Account> serverEcho()
    {
          system.debug('check');
        return [select name from account];
      
    }
       @auraEnabled
    public static String serverEcho_2(String name)
    {
        return 'Justin';
    }
       @auraEnabled
    public static String serverEcho_3(String name)
    {
        return 'Barber';
    }
}