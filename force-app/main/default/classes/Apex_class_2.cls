public class Apex_class_2 {
    
 public   string stagename;
 public   Date closeDate;
  public  string type;
    
    public void call()
    {
        if(type=='new customer')
        {
            
            closeDate=System.Today();
            stagename='closed won';
        }
        else
        {
            
            closeDate=System.Today()+15;
            stagename='closed Lost';
        }
        
    }

}