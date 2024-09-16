trigger Account_Trigger_atm on Account (after insert) {

     //List<AccountTeamMember> shares=new List<AccountTeamMember>();
    User u=[select id from User where alias='akhan'];
    for(Account a:Trigger.new)
    {
        
        if(a.AnnualRevenue>50000)
        {
        AccountTeamMember atm=new AccountTeamMember();
        atm.AccountId=a.id;
        atm.UserId=u.id;
        atm.AccountAccessLevel='all';
        atm.TeamMemberRole='Account Manager';
        insert atm;
        }
    }  
     
}