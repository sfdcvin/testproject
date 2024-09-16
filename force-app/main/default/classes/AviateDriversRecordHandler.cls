public without sharing class AviateDriversRecordHandler {
    
    @AuraEnabled
    public static String insertDriversRecord(Integer progress,String voilationCheck,String impairedCheck,List<VoilationWrapperClass> voilationList,List<ImpairedWrapperClass> impairedList)
    {

        user usrrecord = [SELECT Id, ContactId FROM User where id =:UserInfo.getUserId() limit 1 ];
        Try{
            Contact con=[SELECT Id,AVI_Traffic_Driving_Impaired__c,AVI_Traffic_Infraction_Ind__c FROM Contact
                         WHERE Id=:usrrecord.ContactId LIMIT 1];
            con.AVI_Traffic_Infraction_Ind__c=voilationCheck=='Yes'?true:false;
            con.AVI_Traffic_Driving_Impaired__c=impairedCheck=='Yes'?true:false;
            con.AVI_Driver_Record_Progress__c=progress;
            update con;
        }Catch(Exception e)
        {
            System.debug('Error 1');
            System.debug('Error :'+e.getMessage());
            
        }
        
        system.debug(voilationList);
        system.debug(impairedList);
        List<Driver_Record__c> DriversList=new  List<Driver_Record__c>();    //to be insert
        List<Driver_Record__c> driversListUpdate=new  List<Driver_Record__c>();    //to be update
        Try{
            if(voilationList.size()>0)
            {
                for(VoilationWrapperClass vwc:voilationList)
                {
                    system.debug('inside for of voilation :');

                    system.debug('vwc.recordId :'+vwc.recordId);
                    Driver_Record__c dr=new Driver_Record__c();
                    if(vwc.disposition!=NULL && !String.isBlank(vwc.disposition))
                    {
                        dr.AVI_Driver_Rec_Disposition__c =vwc.disposition;
                    }
                    if(vwc.voilationDate!=NULL && vwc.voilationDate!='' )
                    {
                    dr.AVI_Driver_Rec_Date__c=date.parse(vwc.voilationDate);
                    }
                    if(vwc.state!=NULL && !String.isBlank(vwc.state) )
                    {
                    dr.AVI_Driver_Rec_State__c=vwc.state;
                    }
                    if(vwc.city!=NULL  && !String.isBlank(vwc.city))
                    {
                    dr.AVI_Driver_Rec_City__c=vwc.city;
                    }
                    if(vwc.county!=NULL && !String.isBlank(vwc.county))
                    {
                    dr.AVI_Driver_Rec_County__c=vwc.county;
                    }
                    if(vwc.EntryPageFlag==true)
                    {
                        dr.EntryPageFlag__c=true;
                    }
                    else{
                        dr.EntryPageFlag__c=false;
                    }
                    dr.AVI_Driver_Rec_Type__c='Infraction';
                    system.debug('Hi 1');
                    dr.Participant__c=usrrecord.ContactId; 
                    system.debug('Hi 2');
                    if(vwc.recordId==NULL  || String.isBlank(vwc.recordId) || String.isEmpty(vwc.recordId))
                    {
                        system.debug('If');
                    system.debug('Hi 2666666666666');

                        DriversList.add(dr);  
                    }
                    else{
                        system.debug('else bbbbbbbbbbbbb');
                        dr.Id=vwc.recordId;    
                        driversListUpdate.add(dr);    
                    }
                    
                }    
            }
            system.debug('impairedList.size() :'+impairedList.size());
            if(impairedList.size()>0)
            {
                for(ImpairedWrapperClass vwc:impairedList)
                {
                    Driver_Record__c dr=new Driver_Record__c();
                    if(vwc.impairedDate!=NULL && vwc.impairedDate!='')
                    {
                    dr.AVI_Driver_Rec_Date__c= date.parse(vwc.impairedDate);
                    system.debug('dr.AVI_Driver_Rec_Date__c :'+dr.AVI_Driver_Rec_Date__c);
                    }
                    if(vwc.impairedDescription!=NULL && !String.isBlank(vwc.impairedDescription))
                    {
                    dr.AVI_Description__c=vwc.impairedDescription;
                    }
                    dr.AVI_Driver_Rec_Type__c='Driving while impaired';
                    if(vwc.EntryPageFlag==true)
                    {
                        dr.EntryPageFlag__c=true;
                    }
                    else{
                        dr.EntryPageFlag__c=false;
                    }
                    dr.Participant__c=usrrecord.ContactId; 
                    if(vwc.recordId==NULL  || String.isBlank(vwc.recordId) || String.isEmpty(vwc.recordId) )
                    {
                        DriversList.add(dr);  
                    }
                    else{
                        dr.Id=vwc.recordId;
                        system.debug('Record dr :'+dr);
                        driversListUpdate.add(dr);    
                    }
                }
            }
            
            if(DriversList.size()>0)
            {
                insert DriversList;
                system.debug('Insert :');
            }
            
            if(driversListUpdate.size()>0)
            {
                update driversListUpdate;
                system.debug('update :');

            }
        }catch(Exception e)
        {
            System.debug('Error 2');

            System.debug('Error :'+e.getMessage());
        }
        
        return 'Drivers Records Created Successfully';
    }
    
    
    
    @AuraEnabled
    public static List<VoilationWrapperClass> getDriverVoilationData(){
        user usrrecord = [SELECT Id, ContactId FROM User where id =:UserInfo.getUserId() limit 1 ];
        List<Driver_Record__c> infractionRecord=new List<Driver_Record__c>();
        infractionRecord=[SELECT Id,EntryPageFlag__c,AVI_Driver_Rec_Disposition__c,AVI_Driver_Rec_Date__c,AVI_Driver_Rec_Type__c,AVI_Description__c,AVI_Driver_Rec_State__c,AVI_Driver_Rec_State__r.Name,AVI_Driver_Rec_County__c,AVI_Driver_Rec_City__c,Lastmodifieddate from Driver_Record__c where Participant__c=:usrrecord.contactId AND AVI_Driver_Rec_Type__c='Infraction' ORDER BY Lastmodifieddate DESC];
        List<VoilationWrapperClass> dataToBeSent=new List<VoilationWrapperClass>();
        Integer index=-1;
        for(Driver_Record__c dr:infractionRecord)
        {
            index++;
            VoilationWrapperClass vwc=new VoilationWrapperClass();
            vwc.voilationDate=String.valueOf(dr.AVI_Driver_Rec_Date__c);
            vwc.county=dr.AVI_Driver_Rec_County__c;
            vwc.city=dr.AVI_Driver_Rec_City__c;
            vwc.state=dr.AVI_Driver_Rec_State__c;
            vwc.statelabel=dr.AVI_Driver_Rec_State__r.Name;
            vwc.disposition=dr.AVI_Driver_Rec_Disposition__c;
            vwc.EntryPageFlag=dr.EntryPageFlag__c;
            vwc.index=index;
            vwc.recordId=dr.Id;
            dataToBeSent.add(vwc);
        }
        return dataToBeSent;
    }
    
    @AuraEnabled(cacheable=true)
    public static List<ImpairedWrapperClass> getDriverImpairedData(){
        user usrrecord = [SELECT Id, ContactId FROM User where id =:UserInfo.getUserId() limit 1 ];
        List<Driver_Record__c> impairedRecord=new List<Driver_Record__c>();
        impairedRecord=[SELECT Id,EntryPageFlag__c,AVI_Driver_Rec_Disposition__c,AVI_Driver_Rec_Date__c,AVI_Driver_Rec_Type__c,AVI_Description__c from Driver_Record__c where Participant__c=:usrrecord.contactId AND AVI_Driver_Rec_Type__c='Driving while impaired'];
        List<ImpairedWrapperClass> dataToBeSent=new List<ImpairedWrapperClass>();
        Integer index=-1;
        for(Driver_Record__c dr:impairedRecord)
        {
            index++;
            ImpairedWrapperClass iwc=new ImpairedWrapperClass();
            iwc.impairedDate=String.valueOf(dr.AVI_Driver_Rec_Date__c);
            iwc.impairedDescription=dr.AVI_Description__c;
            iwc.EntryPageFlag=dr.EntryPageFlag__c;
            iwc.recordId=dr.Id;
            iwc.index=index;
            dataToBeSent.add(iwc);
        }
        return dataToBeSent;
    } 
    
    
    @AuraEnabled(cacheable=true)
    public static Contact getContactData(){
        user usrrecord = [SELECT Id, ContactId FROM User where id =:UserInfo.getUserId() limit 1 ];
        Contact con=[SELECT Id,AVI_Traffic_Infraction_Ind__c,AVI_Traffic_Driving_Impaired__c,AVI_Driver_Record_Progress__c from Contact where Id=:usrrecord.ContactId];
        return con;
    }  
    
    @AuraEnabled()
    public static void deleteDriverRecord(String recordId){
        System.debug('recordId :'+recordId);
        Delete [SELECT Id from Driver_Record__c where Id=:recordId];
    }  
    
    public class VoilationWrapperClass{
        @AuraEnabled  public String  voilationDate {get;set;}
        @AuraEnabled  public string county {get;set;}
        @AuraEnabled  public string city {get;set;}
        @AuraEnabled  public string state {get;set;}
        @AuraEnabled  public string statelabel {get;set;}
        @AuraEnabled  public string disposition {get;set;}
        @AuraEnabled  public integer index {get;set;}
        @AuraEnabled  public string recordId {get;set;}
        @AuraEnabled  public boolean EntryPageFlag {get;set;}

    }
    public class ImpairedWrapperClass{
        @AuraEnabled  public String  impairedDate {get;set;}
        @AuraEnabled  public string  impairedDescription {get;set;}
        @AuraEnabled  public integer  index {get;set;}
        @AuraEnabled  public string recordId {get;set;} 
        @AuraEnabled  public boolean EntryPageFlag {get;set;}

    }   
    
}