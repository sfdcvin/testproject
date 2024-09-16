@RestResource(urlMapping='/updateOpportunity/*')
global class Rest_PutAPI {

    @HttpPatch
    
    global static String updateOpportunity(String oppId, String oppStage)
    {
        Opportunity opp;
        If(String.isNotBlank(oppId) && String.isNotBlank(oppStage))
        {
        opp=[Select id,stagename from opportunity where id=:oppId];
        opp.stagename=oppStage;
        update opp;
        return opp.id;
        }
        else
         return '';

    }
}