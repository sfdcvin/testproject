public class NewJSONParsor {
     
   
    public map<string,object> resMap {set;get;}
    string str='{"Name":"vineet","Designation":"developer","city":"alwar"}';
    
    public NewJSONParsor()
    {
     
        resMap=new map<string,object>();
        
        resMap=(Map<String,Object>)JSON.deserializeUntyped(str);
           
            
        }
    
}