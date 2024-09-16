public class slctOption {
    public String  course {set;get;}
    public Boolean flag {set;get;}
    
    public void submit(){
        
        if(course=='java')
        {
            flag=true;
        }
        else
        {
            flag=false;
        }
    }

}