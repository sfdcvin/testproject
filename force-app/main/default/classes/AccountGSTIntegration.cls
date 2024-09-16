public class AccountGSTIntegration {
    public account acc;
    public String gstNumber {get;set;}
    String Key_Secret='VSwR0rpiFrSI8h3sTJltU2bVyum2';
    public AccountGSTIntegration(ApexPages.StandardController controller)
    {
        acc=(Account)controller.getRecord();
    }
    
    public void getGSTData()
    {
        try{
            Http Https=New Http();
            HttpRequest req=New HttpRequest();
            //Endpoint: https://appyflow.in/api/verifyGST?gstNo=GST_NUMBER_HERE&key_secret=KEY_SECRET_HERE
            String endPoint;
            endPoint ='https://appyflow.in/api/verifyGST?';
            endPoint=endPoint+'gstNo='+gstNumber+'&key_secret='+Key_Secret;
            req.setMethod('GET'); 
            req.setEndpoint(endpoint);
            req.setHeader('Content-Type', 'application/json');
            HttpResponse res=New HttpResponse();
            res=https.send(req);
            System.debug(res);
            if(res.getStatusCode()==200)
            {
                System.debug('Status--Code--'+res.getStatusCode());
                System.debug('Status--'+res.getStatus());
                System.debug('Status--'+res.getBody());
                
                JSON2Apex  j2a= (JSON2Apex) System.JSON.deserialize(res.getBody(), JSON2Apex.Class);
                if(j2a.success==true)
                {
                    acc.gstn__c=j2a.taxpayerInfo.gstin;
                    acc.Legal_Name_of_Business__c=j2a.TaxpayerInfo.lgnm;
                    acc.Trade_Name_of_Business__c=j2a.TaxpayerInfo.tradeNam;
                    acc.GSTN_Status__c=j2a.TaxpayerInfo.sts;
                }
                Else
                {
                    System.debug('Error--'+j2a.error);
                    ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.Error, j2a.message);
                    ApexPages.addMessage(msg);                }
            }
            else
            {
                System.debug(' httpResponse ' + res.getBody() ); 
                throw new CalloutException( res.getBody() ); 
            }
            
        }catch(System.Exception e)
        {
            System.debug(e);
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.Error, e.getMessage());
            ApexPages.addMessage(msg);            
        }              
    }
}