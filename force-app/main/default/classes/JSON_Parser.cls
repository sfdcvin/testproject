public class JSON_Parser {
    
    public Map<String,object> ResMap {set;get;}
    
   public  JSON_Parser()
   {
       ResMap=new Map<String,object>();
       String jsonString='{"name":"vineet","city":"jaipur"}';
       System.JSONParser jp=JSON.createParser(jsonString);
       while(jp.nextToken()!=null)
       {
           
           ResMap.put(jp.getText(),jp.getCurrentToken());
           System.debug(ResMap);
       }
       
       
   }

}