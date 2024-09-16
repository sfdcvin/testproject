public class Collapsable_Apex {
    public list<account> accs{get;set;}
    public list<contact> contacts{get;set;}
    public boolean showContacts{get;set;}
    public list<opportunity> Opportunities{get;set;}
    public boolean  showOpportunities{get;set;}
    public Boolean showMessage {set;get;}
        public Boolean showId {set;get;}
            public Boolean showRelated {set;get;}
    public string accId{get;set;}
     public Boolean show{get;set;}
    public Collapsable_Apex(){
        accs=[select id,name from account limit 20];  
        contacts=new list<contact>();
        Opportunities=new list<opportunity>();
        showContacts=false;
        showOpportunities=false;
    }
    
    public void hide()
    {
       //showId=false;
        show=false;
       // showRelated=false;
    }
    public void relatedList(){
        contacts=[select id,firstname,lastname from contact where accountId=:accId ];  
        showContacts=contacts.size()>0?true:false;
         opportunities=[select id,name,stagename from opportunity where accountId=:accId ];  
        showOpportunities=opportunities.size()>0?true:false;
        
        if(contacts.size()==0 && opportunities.size()==0)
        {
            show=false;
            showMessage=true;
            showRelated=false;
        }
        else
        {
        show=true;
        showRelated=true;
            
            
        }  
        showId=true;
    }
    
    

}