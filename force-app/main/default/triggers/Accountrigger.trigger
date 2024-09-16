trigger Accountrigger on Account (before insert) {
    new WU_WorkUnitHandler('Account');

}