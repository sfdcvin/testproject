public class JSON_EXAMPLE {
    public string name  {set;get;}
    public string country  {set;get;}
    public string sex  {set;get;}
    
    
    public JSON_EXAMPLE(string s1,string s2,string s3)
        
    {
            name    =s1;
            country =s2;
            sex     =s3;
            
        
    }
     public JSON_EXAMPLE(string s1,string s2)
        
    {
            name    =s1;
            country =s2;
            
            
        
    }
}