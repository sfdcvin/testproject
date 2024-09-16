public class CustomController1 {
    
    List<Studen__c> lsls=[select Name,FirstName__c,LastName__c,Course__c from Studen__c];
    
    public List<Studen__c> getlsls()
    {
        return lsls;
    }

}