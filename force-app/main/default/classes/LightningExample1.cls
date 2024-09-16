public class LightningExample1 {
    @auraEnabled
    
    
    
    public static Account getData(string name1){
        string query='select id,name,industry from account where name=:'+name1;
        Account acc=(Account)Database.query(query);
        return acc;
    }

}