public class disableUtilityPopOutApex {

    @AuraEnabled
   public static string demoMethod()
   {
       return null;
   }
    
        @AuraEnabled 
    public static Case actioname(){
        
		try{
            account a=new account();
            a.name='vineet';
            insert a;
			return null;
			
		}catch(Exception e){
			
			            throw new AuraHandledException('Error Exception happend'+e.getMessage());           

		}
		
    }
}