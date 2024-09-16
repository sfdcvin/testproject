public class SaveEmailsToActivityHistory {
    
    // method will be called through flow and  will send an email.
    @InvocableMethod(label='Send Email and Save in Activity History')   
    public static void sendEmailandSavetoActivityHistory(List<EmailInformation> dataValues)
    {
        If(dataValues!=NULL){
            If(dataValues[0].emailTemplateDevName!=NULL && dataValues[0].emailId!=NULL && dataValues[0].recordId!=NULL)
            {
                Try{           
                    List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();
                    Messaging.SingleEmailMessage theMessage = new Messaging.SingleEmailMessage();
                    
                    
                    EmailTemplate template = [SELECT id FROM EmailTemplate WHERE developername=:dataValues[0].emailTemplateDevName]; // get the record id of email template
                    theMessage.setTemplateId(template.Id); // passing email template id
                    
                    theMessage.setTargetObjectId(dataValues[0].recordId);  // passing target record id
                    List<String> toAddress = new List<String>();
                    toAddress.add(dataValues[0].emailId);
                    theMessage.setToAddresses(toAddress);
                    /*theMessage.setOrgWideEmailAddressId('pass me an email id');  keep the email address here if email will be sent 
                                                 from any specific email id from org wide email adresses */
                    theMessage.setSaveAsActivity(true);
                    messages.add(theMessage);
                    Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
                }Catch(Exception e)
                {        
                    System.debug(e.getMessage());
                }
            }
        }
    }
    
    public class EmailInformation
    {
        @InvocableVariable (label='Email Template Developer Name' description='pass developer name of email template to this variable' required=true)
        public String emailTemplateDevName; //Email Template Unique Name (Developer Name)
        @InvocableVariable (label='Record ID' description='pass Id of the record to this variable' required=true)
        public String recordId;  //Id of the target record
        @InvocableVariable (label='Reciever Email Id' description='pass Email Id to this variable' required=true)
        public String emailId;  //receiver email id
    }
}