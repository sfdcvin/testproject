public class accountfiltercon {
    Public string selectedname{get;set;}
        Public List<Selectoption> getselectedaccnamefields(){
            List<Selectoption> lstnamesel = new List<selectoption>();
            lstnamesel.add(new selectOption('', '- None -'));
            for(Account acc :[SELECT id,name,phone,type,industry FROM Account]){
            lstnamesel.add(new selectoption(acc.id,acc.name));
            }
            return lstnamesel; 
        }
}