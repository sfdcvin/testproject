public class jsonPractice {
    
    public string name{set;get;}
     public string acc{set;get;}
    
    public jsonPractice()
    {
        string myname='vineet';
        Account accc=new account(name='practo pvt ltd',industry='Banking');
        name=JSON.serialize(myname);
        acc=JSON.serialize(accc);
    }

}