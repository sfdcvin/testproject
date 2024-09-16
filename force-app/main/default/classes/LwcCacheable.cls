public class LwcCacheable {
    @AuraEnabled(cacheable=true)
    public static  void casheTest()
    {
        Account a=[select id,name from account where id='0017F00002Mo5YQ'];
        update a;
    }

}