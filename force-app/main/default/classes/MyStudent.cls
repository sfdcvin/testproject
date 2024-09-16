public class MyStudent {
    public list<String> names {set;get;}
    public list<String> sortedName {set;get;}
   

public MyStudent()
{
    names=new list<string>{'ankit','sanjay','daxil'};
    sortedName=new list<string>();
    
}
    
    public void sorted()
    {
        for(string name:names)
    {
      if(name.startsWithIgnoreCase('a')) 
      {
         sortedName.add(name); 
      }
    }
    system.debug(sortedname);
    }
}