public class RandomContactFactory {

    
    
    public static list<contact> generateRandomContacts(Integer i,String LastName)
    {
        Integer j;
        List <contact>  cntcts=new list<contact>();
        
        for( j=1;j<=i;j++)
        {
            contact cn=new contact();
            cn.FirstName='name'+j;
            cn.LastName=LastName;
            cntcts.add(cn);
        }
        return cntcts;
    }
}