global class invocable_class {
    @InvocableMethod 
    public static void InvocableMethod(list<Helper> hlp)
    {
          
        Contact ac=new Contact();
        ac.FirstName='vineet';
        ac.lastname='kumar';
        insert ac;
        
        
    }
   
    global class Helper
{
   @invocableVariable
 public  string  str;
}
}