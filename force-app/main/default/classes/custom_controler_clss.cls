public class custom_controler_clss {
 public Integer val1 {set;get;}
     public   Integer val2 {set;get;}
     public   Integer val3 {set;get;}
    
    public void add(){
        if(val1==0 )
        {
            apexpages.Message msg=new apexpages.Message(ApexPages.Severity.FATAL, 'vallue is empty');
             ApexPages.addMessage(msg);
        }
        else
        {
            System.debug(val1+'  '+val2);
        val3=val1+val2;
        }
    }
    public void reset()
    {
        val1=null;
        val2=null;
        val3=null;
    }
         

}