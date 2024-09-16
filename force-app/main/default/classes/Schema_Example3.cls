public class Schema_Example3 {
   
  public  Map<string,Schema.SObjectField> fldMap ;
  public  List<SelectOption> options {set;get;}
    
    public Schema_Example3()
    {
       Schema.DescribeSobjectResult result=Account.SobjectType.getDescribe();
        fldMap=result.fields.getMap();
        
        options=new List<SelectOption>();
        set<String> keys=fldMap.keySet();
        for(string s:keys)
        {
            SelectOption sp=new SelectOption(s,s);
            options.add(sp);
            
        }
        
        
    }
    

}