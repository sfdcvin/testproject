public class Schudule_class implements schedulable {
    
    public void execute(SchedulableContext sc)
    {
        
        Account a=[select id from Account where Name='tata steel pvt ltd'];
        delete a;
    }
}