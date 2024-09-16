public class Schema_Example1 {
    public string selected;
  public  Map<string,schema.SobjectType> resMap ;
  public  List<SelectOption> options {set;get;}
    
    public Schema_Example1()
    {
        resMap=Schema.getGlobalDescribe();
        options=new List<SelectOption>();
        set<String> keys=resMap.keySet();
        for(string s:keys)
        {
            SelectOption sp=new SelectOption(s,s);
            options.add(sp);
            
        }
        
        
    }
    

}