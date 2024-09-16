public class Extension2 {
    public Extension2(apexpages.standardcontroller controller)
    {}
    
      public void extensionMethod()
    {
        system.debug('Extension2');
      Extension3 e=new Extension3();
          e.extensionMethod();
    }


}