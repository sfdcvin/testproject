trigger OppCustomIDTrigger on Opportunity (before insert) {
   
   
    
  //  Map <Id,Integer> maps=new Map <Id,Integer>();
    Integer oppNo=[Select count() from opportunity where createddate = THIS_MONTH ];
         for(Opportunity opp : Trigger.new)
    {
        If(opp.stagename!='Closed Won')
        {
        oppNo=oppNo+1;
      //  opp.Opportunity_Custom_Id__c=System.Today().year()+'-'+System.Today().month()+'-'+(000000+oppNo);
        String Key=String.valueOf(oppNo);
        opp.Opportunity_Custom_Id__c=System.Today().year()+'-'+String.valueOf(System.Today().month()).leftPad(2, '0')+'-'+Key.leftPad(6, '0');
        }
        
    }

}