public class Deserialize_strict {
    
    public string jsonString='{"name":"vineet","country":"india"}';
    public JSON_EXAMPLE obj {set;get;}
    public Map<string,Object>  mymap {set;get;}
     public Deserialize_strict(){
   
        obj=(JSON_EXAMPLE)JSON.deserializeStrict(jsonString, JSON_EXAMPLE.class);
         mymap=(Map<String,Object>)JSON.deserializeUntyped(jsonString);
           
    } 
}