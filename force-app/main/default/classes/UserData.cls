public class UserData {
    list<SelectOption> cities ;
    list<SelectOption> departments  ;
    public String selectedCity {get;set;}
    public String selectedDepartment {get;set;}
    public String searchByName {get;set;}
    public List<User> userRecordList {get;set;}
    
    public  UserData()
    {
        System.debug('hello con');
        // userRecordList=[select name,city,department from user];
        cities=new list<SelectOption>();
        departments= new list<SelectOption>();
        cities.add(new SelectOption('None','None'));
        departments.add(new SelectOption('None','None'));
        userRecordList=new List<User>();
        
        Set<SelectOption> citinames =new Set<SelectOption>() ;
        Set<SelectOption> departmentnames =new Set<SelectOption>()  ;
        for(User u:[select name,city,department from user])
        {
            if(u!=null)
            {
                if(u.city!=null )
                {
                    citinames.add(new SelectOption(u.city,u.city));  
                }
                
                if(u.Department!=null)
                {
                    departmentnames.add(new SelectOption(u.department,u.department));   
                }
            }                   
        }
        cities.addAll(citinames);
        departments.addAll(departmentnames);
    }
    
    // getter  to get cities
    public list<SelectOption> getCities()
    {
        return cities;
    }
    // getter to get departments
    public list<SelectOption> getDepartments()
    {
        return departments;
    }
    
    public void records()
    {
        
        system.debug('aaaaaaaaaaaaaa');
        if(selectedCity !='None' && selectedDepartment=='None'  )
        {
            system.debug('aaaaaaaaaaaaaa');
            userRecordList.clear();
            userRecordList=[select name,city,department from user where city=:selectedCity];
            selecteddepartment='None';
            searchByName=null;
        }
        else if(selectedCity !='none' && selectedDepartment!='none' ) 
        {
            userRecordList.clear();
            userRecordList=[select name,city,department from user where city=:selectedCity AND department=:selectedDepartment];
            searchByName=null;
        }    
    }
    
    public void search()
    {
       if(searchByName!=null  )
        {
            if(searchByName!='')
            {
                userRecordList.clear();
               // searchByName=searchByName+'%';
               // userRecordList=[select name,city,department from user where name like :searchByName];
               
                searchByName=searchByName;
               list<list<user>> listsss=[Find :searchByName in all fields returning User(name,city,department)];
           userRecordList=listsss[0];
               // searchByName=null;
                //selectedCity='None';
                //selectedDepartment='None';
            }
            else
            {
                userRecordList.clear();
                //searchByName=null;
                //selectedCity='None';
                //selectedDepartment='None';
            }
            
        }
    }
    
}