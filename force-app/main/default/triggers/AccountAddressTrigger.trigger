trigger AccountAddressTrigger on Account (before insert) {

    for (account a: Trigger.New)
    {
        if  (a.BillingPostalCode!=null )
        {
            if(a.Match_Billing_Address__c==true )
            {
            a.ShippingPostalCode=a.BillingPostalCode;
            }
        }
        
    }
    
    
    
}