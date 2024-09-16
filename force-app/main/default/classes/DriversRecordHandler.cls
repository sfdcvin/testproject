without sharing public   class DriversRecordHandler {
    
    @AuraEnabled
        public static void saveDriverRecord(List<Driver_Record__c> driverRecord, String docId)
        {
                system.debug('Hi Vineet');

            Try{
            insert driverRecord;
            ContentDocumentLink cdl = new ContentDocumentLink();
cdl.ContentDocumentId = docId;
cdl.LinkedEntityId = driverRecord[0].Id;
cdl.ShareType = 'V';
            }Catch(Exception e)
            {
                system.debug('Exception :'+e.getMessage());
            }
//insert cdl;
        }
    
    @AuraEnabled

        public static List<Driver_Record__c> getDriverRecord()
        {
            return [Select Name,AVI_Driver_Rec_Type__c from Driver_Record__c];
        }
    }