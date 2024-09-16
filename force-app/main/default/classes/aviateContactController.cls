/************************************************************************************

************************************************************************************/

public without sharing class aviateContactController {

    @AuraEnabled (cacheable=true)
    public static List<Aviate_State__c> getUSStates() {
        return [SELECT Id, Name FROM Aviate_State__c where Aviate_Country__r.Name ='United States'];
    } 
}