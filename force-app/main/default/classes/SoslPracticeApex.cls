public class SoslPracticeApex {
public    list<account> userRecordList {get;set;}
    public string input {get;set;}
    public SoslPracticeApex()
    {
        userRecordList=new list<account>();
    }
    public void callMe()
    {
     if(input.length()>1)
     {
        string s=input+'*';
        list<list<Sobject>> listsss=[Find :s in all fields returning account(name) ,lead(name)];
        userRecordList=listsss[0];
       // system.debug(userRecordList);
     }
        else
        {
            userRecordList.clear();
        }
    }
    
}