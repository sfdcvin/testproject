public class Sosl_example1 {
  public  List<Account> accounts  {set;get;}
  public  List<Contact> contacts  {set;get;}

    public Sosl_example1(){
            List<List<sobject>> result =	[FIND 'vineet' IN ALL Fields RETURNING Account(name,Industry),contact(name, phone,email)];
             accounts=(List<Account>)result[0];
            contacts=(List<Contact>)result[1];
    }
}