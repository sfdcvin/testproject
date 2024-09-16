public class LinkExample {
    public Id idValue {set;get;}
  
    
    public pageReference callMe()
    {
        system.debug(idValue);
        return (new Pagereference('/'+idValue));
    }

}