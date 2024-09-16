trigger ContactTrigger on Contact (before insert,before update, after undelete) {
    Set<String> emails=new Set<String>();
    For(Contact c:Trigger.new)
    {
        if(c.email!=NULL)
        emails.add(c.email);
    }
    
    List<AggregateResult> ar=[Select email from contact where email IN:emails GROUP BY email];
    Set<String> availableemails=new Set<String>();
    for(AggregateResult ar:ar)
    {
        availableemails.add((String)ar.get('email'));
    }
    For(Contact c:Trigger.new)
    {
        if(c.email!=NULL)
        {
        if(availableemails.contains(c.email))
        {
            c.addError('Duplicate Contact');
        }
        else
        {
            availableemails.add(c.email);
        }
        }
    }

}