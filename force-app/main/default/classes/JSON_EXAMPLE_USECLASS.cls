public class JSON_EXAMPLE_USECLASS {
   public string objectTostringNonPretty {set;get;}
    public string objectTostringPretty {set;get;}
    public string objectTostringnonsupressed {set;get;}
    public string objectTostringsupressed {set;get;}
    public string objectTostring {set;get;}
    
    public JSON_EXAMPLE obj {set;get;} 
    public JSON_EXAMPLE_USECLASS(){
    JSON_EXAMPLE je=new JSON_EXAMPLE('vineet','india','male');
        
     objectTostringNonPretty = JSON.serialize(je); 
        objectTostringPretty=  JSON.serializePretty(je);
        
        System.debug(objectTostringNonPretty);
        System.debug(objectTostringPretty);
        JSON_EXAMPLE je1=new JSON_EXAMPLE('vineet','india');
         objectTostringnonsupressed = JSON.serialize(je1);
        System.debug(objectTostringnonsupressed);
        objectTostringsupressed = JSON.serializePretty(je1, true);
        System.debug(objectTostringsupressed);
        
        obj=(JSON_EXAMPLE)JSON.deserialize(objectTostringNonPretty, JSON_EXAMPLE.class);
        System.debug(obj);
        System.debug(obj.name);
        
        
        
    } 

}