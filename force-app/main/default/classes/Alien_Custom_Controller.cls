public class Alien_Custom_Controller {
       private  string sortorder='name';
   
 
    public list<account> getAccounts()
    {
        
        return Database.query('select name,industry from account order by '+sortorder+ ' ASC ');
    }
    public void sortByName() {
    this.sortOrder = 'Name';
}
    
public void sortByindustry() {
    this.sortOrder = 'industry';
}
    
}