trigger ForOpportunity on Opportunity (after insert,after update,after delete) 
{


   if(Trigger.isInsert)
   {
      ForOpportunityTriggerHandler.afterInsert(Trigger.New);

   }
   if(Trigger.isUpdate)
   {
      ForOpportunityTriggerHandler.afterUpdate(Trigger.New);
   }
   if(Trigger.isDelete)
   {
       ForOpportunityTriggerHandler.afterDelete(Trigger.Old);
   }


}