trigger MondayTrigger on Account (before insert) {
for(Account ac:Trigger.new)
{
    ac.industry='Banking';
}
}