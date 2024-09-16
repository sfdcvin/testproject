public class JSON_1 {
    	public integer  cell {set;get;}
        public string name {set;get;}
        public decimal per {set;get;}
  public  string  x     {set;get;}
   public     string  y {set;get;}
   public     string  z {set;get;}
    
    public JSON_1(){
        
        cell=123;
        name='vineet';
        per=10.52;
         
    }
    
    public void create()
    {
        x=JSON.serialize(cell);
        y=JSON.serialize(name);
      z=JSON.serialize(per);
    }

}