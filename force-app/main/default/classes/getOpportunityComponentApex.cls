public class getOpportunityComponentApex {

    @AuraEnabled
    public static List<Opportunity> getOpportunity()
    {
        return [Select id,name,stagename from Opportunity];
    }
}