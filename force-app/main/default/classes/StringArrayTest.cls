public class StringArrayTest {
    
    public static List<string> generateStringArray(integer k)
    {
      list<string>  lst=new list<string>();
        for(integer i=0;i<k;i++)
        {
            lst.add('Test '+i);
            //System.debug(lst[i]);
        }
        return lst;
            
    }
    
    
}