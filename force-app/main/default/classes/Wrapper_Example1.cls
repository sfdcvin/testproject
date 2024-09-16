public class Wrapper_Example1 {
    public List<Wrapper_class1> wc {set;get;}
    
    public Wrapper_Example1(){
      wc=new List<Wrapper_class1>();
        List<Account> acc1=[select Id,Name,(select Lastname,firstname,email from contacts) from Account];
        for(Account a:acc1)
        {
            Wrapper_class1 wc1=new Wrapper_class1();
            wc1.accounts=a;
            wc1.contacts=a.contacts;
            wc.add(wc1);
         }
    }

}