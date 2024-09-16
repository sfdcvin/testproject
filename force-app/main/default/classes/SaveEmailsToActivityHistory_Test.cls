@isTest
public class SaveEmailsToActivityHistory_Test {

    @isTest
    public static void sendEmailandSavetoActivityHistoryTestMethod()
    {
        Lead leadRecord=new Lead();
        leadRecord.LastName='abc';
        leadRecord.Email='abc@gmail.com';
        leadRecord.Company='xyz';
        insert leadRecord;
        
        List<SaveEmailsToActivityHistory.EmailInformation> emailInfoList=new List<SaveEmailsToActivityHistory.EmailInformation>();
        SaveEmailsToActivityHistory.EmailInformation emailInfo=new SaveEmailsToActivityHistory.EmailInformation();
        emailInfo.emailTemplateDevName='abc';
        emailInfo.recordId=leadRecord.Id;
        emailInfo.emailId=leadRecord.Email;
        
        emailInfoList.add(emailInfo);
        SaveEmailsToActivityHistory.sendEmailandSavetoActivityHistory(emailInfoList);
    }
}