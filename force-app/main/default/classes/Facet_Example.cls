public class Facet_Example {
    public List<Account> acc {set;get;}
    public Facet_Example(){
        acc=[select id,name,type from Account];
    }
    
    

}