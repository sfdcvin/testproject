public class Vin_Test_Controller {
    
    public Static Boolean flag;
    @auraEnabled
    static public boolean callAction(String name, String  phone)
    {
        system.debug(name);
        system.debug(phone);
        Integer count=[select count() from LoginHistory where UserId=:UserInfo.getUserId() AND logintime =Today ];
        System.debug('count----==='+count);
        if (count==1)
        {
            flag =true;
            return flag;
        }
        else
        {
            flag=false;
            return flag;
        }
        
    }
    
}