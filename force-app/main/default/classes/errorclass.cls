public class errorclass {
    
    public String name {set;get;}
    
    public void call()
    {
        if(name=='')
        {
             apexpages.Message msg=new apexpages.Message(ApexPages.Severity.ERROR, 'vallue is empty');
             ApexPages.addMessage(msg);
        }
             //PageReference pageRef = new PageReference('/apex/vf3');

              // return  pageRef;       
        
    }

}