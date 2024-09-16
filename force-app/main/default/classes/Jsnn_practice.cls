public class Jsnn_practice {
    
  static  contact acc;
   static string jsonString;
    static  contact acc1;
    
    public static void serializeMethod()
    {string jsonString;
        acc=new contact(firstname='AlienBrainz',lastname='Software',email=null);
        
        jsonString=Json.serializePretty(acc,true);
        System.debug(jsonString);
        
        
    }
    
     public static void deserializeMethod()
    {
        acc=new contact(firstname='AlienBrainz',lastname='Software',email=null);
        
        jsonString=Json.serializePretty(acc);
        System.debug(jsonString);
        
        acc1=(contact)json.deserialize(jsonString, contact.class);
        insert acc1;
        
        
        
        
    }
    
    

}