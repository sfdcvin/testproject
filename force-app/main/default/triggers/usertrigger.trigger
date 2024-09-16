trigger usertrigger on User (before insert) {
    for(user u:trigger.new)
    {
    system.debug(u.firstname+' '+u.PROFILE);
    system.debug(u.firstname+' '+u.ProfileId);        
    }

}