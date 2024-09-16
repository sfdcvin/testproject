// Trigger Handler
public with sharing class ForOpportunityTriggerHandler
{
          private static Set<Id> accountIds ;
          private  static decimal amount;
   public static void afterInsert(List<Opportunity>  newList)
    {
        accountIds = new Set<Id>();
         amount=0.0;
    
     try {
               for(opportunity op:newList)
                  {
                     if(op.accountId!=null){
                     accountIds.add(op.accountId);
                     }
                  }  
                 List<Account> acc = [select id,total_amount__c,(select id,amount__c from opportunities) 
                                          from account where id IN :accountIds ];
                     
                for(Account ac :acc)
                {
                    for(Opportunity opp:ac.opportunities)
                    {       
                            amount =amount+opp.amount__c;
                    }
                   ac.total_amount__c=amount;
                }
                    
                update acc;
            }
             catch (Exception e) {
                    System.debug(e);
                }
    }

public static void afterUpdate(List<Opportunity>  newList)
{
   accountIds = new Set<Id>();
     amount=0.0;
  try {
           for(Opportunity op:newList)
              {
                 if(op.AccountId!=null){
                 accountIds.add(op.accountId);
                 }
              }  
                 List<Account> acc = [select id,total_amount__c,(select id,amount__c from Opportunities) 
                                      from Account where id IN :accountIds ];
                 
            for(Account ac :acc)
            {
               for(Opportunity opp:ac.Opportunities)
                { 
                        amount =amount+opp.amount__c;
              }
               ac.total_amount__c=amount;
            }
            update acc;
        }
         catch (Exception e) {
                System.debug(e);
            }    
}

public static void afterDelete(List<Opportunity>  oldList)
{
    accountIds = new Set<Id>();
     amount=0.0;
 try {
           for(Opportunity op:oldList)
              {
                 if(op.AccountId!=null){
                 accountIds.add(op.accountId);
                 }
              }  
                    
                 List<Account> acc = [select id,total_amount__c,(select id,amount__c from Opportunities) 
                                      from Account where id IN :accountIds ];      
            for(Account ac :acc)
            {
              for(Opportunity opp:ac.Opportunities)
                {
                        amount =amount+opp.amount__c;    
                }
               ac.total_amount__c=amount;
            }
            update acc;
        }
         catch (Exception e) {
                System.debug(e);
            }
}
}