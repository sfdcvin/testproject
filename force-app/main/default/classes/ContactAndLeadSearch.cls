public class ContactAndLeadSearch {
    public static  List<List< SObject>> searchContactsAndLeads(string str)
    {
      
        List<List<Sobject>>   soslList =[Find :str in All Fields returning contact(firstname where lastname='smith'),lead(firstname where lastname='smith')];
        List<contact> acc=(List<contact>)soslList[0];
        List<lead> lead=(List<lead>)soslList[1];
        return  soslList;
    }
}