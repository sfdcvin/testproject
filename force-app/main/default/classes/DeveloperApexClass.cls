public class DeveloperApexClass {
    
    @auraEnabled
    public static List < String > getIndustry( )
    {
               List<String> options = new List<String>();
        Schema.DescribeFieldResult fieldResult = developer__C.country__C.getDescribe();
        List<Schema.PicklistEntry> pList = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pList) {
            options.add(p.getLabel());
        }
        return options;
    }
    
    @auraEnabled
    public static void saveDeveloper(Developer__C dev)
    {
        insert dev;
    }

}