public with sharing class AccountPaginationController{
    
    //variables used in page.
    Public Integer size{get;set;}
    Public Integer noOfRecords{get; set;}
    public List<SelectOption> paginationSizeOptions{get;set;}
    public static final Integer QUERY_LIMIT = 10000;
    public  Integer PAGE_SIZE {set;get;}
    public string searchByString {set;get;}
    // wrapper class variables
    public List <WrapperClass> wrapperRecordList{get;set;}
    public List <ContactWrapperClass> contactWrapperRecordList{get;set;}
    public List <OpportunityWrapperClass> OpportunityWrapperRecordList{get;set;}
    public List <CaseWrapperClass> CaseWrapperRecordList{get;set;}
    public List <TaskWrapperClass> TaskWrapperRecordList{get;set;}
    public List <EventWrapperClass> EventWrapperRecordList{get;set;}
    public List <OpportunityContactRoleWrapperClass> OpportunityContactRoleWrapperRecordList{get;set;}  
    public List <OpportunityProductWrapperClass> OpportunityProductWrapperRecordList {get;set;}
    
    // map variables for holding selection of records on click checkboxes
    Map<Id, WrapperClass> mapHoldingSelectedRecords{get;set;}
    Map<Id, ContactWrapperClass> mapHoldingSelectedContactRecords{get;set;}
    Map<Id, OpportunityWrapperClass> mapHoldingSelectedOpportunityRecords{get;set;}
    Map<Id, CaseWrapperClass> mapHoldingSelectedCaseRecords{get;set;}
    Map<Id, TaskWrapperClass> mapHoldingSelectedTaskRecords{get;set;}
    Map<Id, EventWrapperClass> mapHoldingSelectedEventRecords{get;set;}
    Map<Id, OpportunityContactRoleWrapperClass> mapHoldingSelectedOpportunityContactRoleRecords{get;set;}
    Map<Id, OpportunityProductWrapperClass> mapHoldingSelectedOpportunityProductRecords {get;set;}
    
    // For Related  
    public list<OpportunityContactRole> opportunityContactRoles {get;set;}
    public list<OpportunityLineItem> opportunityProducts {get;set;}
    public list<Contact> contacts{get;set;}
    public list<Opportunity> Opportunities{get;set;}
    public list<Case> cases{get;set;}
    public list<Task> tasks{get;set;}
    public list<Event> events{get;set;}
    public Task myTask {get;set;}
    public Event myEvent {get;set;}
    
    public Contact childContact {get;set;}
    public Opportunity childOpportunity {get;set;}
    public Case childCase {get;set;}
    public Task childTask {get;set;}
    public Event childEvent {get;set;}
    public OpportunityContactRole childOpportunityContactRole {get;set;}
    public OpportunityLineItem childOpportunityProduct {get;set;}
    public string   accId{get;set;}
    public static Id   IId{get;set;} // not used anywhere
    private string  name;
    
    // variable to store parent in related list
    public  account parentRecord {set;get;}
        // variable to store parent total amount in opportunity
        public Decimal Total {set;get;}
    

    
    public Boolean showContacts{get;set;}
    public Boolean showopportunityContactRoles{get;set;}
    public Boolean showOpportunityProducts{get;set;}
    public Boolean  showOpportunities{get;set;}
    public Boolean  showTasks{get;set;}
    public Boolean  showEvents{get;set;}
    public Boolean  showCases{get;set;}
    public Boolean  showMessage {set;get;}
    public Boolean  showId {set;get;}
    public Boolean  showRelated {set;get;}
    public Boolean  cons {get;set;}
    public Boolean  opps {get;set;}
    public Boolean  cses {get;set;}
    public Boolean  tsks {get;set;}
    public Boolean  evnts {get;set;}
    public Boolean  oppconrole {get;set;}
    public Boolean  oppprod {get;set;}
    public Boolean  show{get;set;}
    public boolean  pbId {get;set;}
    // End Related
    public Boolean create  {get;set;}
    public Boolean showTask  {get;set;}
    public Boolean showEvent  {get;set;}
    public Boolean showCreateContact  {get;set;}
    public Boolean showCreateOpportunity  {get;set;}
    public Boolean showCreateCase  {get;set;}
    public Boolean showCreateTask  {get;set;}
    public Boolean showCreateEvent  {get;set;}
    public Boolean showCreateOpportunityContactRole  {get;set;}  
    public Boolean showCreateOpportunityProduct {get;set;} 
    public Account accStr {set;get;}
    
    public List<Selectoption> selectedaccnamefields {set;get;}
    public string selectedname {set;get;}
    public List<string> Demoselectednames {set;get;}  // This variable is not assigned to Industry Picklist
    public boolean showPicklist {set;get;}
    
    
    public List<Selectoption> selectedFilterFormatForData {set;get;}
    public string selectedFilter {set; get;}
    public Date dat {get;set;}  // This variable is used to select date for dateFormat
    public string dateFormat {get;set;}   // This variable is used to select dateFormat 
    
    public Integer SelectedCount {set;get;}  // This variable is used to count selected records
    
    // Default constructor 
    public AccountPaginationController()
    {
        
    }
    
    //constructor calling init method
    public  AccountPaginationController(ApexPages.StandardController controller)
    {         
        this.accStr = (Account)Controller.getRecord();
        PAGE_SIZE = 10; //default records per page
        mapHoldingSelectedRecords = new Map<Id, WrapperClass>();
        mapHoldingSelectedContactRecords=new Map<Id, ContactWrapperClass>();
        mapHoldingSelectedOpportunityRecords=new Map<Id, OpportunityWrapperClass>();
        mapHoldingSelectedCaseRecords=new Map<Id, CaseWrapperClass>();
        mapHoldingSelectedTaskRecords=new Map<Id, TaskWrapperClass>();
        mapHoldingSelectedEventRecords=new Map<Id, EventWrapperClass>();
        mapHoldingSelectedOpportunityContactRoleRecords=new Map<Id, OpportunityContactRoleWrapperClass>();
        mapHoldingSelectedOpportunityProductRecords=new Map<Id, OpportunityProductWrapperClass>();
        SelectedCount=0;
        init();
        
        ContactWrapperRecordList = new List <ContactWrapperClass>(); 
        OpportunityContactRoleWrapperRecordList=new List<OpportunityContactRoleWrapperClass>();
        OpportunityProductWrapperRecordList=new List<OpportunityProductWrapperClass>();
        OpportunityWrapperRecordList = new List <OpportunityWrapperClass>();
        CaseWrapperRecordList = new List <CaseWrapperClass>();
        TaskWrapperRecordList = new List <TaskWrapperClass>();
        EventWrapperRecordList = new List <EventWrapperClass>();
        myTask=new Task();
        myEvent=new Event();
        childContact=new Contact();
        childOpportunity=new Opportunity();
        childCase=new Case();
        childTask=new Task();
        childEvent=new Event();
        childOpportunityContactRole=new OpportunityContactRole();
        childOpportunityProduct=new OpportunityLineItem();
        // this code For Related
        // contacts=new list<contact>();
        // Opportunities=new list<opportunity>();
        showContacts=false;
        showOpportunities=false;
        pbId=true;
        // End Related  
        selectedaccnamefields=new List<Selectoption>();
        selectedaccnamefields.add(new selectOption('', '--Select--'));
        selectedaccnamefields.add(new selectOption('All', 'All'));
        selectedaccnamefields.add(new selectOption('Education', 'Education'));
        selectedaccnamefields.add(new selectOption('Banking', 'Banking'));
        selectedaccnamefields.add(new selectOption('Biotechnology', 'Biotechnology'));
        selectedaccnamefields.add(new selectOption('Exit', '--Hide--'));
        //----------------------------------------------
        selectedFilterFormatForData=new List<Selectoption>();
        selectedFilterFormatForData.add(new selectOption('', '--Select--'));
        selectedFilterFormatForData.add(new selectOption('AllTime', 'AllTime'));
      //  selectedFilterFormatForData.add(new selectOption('=', '='));
        selectedFilterFormatForData.add(new selectOption('<', '<'));
        selectedFilterFormatForData.add(new selectOption('>', '>'));
        selectedFilterFormatForData.add(new selectOption('<=', '<='));
        selectedFilterFormatForData.add(new selectOption('>=', '>='));
        selectedFilterFormatForData.add(new selectOption('Today', 'Today'));
        selectedFilterFormatForData.add(new selectOption('YESTERDAY', 'Yesterday'));
        selectedFilterFormatForData.add(new selectOption('THIS_WEEK', 'This Week'));
        selectedFilterFormatForData.add(new selectOption('LAST_WEEK', 'Last Week'));
        selectedFilterFormatForData.add(new selectOption('THIS_MONTH', 'This Month'));
        selectedFilterFormatForData.add(new selectOption('LAST_MONTH', 'Last Month'));
        selectedFilterFormatForData.add(new selectOption('LAST_90_DAYS', 'Last 90 Days'));
        selectedFilterFormatForData.add(new selectOption('LAST_N_DAYS:180', 'Last 180 Days'));
        selectedFilterFormatForData.add(new selectOption('THIS_QUARTER', 'This Quarter')); 
        selectedFilterFormatForData.add(new selectOption('LAST_QUARTER', 'Last Quarter'));
        selectedFilterFormatForData.add(new selectOption('THIS_YEAR', 'This Year'));
        selectedFilterFormatForData.add(new selectOption('Last_YEAR', 'Last Year'));
    }
    
    
    //Init method which queries the records from standard set controller.
    public void init()
    {
        wrapperRecordList = new List<WrapperClass>(); 
        for (Account cont : (List<Account>)setCon.getRecords())
        {
            if(mapHoldingSelectedRecords != null && mapHoldingSelectedRecords.containsKey(cont.id))
            {
                wrapperRecordList.add(mapHoldingSelectedRecords.get(cont.id));
            }
            else
            {
                wrapperRecordList.add(new WrapperClass(cont, false));
            }
        }
    }
    
    /** Instantiate the StandardSetController from a query locater*/
    public ApexPages.StandardSetController setCon {
        get {
            if( setCon==null )
            {
                
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id,Name, industry, Phone FROM Account order by name ASC LIMIT : QUERY_LIMIT ]));   
                // sets the number of records to show in each page view
                setCon.setPageSize(PAGE_SIZE);     
            }
            if( setCon!=null )
            { 
                if( selectedname!=null && selectedname!='' )
                {
                    
                    System.debug('if 1');
                    setCon=null;
                    if((dateFormat=='' || dateFormat==null) && searchByString!=null)
                    {
                        if(searchByString=='')
                        {
                            setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id,Name,industry,Phone FROM Account where industry =:selectedname  order by name ASC LIMIT : QUERY_LIMIT ]));  
                            setCon.setPageSize(PAGE_SIZE);
                        }
                        else
                        {
                            system.debug('Hi,vin');
                            setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id,Name,industry,Phone FROM Account where name like : name AND industry =:selectedname  order by name ASC LIMIT : QUERY_LIMIT ])); 
                            setCon.setPageSize(PAGE_SIZE);
                        }
                    }
                    
                    else if(dateFormat=='AllTime' )
                    {
                        
                        setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id,Name,industry,Phone FROM Account where industry =:selectedname  order by name ASC LIMIT : QUERY_LIMIT ]));
                        setCon.setPageSize(PAGE_SIZE);
                    }
                    else if(dateFormat=='<' && dat!=null )
                    {
                        System.debug('error');
                        setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id,Name,industry,Phone FROM Account where industry =:selectedname AND CreatedDate <: dat  order by name ASC LIMIT : QUERY_LIMIT ]));
                        setCon.setPageSize(PAGE_SIZE);
                    }
                    else if(dateFormat=='<=' && dat!=null )
                    {
                        setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id,Name,industry,Phone FROM Account where industry =:selectedname AND CreatedDate <=: dat  order by name ASC LIMIT : QUERY_LIMIT ]));
                        setCon.setPageSize(PAGE_SIZE);
                    }
                    else if(dateFormat=='>' && dat!=null )
                    {
                        setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id,Name,industry,Phone FROM Account where industry =:selectedname AND CreatedDate >: dat  order by name ASC LIMIT : QUERY_LIMIT ]));
                        setCon.setPageSize(PAGE_SIZE);
                    }
                    else if(dateFormat=='>=' && dat!=null )
                    {
                        setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id,Name,industry,Phone FROM Account where industry =:selectedname AND CreatedDate >=: dat  order by name ASC LIMIT : QUERY_LIMIT ]));
                        setCon.setPageSize(PAGE_SIZE);
                    }
                    else
                    {   if(dateFormat!='' && dateFormat!=null )
                    {
                        setCon = new ApexPages.StandardSetController(Database.getQueryLocator('SELECT Id,Name,industry,Phone FROM Account where industry = \''+ selectedname + '\' AND CreatedDate = '+ dateFormat+ ' order by name ASC LIMIT '+ QUERY_LIMIT ));
                        setCon.setPageSize(PAGE_SIZE);
                    }
                    }
                    
                    
                    
                }  
                
                /*        if(setCon != null  && selectedname!=null && selectedname=='All' && dateFormat==null)
{

setCon=null;
setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id,Name,industry,Phone FROM Account   order by name ASC LIMIT : QUERY_LIMIT ]));
// sets the number of records to show in each page view
setCon.setPageSize(PAGE_SIZE);
}  */
                if( dateFormat!=null && dateFormat!=''  && selectedname==null  && searchByString==null )
                {  
                    setCon=null;
                    System.debug(dat);
                    if(dateFormat=='AllTime')
                    {
                        setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id,Name,industry,Phone,createddate FROM Account   order by name ASC LIMIT : QUERY_LIMIT ]));
                        // sets the number of records to show in each page view
                        setCon.setPageSize(PAGE_SIZE);
                        
                    }
                    if(dateFormat=='>=' && dat!=null)
                    {
                        setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id,Name,industry,Phone,createddate FROM Account where  CreatedDate >=: dat  order by name ASC LIMIT : QUERY_LIMIT ]));
                        // sets the number of records to show in each page view
                        setCon.setPageSize(PAGE_SIZE);
                        
                    }
                    if(dateFormat=='<=' && dat!=null)
                    {
                        
                        setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id,Name,industry,Phone,createddate FROM Account where  CreatedDate <=: dat  order by name ASC LIMIT : QUERY_LIMIT ]));
                        // sets the number of records to show in each page view
                        setCon.setPageSize(PAGE_SIZE);
                        
                    }
                    if(dateFormat=='<' && dat!=null)
                    {
                        
                        System.debug(searchByString);
                        setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id,Name,industry,Phone,createddate FROM Account where  CreatedDate <: dat  order by name ASC LIMIT : QUERY_LIMIT ]));
                        // sets the number of records to show in each page view
                        setCon.setPageSize(PAGE_SIZE);
                        
                    }
                    if(dateFormat=='>' && dat!=null)
                    {
                        setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id,Name,industry,Phone,createddate FROM Account where  CreatedDate >: dat  order by name ASC LIMIT : QUERY_LIMIT ]));
                        // sets the number of records to show in each page view
                        setCon.setPageSize(PAGE_SIZE);
                        
                    }
                    if(dateFormat!='<='  && dateFormat!='>=' && dateFormat!='>' && dateFormat!='<' && dateFormat!='AllTime')
                    {
                        setCon = new ApexPages.StandardSetController(Database.getQueryLocator('SELECT Id,Name,industry,Phone,createdDate from Account where createdDate = ' + dateFormat+ ' order by name ASC LIMIT '+ QUERY_LIMIT ));
                        // sets the number of records to show in each page view
                        setCon.setPageSize(PAGE_SIZE);
                    }  
                }
                if( searchByString!=null && searchByString!='' && selectedName==null)
                {
                    setCon = null;
                    name=searchByString+'%';
                    system.debug('String is ' + name);
                    setCon = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id,Name,industry,Phone FROM Account where name like :name order by name ASC LIMIT : QUERY_LIMIT ]));
                    // sets the number of records to show in each page view
                    setCon.setPageSize(PAGE_SIZE);
                }  
            } 
            return setCon;
        }
        set;
    }
        public void CCreateContact()
    {
        showCreateContact=true;
        pbId=false;
    }
     public void CCreateOpportunity()
    {
        showCreateOpportunity=true;
        pbId=false;
    }
     public void CCreateCase()
    {
        showCreateCase=true;
        pbId=false;
    }
     public void CCreateTask()
    {
        showCreateTask=true;
        pbId=false;
    }
     public void CCreateEvent()
    {
        showCreateEvent=true;
        pbId=false;
    }
    public void CCreateOpportunityContactRole()
    {
        showCreateOpportunityContactRole=true;
        pbId=false;
    }
     public void CCreateOpportunityProduct()
    {
        showCreateOpportunityProduct=true;
        pbId=false;
    }
    
    
    
    
    
    public void showTaskMethod()
    {
        showTask=true;
    }
    public void showEventMethod()
    {
        system.debug('createtask');
        showEvent=true;
    }
    public void createTask()
    { 
        List<Task> tList = new List<Task>();
        if(mapHoldingSelectedRecords != null)
        {
            set<id> ids=new set<id>();
            ids=  mapHoldingSelectedRecords.keySet();
            for(ID id:ids)
            {
                Task t = new Task();
                t.OwnerId = myTask.OwnerID;
                t.Subject = myTask.Subject;
                t.Status = myTask.Status ;
                t.Description=myTask.Description;
                t.Priority = myTask.Priority  ;
                t.ActivityDate = myTask.ActivityDate;
                t.WhatId=id;
                tList.add(t);
            }
            if(Schema.sObjectType.Task.fields.OwnerID.IsCreateable() && Schema.sObjectType.Task.fields.Subject.IsCreateable() && Schema.sObjectType.Task.fields.Status.IsCreateable()
               && Schema.sObjectType.Task.fields.Description.IsCreateable() && Schema.sObjectType.Task.fields.Priority.IsCreateable() && Schema.sObjectType.Task.fields.ActivityDate.IsCreateable()
               && Schema.sObjectType.Task.fields.WhatId.IsCreateable()){
                   insert tList; 
               }
            else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Insufficient Privileges'));
            }
        }
        
        myTask.OwnerID=null;
        myTask.Status=null;
        myTask.Priority =null;
        myTask.ActivityDate=null;
        myTask.Description=null;
        showTask=false;
    }
    public void createEvent()
    {  
        System.debug('in event method');
        List<Event> eList = new List<Event>();
        if(mapHoldingSelectedRecords != null)
        {
            set<id> ids=new set<id>();
            ids=  mapHoldingSelectedRecords.keySet();
            for(ID id:ids)
            {
                Event e = new Event();
                e.OwnerId = myEvent.OwnerID;
                e.Subject = myEvent.Subject;
                e.Location = myEvent.Location;
                e.StartDateTime=myEvent.StartDateTime;
                e.EndDateTime = myEvent.EndDateTime;
                e.DurationInMinutes = myEvent.DurationInMinutes;
                e.WhatId=id;
                eList.add(e);
            }
            System.debug('Event Creation');
            if(Schema.sObjectType.Event.fields.OwnerID.IsCreateable() && Schema.sObjectType.Event.fields.Subject.IsCreateable() && Schema.sObjectType.Event.fields.Location.IsCreateable()
               && Schema.sObjectType.Event.fields.StartDateTime.IsCreateable() && Schema.sObjectType.Event.fields.EndDateTime.IsCreateable() && Schema.sObjectType.Event.fields.WhatId.IsCreateable()
              ){
                  insert eList; 
              }
            else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error: Insufficient Privileges '));
            }
            
        }
        
        myEvent.OwnerID=null;
        myEvent.Subject=null;
        myEvent.Location =null;
        myEvent.StartDateTime=null;
        myEvent.EndDateTime=null;
        showEvent=false;
    }
    // This function gets called whenever user changes the size per page from dropdown
    public void   afterSizePageChange()
    {
        setCon=null;
        searchByString=null;
        dateFormat=null;
        selectedname=null;
        init();
    }
    
    /** indicates whether there are more records after the current page set.*/
    public Boolean hasNext {
        get {
            return setCon.getHasNext();
        }
        set;
    }
    
    /** indicates whether there are more records before the current page set.*/
    public Boolean hasPrevious {
        get {
            
            return setCon.getHasPrevious();
        }
        set;
    }
    
    /** returns the page number of the current page set*/
    public Integer pageNumber {
        get {
            return setCon.getPageNumber();
        }
        set;
    }
    
    /** return total number of pages for page set*/
    Public Integer getTotalPages()
    {
        Decimal totalSize = setCon.getResultSize();
        Decimal pageSize = setCon.getPageSize();
        Decimal pages = totalSize/pageSize;
        return (Integer)pages.round(System.RoundingMode.CEILING);
    }
    
    /** returns the first page of the page set*/
    
    // This function gets called whenever checkbox is checked
    public void xyz()
    {
        updateSearchItemsMap();  
        // init();
    }
    // This function gets called when user search a record by a Name
    public void searchRecords()  
    {
        system.debug('I am here');
        dateFormat=null;
        dat=null;
        wrapperRecordList.clear();
        if(setCon.getRecords().size()>0) 
        {
            for (Account cont : (List<Account>)setCon.getRecords()) 
            {
                
                if(mapHoldingSelectedRecords != null && mapHoldingSelectedRecords.containsKey(cont.id))
                {
                    wrapperRecordList.add(mapHoldingSelectedRecords.get(cont.id));
                    searchByString=null;
                }
                else
                {
                    wrapperRecordList.add(new WrapperClass(cont, false));
                    searchByString=null;
                }
            }
        }
        else
        {   
            searchByString=null;
        }
    }
    
    // This method is called when search records by date filter
    public void searchByDatefilter()  
    {
        wrapperRecordList.clear();
        searchByString=null;
        selectedname=null;
        if(setCon.getRecords().size()>0) 
        {
            for (Account cont : (List<Account>)setCon.getRecords()) 
            {
                
                if(mapHoldingSelectedRecords != null && mapHoldingSelectedRecords.containsKey(cont.id))
                {
                    wrapperRecordList.add(mapHoldingSelectedRecords.get(cont.id));
                    //  dateFormat=null;
                    // dat=null;
                }
                else
                {
                    wrapperRecordList.add(new WrapperClass(cont, false));
                    //  dateFormat=null;
                    //  dat=null;
                }
            }
        }
        else
        {  
            dateFormat=null;
            dat=null;
        }
        if(dateFormat !='<' && dateFormat !='<=' && dateFormat !='>' && dateFormat !='>=' )
        {
            dat=null;
        }
        
    }
    
    public void allRecords()
    {
        pbid=true;
        system.debug('I am here');
        wrapperRecordList.clear();
        setCon=null;
        selectedname=null;
        searchByString=null;
        dateFormat=null;
        dat=null;
        mapHoldingSelectedRecords=null;
        if(setCon.getRecords().size()>0) 
        {
            for (Account cont : (List<Account>)setCon.getRecords()) 
            {
                
                if(mapHoldingSelectedRecords != null && mapHoldingSelectedRecords.containsKey(cont.id))
                {
                    wrapperRecordList.add(mapHoldingSelectedRecords.get(cont.id));
                    searchByString=null;
                }
                else
                {
                    wrapperRecordList.add(new WrapperClass(cont, false)); 
                }
            }
        }
    }
    public void findBySelected()
    {
        //  searchByString=null;
        if(selectedname!='exit' )
        {
            system.debug('I am here');
            wrapperRecordList.clear();
            // setCon=null;
            if(setCon.getRecords().size()>0) 
            {
                for (Account cont : (List<Account>)setCon.getRecords()) 
                {
                    
                    if(mapHoldingSelectedRecords != null && mapHoldingSelectedRecords.containsKey(cont.id))
                    {
                        wrapperRecordList.add(mapHoldingSelectedRecords.get(cont.id));
                        showPicklist();
                        selectedname=null;
                    }
                    else
                    {
                        wrapperRecordList.add(new WrapperClass(cont, false));
                        showPicklist();
                        selectedname=null;
                    }
                }
            }
        }
        else
        {
            selectedname=null;
            exit(); 
        }
    }
    
    public void first()
    {
        //updateSearchItemsMap();
        setCon.first();
        init();
    }   
    /** returns the last page of the page set*/
    public void last() 
    {
        // updateSearchItemsMap();
        setCon.last();
        init();
    }  
    /** returns the previous page of the page set*/
    public void previous()
    {
        //updateSearchItemsMap();
        // setCon.save();
        setCon.previous();
        init();
    }
    
    /** returns the next page of the page set*/
    public void next()
    {
        // updateSearchItemsMap();
        //  setCon.save();
        setCon.next();
        init();
    }
    //This is the method which manages to remove the deselected records, and keep the records which are selected in map.
    public void updateSearchItemsMap()
    {
        mapHoldingSelectedRecords.clear();
        for(WrapperClass wrp : wrapperRecordList)
        {
            if(wrp.isSelected){
                mapHoldingSelectedRecords.put(wrp.accountRecord.id, wrp);
            }
            if(wrp.isSelected == false && mapHoldingSelectedRecords.containsKey(wrp.accountRecord.id)){
                mapHoldingSelectedRecords.remove(wrp.accountRecord.id);
            }
        }
        SelectedCount = mapHoldingSelectedRecords.size();
    }
    //This is the method which manages to remove the deselected records, and keep the records which are selected in map.
    public void updateContactSearchItemsMap()
    {
        System.debug('ContactSelect');
        mapHoldingSelectedContactRecords.clear();
        for(ContactWrapperClass conWrp : ContactWrapperRecordList)
        {
            if(conWrp.isSelected){
                System.debug('iamSelected');
                mapHoldingSelectedContactRecords.put(conWrp.contactRecord.id, conWrp);
            }
            if(conWrp.isSelected == false && mapHoldingSelectedContactRecords.containsKey(conWrp.contactRecord.id)){
                 System.debug('iam unSelected');
                mapHoldingSelectedContactRecords.remove(conWrp.contactRecord.id);
            } 
        }
    }
    
    public void updateOpportunitySearchItemsMap()
    {
        System.debug('OpportunitySelect');
        mapHoldingSelectedOpportunityRecords.clear();
        for(OpportunityWrapperClass oppWrp : OpportunityWrapperRecordList)
        {
            if(oppWrp.isSelected){
                System.debug('iamSelected');
                mapHoldingSelectedOpportunityRecords.put(oppWrp.opportunityRecord.id, oppWrp);
            }
            if(oppWrp.isSelected == false && mapHoldingSelectedOpportunityRecords.containsKey(oppWrp.opportunityRecord.id)){
                 System.debug('iam unSelected');
                mapHoldingSelectedOpportunityRecords.remove(oppWrp.opportunityRecord.id);
            } 
        }
    }
    
    public void updateCaseSearchItemsMap()
    {
        System.debug('CaseSelect');
        mapHoldingSelectedCaseRecords.clear();
        for(CaseWrapperClass casWrp : CaseWrapperRecordList)
        {
            if(casWrp.isSelected){
                System.debug('iamSelected');
                mapHoldingSelectedCaseRecords.put(casWrp.caseRecord.id, casWrp);
            }
            if(casWrp.isSelected == false && mapHoldingSelectedCaseRecords.containsKey(casWrp.caseRecord.id)){
                 System.debug('iam unSelected');
                mapHoldingSelectedCaseRecords.remove(casWrp.caseRecord.id);
            } 
        }
    }
    
     public void updateTaskSearchItemsMap()
    {
        System.debug('TaskSelect');
        mapHoldingSelectedTaskRecords.clear();
        for(TaskWrapperClass tskWrp : TaskWrapperRecordList)
        {
            if(tskWrp.isSelected){
                System.debug('iamSelected');
                mapHoldingSelectedTaskRecords.put(tskWrp.taskRecord.id, tskWrp);
                system.debug(mapHoldingSelectedTaskRecords);
            }
            if(tskWrp.isSelected == false && mapHoldingSelectedTaskRecords.containsKey(tskWrp.taskRecord.id)){
                 System.debug('iam unSelected');
                mapHoldingSelectedTaskRecords.remove(tskWrp.taskRecord.id);
            } 
        }
    }
     public void updateEventSearchItemsMap()
    {
        System.debug('EventSelect');
        mapHoldingSelectedEventRecords.clear();
        for(EventWrapperClass eveWrp : EventWrapperRecordList)
        {
            if(eveWrp.isSelected){
                System.debug('iamSelected');
                mapHoldingSelectedEventRecords.put(eveWrp.eventRecord.id, eveWrp);
            }
            if(eveWrp.isSelected == false && mapHoldingSelectedEventRecords.containsKey(eveWrp.eventRecord.id)){
                 System.debug('iam unSelected');
                mapHoldingSelectedEventRecords.remove(eveWrp.eventRecord.id);
            } 
        }
    }
     public void updateOpportunityContactRoleSearchItemsMap()
    {
        System.debug('ocrSelect');
        mapHoldingSelectedOpportunityContactRoleRecords.clear();
        for(OpportunityContactRoleWrapperClass ocrWrp : OpportunityContactRoleWrapperRecordList)
        {
            if(ocrWrp.isSelected){
                System.debug('iamSelected');
                mapHoldingSelectedOpportunityContactRoleRecords.put(ocrWrp.OpportunityContactRoleRecord.id, ocrWrp);
            }
            if(ocrWrp.isSelected == false && mapHoldingSelectedOpportunityContactRoleRecords.containsKey(ocrWrp.OpportunityContactRoleRecord.id)){
                 System.debug('iam unSelected');
                mapHoldingSelectedOpportunityContactRoleRecords.remove(ocrWrp.OpportunityContactRoleRecord.id);
            } 
        }
    }
    
     public void updateOpportunityProductSearchItemsMap()
    {
        try
        {
        mapHoldingSelectedOpportunityProductRecords.clear();
        for(OpportunityProductWrapperClass opWrp : opportunityProductWrapperRecordList)
        {
            if(opWrp.isSelected){
                System.debug('iamSelected');
                mapHoldingSelectedOpportunityProductRecords.put(opWrp.OpportunityProductRecord.id, opWrp);
            }
            if(opWrp.isSelected == false && mapHoldingSelectedOpportunityProductRecords.containsKey(opWrp.OpportunityProductRecord.id)){
                mapHoldingSelectedOpportunityProductRecords.remove(opWrp.OpportunityProductRecord.id);
            } 
        }
        
        }catch(exception e) 
        {
            system.debug(e);
        }
    }
    
    
    // This is the method which gets called whenever a record deleted
    public void deleteRecord()
    {
        if(mapHoldingSelectedRecords != null)
        {
            set<id> ids=new set<id>();
            ids=  mapHoldingSelectedRecords.keySet();
            list<Account> accounts =[select id from account where id in :ids];
            list<WrapperClass> wrppps=new list<WrapperClass>();
            for(WrapperClass wc:wrapperRecordList)
            {
                if(wc.isSelected==true)
                {
                    wrppps.add(wc);
                }
            }
            for(Integer i=0;i<wrppps.size();i++)
            {
                while(wrapperRecordList.contains(wrppps.get(i)))
                {
                    wrapperRecordList.remove(wrapperRecordList.indexOf(wrppps.get(i)));
                }
            }
            if(Schema.sObjectType.Account.IsDeletable() ){
                delete accounts;
            }
            else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error:  Insufficient Privileges'));
            }
            mapHoldingSelectedRecords.clear();
        }  
    } 
    public void deleteContactRecord()
    {
        System.debug('Delete Contact');
        if(mapHoldingSelectedContactRecords != null)
        {
            set<id> ids=new set<id>();
            ids=  mapHoldingSelectedContactRecords.keySet();
            list<Contact> conts =[select id from Contact where id in :ids];
            list<ContactWrapperClass> wrpp=new list<ContactWrapperClass>();
            for(ContactWrapperClass wc:ContactWrapperRecordList)
            {
                if(wc.isSelected==true)
                {
                    wrpp.add(wc);
                }
            }
            for(Integer i=0;i<wrpp.size();i++)
            {
                while(ContactWrapperRecordList.contains(wrpp.get(i)))
                {
                    ContactWrapperRecordList.remove(ContactWrapperRecordList.indexOf(wrpp.get(i)));
                }
            }
            if(Schema.sObjectType.Contact.IsDeletable() ){
                delete conts;
            }
            else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error:  Insufficient Privileges'));
            }
            mapHoldingSelectedContactRecords.clear();
            
        }  
    }
     public void deleteOpportunityRecord()
    {
        System.debug('Delete Opp');
        if(mapHoldingSelectedOpportunityRecords != null)
        {
            set<id> ids=new set<id>();
            ids=  mapHoldingSelectedOpportunityRecords.keySet();
            list<Opportunity> opps =[select id from Opportunity where id in :ids];
            list<OpportunityContactRole> ocr =[select id from OpportunityContactRole where id in :ids];
            list<OpportunityWrapperClass> wrpp=new list<OpportunityWrapperClass>();
            for(OpportunityWrapperClass owc:OpportunityWrapperRecordList)
            {
                if(owc.isSelected==true)
                {
                    wrpp.add(owc);
                }
            }
            for(Integer i=0;i<wrpp.size();i++)
            {
                while(OpportunityWrapperRecordList.contains(wrpp.get(i)))
                {
                    OpportunityWrapperRecordList.remove(OpportunityWrapperRecordList.indexOf(wrpp.get(i)));
                }
            }
            if(Schema.sObjectType.Opportunity.IsDeletable() ){
                delete opps;
            }
            else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error:  Insufficient Privileges'));
            }
            mapHoldingSelectedOpportunityRecords.clear();
            
        }  
    }
     public void deleteCaseRecord()
    {
        System.debug('Delete Case');
        if(mapHoldingSelectedCaseRecords != null)
        {
            set<id> ids=new set<id>();
            ids=  mapHoldingSelectedCaseRecords.keySet();
            list<Case> cses =[select id from Case where id in :ids];
            list<CaseWrapperClass> wrpp=new list<CaseWrapperClass>();
            for(CaseWrapperClass cwc:CaseWrapperRecordList)
            {
                if(cwc.isSelected==true)
                {
                    wrpp.add(cwc);
                }
            }
            for(Integer i=0;i<wrpp.size();i++)
            {
                while(CaseWrapperRecordList.contains(wrpp.get(i)))
                {
                    CaseWrapperRecordList.remove(CaseWrapperRecordList.indexOf(wrpp.get(i)));
                }
            }
            if(Schema.sObjectType.Case.IsDeletable() ){
                delete cses;
            }
            else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error:  Insufficient Privileges'));
            }
            mapHoldingSelectedCaseRecords.clear();
            
        }  
    }
     public void deleteTaskRecord()
    {
        System.debug('Delete Task');
        if(mapHoldingSelectedTaskRecords != null)
        {
            set<id> ids=new set<id>();
            ids=  mapHoldingSelectedTaskRecords.keySet();
            list<Task> tsk =[select id from Task where id in :ids];
            list<TaskWrapperClass> wrpp=new list<TaskWrapperClass>();
            for(TaskWrapperClass twc:TaskWrapperRecordList)
            {
                if(twc.isSelected==true)
                {
                    wrpp.add(twc);
                }
            }
            for(Integer i=0;i<wrpp.size();i++)
            {
                while(TaskWrapperRecordList.contains(wrpp.get(i)))
                {
                    TaskWrapperRecordList.remove(TaskWrapperRecordList.indexOf(wrpp.get(i)));
                }
            }
            if(Schema.sObjectType.Task.IsDeletable() ){
                System.debug(tsk);
                delete tsk;
            }
            else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error:  Insufficient Privileges'));
            }
            mapHoldingSelectedTaskRecords.clear();
            
        }  
    }
     public void deleteEventRecord()
    {
        if(mapHoldingSelectedEventRecords != null)
        { 
            set<id> ids=new set<id>();
            ids=  mapHoldingSelectedEventRecords.keySet();
            list<Event> evnts =[select id from Event where id in :ids];
            list<EventWrapperClass> wrpp=new list<EventWrapperClass>();
            for(EventWrapperClass ewc:EventWrapperRecordList)
            {
                if(ewc.isSelected==true)
                {
                    wrpp.add(ewc);
                }
            }
            for(Integer i=0;i<wrpp.size();i++)
            {
                while(EventWrapperRecordList.contains(wrpp.get(i)))
                {
                    EventWrapperRecordList.remove(EventWrapperRecordList.indexOf(wrpp.get(i)));
                }
            }
            if(Schema.sObjectType.Event.IsDeletable() ){
                try{
                delete evnts;
                }
                catch(Exception e)
                {
                    System.debug(e);
                }
            }
            else {
                 System.debug('Insufficient');
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error:  Insufficient Privileges'));
            }
            mapHoldingSelectedEventRecords.clear();
            
        }  
    }
    
     public void deleteOpportunityContactRoleRecord()
    {
        System.debug('Delete OpportunityContactRole');
        if(mapHoldingSelectedOpportunityContactRoleRecords != null)
        {
            set<id> ids=new set<id>();
            ids=  mapHoldingSelectedOpportunityContactRoleRecords.keySet();
            list<OpportunityContactRole> ocr =[select id from OpportunityContactRole where id in :ids];
            list<OpportunityContactRoleWrapperClass> wrpp=new list<OpportunityContactRoleWrapperClass>();
            for(OpportunityContactRoleWrapperClass owc:OpportunityContactRoleWrapperRecordList)
            {
                if(owc.isSelected==true)
                {
                    wrpp.add(owc);
                }
            }
            for(Integer i=0;i<wrpp.size();i++)
            {
                while(OpportunityContactRoleWrapperRecordList.contains(wrpp.get(i)))
                {
                    OpportunityContactRoleWrapperRecordList.remove(OpportunityContactRoleWrapperRecordList.indexOf(wrpp.get(i)));
                }
            }
            if(Schema.sObjectType.OpportunityContactRole.IsDeletable() ){
                try{
                delete ocr;
                }catch(exception e)
                {System.debug(e);}
            }
            else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error:  Insufficient Privileges'));
            }
            mapHoldingSelectedOpportunityContactRoleRecords.clear();
            
        }  
    }
    
     public void deleteOpportunityProductRecord()
    {
        System.debug('Delete OpportunityProduct');
        if(mapHoldingSelectedOpportunityProductRecords != null)
        {
            set<id> ids=new set<id>();
            ids=  mapHoldingSelectedOpportunityProductRecords.keySet();
            list<OpportunityLineItem> oli =[select id from OpportunityLineItem where id in :ids];
            list<OpportunityProductWrapperClass> wrpp=new list<OpportunityProductWrapperClass>();
            for(OpportunityProductWrapperClass opwc:OpportunityProductWrapperRecordList)
            {
                if(opwc.isSelected==true)
                {
                    wrpp.add(opwc);
                }
            }
            for(Integer i=0;i<wrpp.size();i++)
            {
                while(OpportunityProductWrapperRecordList.contains(wrpp.get(i)))
                {
                    OpportunityProductWrapperRecordList.remove(OpportunityProductWrapperRecordList.indexOf(wrpp.get(i)));
                }
            }
            if(Schema.sObjectType.OpportunityLineItem.IsDeletable() ){
                try{
                delete oli;
                }catch(exception e)
                {System.debug(e);}
            }
            else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error:  Insufficient Privileges'));
            }
            mapHoldingSelectedOpportunityProductRecords.clear();
            
        }  
    }
    
    // This Method gets called whenever a outer/parent record updated 
    public void updateRecord()
    {
        if(mapHoldingSelectedRecords != null)
        {
            list<WrapperClass> wrps=  mapHoldingSelectedRecords.values();
            list<Account> accs=new list<Account>();
            for(WrapperClass wc:wrps)
            {
                accs.add(wc.accountRecord);
            }
            update accs;
            mapHoldingSelectedRecords.clear();
        }
    }
    
    // gets called when update a child contact of account
    public void updateContactRecord()
    {
        system.debug('updateContact');
        if(mapHoldingSelectedContactRecords != null)
        {
            list<ContactWrapperClass> wrps=  mapHoldingSelectedContactRecords.values();
            list<Contact> cons=new list<Contact>();
            for(ContactWrapperClass cwc:wrps)
            {
                cons.add(cwc.contactRecord);
            }
            update cons;
            mapHoldingSelectedContactRecords.clear();
        }
    }
    
     // gets called when update a child opportunity of account
    public void updateOpportunityRecord()
    {
        if(mapHoldingSelectedOpportunityRecords != null)
        {
            list<OpportunityWrapperClass> wrps=  mapHoldingSelectedOpportunityRecords.values();
            list<Opportunity> opps=new list<Opportunity>();
            for(OpportunityWrapperClass owc:wrps)
            {
                opps.add(owc.opportunityRecord);
            }
            update opps;
            mapHoldingSelectedOpportunityRecords.clear();
        }
    }
    
     // gets called when update a child Case of account
    public void updateCaseRecord()
    {
        if(mapHoldingSelectedCaseRecords != null)
        {
            list<CaseWrapperClass> wrps=  mapHoldingSelectedCaseRecords.values();
            list<Case> cses=new list<Case>();
            for(CaseWrapperClass cwc:wrps)
            {
                cses.add(cwc.caseRecord);
            }
            update cses;
            mapHoldingSelectedCaseRecords.clear();
        }
    }
    
     // gets called when update a child Task of account
    public void updateTaskRecord()
    {
        system.debug(mapHoldingSelectedTaskRecords);
        if(mapHoldingSelectedTaskRecords != null)
        {
            list<TaskWrapperClass> wrps=  mapHoldingSelectedTaskRecords.values();
            list<Task> tsks=new list<Task>();
            for(TaskWrapperClass twc:wrps)
            {
                tsks.add(twc.taskRecord);
            }
            update tsks;
            mapHoldingSelectedTaskRecords.clear();
        }
    }
    
     // gets called when update a child Event of account
    public void updateEventRecord()
    {
        if(mapHoldingSelectedEventRecords != null)
        {
            list<EventWrapperClass> wrps=  mapHoldingSelectedEventRecords.values();
            list<Event> evnts=new list<Event>();
            for(EventWrapperClass ewc:wrps)
            {
                evnts.add(ewc.eventRecord);
            }
            update evnts;
            mapHoldingSelectedEventRecords.clear();
        }
    }
    
     public void updateOpportunityContactRoleRecord()
    {
        system.debug('updateOpportunityContactRole');
        if(mapHoldingSelectedOpportunityContactRoleRecords != null)
        {
            list<OpportunityContactRoleWrapperClass> wrps=  mapHoldingSelectedOpportunityContactRoleRecords.values();
            list<OpportunityContactRole> ocr=new list<OpportunityContactRole>();
            for(OpportunityContactRoleWrapperClass owc:wrps)
            {
                ocr.add(owc.OpportunityContactRoleRecord);
            }
            update ocr;
            mapHoldingSelectedOpportunityContactRoleRecords.clear();
        }
    }
    
     public void updateOpportunityProductRecord()
    {
        system.debug('OpportunityProduct');
        if(mapHoldingSelectedOpportunityProductRecords != null)
        {
            list<OpportunityProductWrapperClass> wrps=  mapHoldingSelectedOpportunityProductRecords.values();
            list<OpportunityLineItem> oli=new list<OpportunityLineItem>();
            for(OpportunityProductWrapperClass opwc:wrps)
            {
                oli.add(opwc.OpportunityProductRecord);
            }
            update oli;
            mapHoldingSelectedOpportunityProductRecords.clear();
        }
    }
    
    
    // For Related   
    public void hide()
    {
        show=false;
        pbId=true;
        
        //while hide the related list clear all the child wrapper record list
        ContactWrapperRecordList.clear();
        OpportunityWrapperRecordList.clear();
        CaseWrapperRecordList.clear();
        TaskWrapperRecordList.clear();
        EventWrapperRecordList.clear();
        OpportunityContactRoleWrapperRecordList.clear();
        OpportunityProductWrapperRecordList.clear();
        
        
        //showId=false;
        // showRelated=false;
    }
    public void relatedList()
    {
        pbId=false;
          parentRecord=[select name from Account where Id=:accId ];      
        
        
        // StartCode for fetching opportunityContactRoles
        opportunityContactRoles=[select IsPrimary,ContactId,Role from opportunityContactRole where OpportunityId='0067F0000088xvr' ]; 
        showOpportunityContactRoles=opportunityContactRoles.size()>0?true:false;
        if(opportunityContactRoles.size()>0)
        {
            for (OpportunityContactRole ocr : opportunityContactRoles)
            {
                if(mapHoldingSelectedOpportunityContactRoleRecords != null && mapHoldingSelectedOpportunityContactRoleRecords.containsKey(ocr.id))
                {
                    OpportunityContactRoleWrapperRecordList.add(mapHoldingSelectedOpportunityContactRoleRecords.get(ocr.id));
                }
                else
                {
                    try{
                    OpportunityContactRoleWrapperRecordList.add(new OpportunityContactRoleWrapperClass(ocr, false));
                         }
                    catch(exception e)
                    {
                        system.debug(e);
                    }
                }
            }  
        }
        // EndCode for fetching opportunityContactRoles
         
        
        // Start for fetching opportunityProducts
        opportunityProducts=[select Id from OpportunityLineItem where OpportunityId='0067F0000088xvr' ]; 
        showOpportunityProducts=opportunityProducts.size()>0?true:false;
        if(opportunityProducts.size()>0)
        {
            for (OpportunityLineItem oli : opportunityProducts)
            {
                if(mapHoldingSelectedopportunityProductRecords != null && mapHoldingSelectedopportunityProductRecords.containsKey(oli.id))
                {
                    opportunityProductWrapperRecordList.add(mapHoldingSelectedOpportunityProductRecords.get(oli.id));
                }
                else
                {
                    try{
                    opportunityProductWrapperRecordList.add(new opportunityProductWrapperClass(oli, false));
                         }
                    catch(exception e)
                    {
                        system.debug(e);
                    }
                }
            }  
        } 
       // End for fetching opportunityProducts
        
        // Start for fetching contacts
        contacts=[select id,firstname,lastname,Account.Name from contact where accountId=:accId ];  
        showContacts=contacts.size()>0?true:false;
        if(contacts.size()>0)
        {
            for (contact con : contacts)
            {
                if(mapHoldingSelectedContactRecords != null && mapHoldingSelectedContactRecords.containsKey(con.id))
                {
                    ContactWrapperRecordList.add(mapHoldingSelectedContactRecords.get(con.id));
                }
                else
                {
                    ContactWrapperRecordList.add(new ContactWrapperClass(con, false));
                    
                }
            }  
        }
        // EndCode for fetching contacts
        
        
        // StartCode for fetching opportunities
     
      opportunities=[select id,name,Account.Name,stagename,account.Total__c,amount from opportunity where accountId=:accId ]; 
       AggregateResult[] groupedResults= [SELECT sum(Amount)amnt FROM Opportunity where accountId=:accId];
        showOpportunities=opportunities.size()>0?true:false;
        if(opportunities.size()>0)
        {
           // Total=opportunities[0].account.Total__c;
           Total=(Decimal)groupedResults[0].get('amnt');
            
            for (Opportunity o : opportunities)
            {
                if(mapHoldingSelectedOpportunityRecords != null && mapHoldingSelectedOpportunityRecords.containsKey(o.id))
                {
                    OpportunityWrapperRecordList.add(mapHoldingSelectedOpportunityRecords.get(o.id));
                }
                else
                {
                    OpportunityWrapperRecordList.add(new OpportunityWrapperClass(o, false));    
                }
            }  
        }
         // End for fetching opportunities
        
        
         // Start for fetching cases
        cases=[select id,CaseNumber,Priority,Subject from case where accountId=:accId ];  
        showCases=cases.size()>0?true:false;
        if(cases.size()>0)
        {
            for (Case c : cases)
            {
                if(mapHoldingSelectedCaseRecords != null && mapHoldingSelectedCaseRecords.containsKey(c.id))
                {
                    CaseWrapperRecordList.add(mapHoldingSelectedCaseRecords.get(c.id));
                }
                else
                {
                    CaseWrapperRecordList.add(new CaseWrapperClass(c, false));    
                }
            }  
        }
        // End for fetching cases
         
        // Start for fetching tasks
        tasks=[select id,Description,ActivityDate,Status,Subject     from Task where accountId=:accId ];  
        showTasks=tasks.size()>0?true:false;
        if(tasks.size()>0)
        {
            for (Task t : tasks)
            {
                if(mapHoldingSelectedTaskRecords != null && mapHoldingSelectedTaskRecords.containsKey(t.id))
                {
                    TaskWrapperRecordList.add(mapHoldingSelectedTaskRecords.get(t.id));
                }
                else
                {
                    TaskWrapperRecordList.add(new TaskWrapperClass(t, false));    
                }
            }  
        }
         // End for fetching tasks
          
         // Start for fetching events
        events=[select id,IsAllDayEvent,ActivityDate,Description,Subject     from Event where accountId=:accId ];  
        showEvents=events.size()>0?true:false;
         if(events.size()>0)
        {
            for (Event e : events)
            {
                if(mapHoldingSelectedEventRecords != null && mapHoldingSelectedEventRecords.containsKey(e.id))
                {
                    EventWrapperRecordList.add(mapHoldingSelectedEventRecords.get(e.id));
                }
                else
                {
                    EventWrapperRecordList.add(new EventWrapperClass(e, false));    
                }
            }  
        }
         // Endfor fetching events
         
        if(contacts.size()==0 && opportunities.size()==0 && cases.size()==0 && tasks.size()==0 && events.size()==0 && opportunityContactRoles.size()==0 && opportunityProducts.size()==0)
        {
            show=true;
            showMessage=true;
            showRelated=false;
        }
        else
        {
            show=true;
            showRelated=true;
        } 
        
        if(contacts.size()==0 )
        {
            cons=false;
        }
        else
        {
            cons=true;
        } 
        if(opportunities.size()==0 )
        {
            opps=false;
        }
        else
        {
            opps=true;
        } 
        if(tasks.size()==0 )
        {
            tsks=false;
        }
        else
        {
            tsks=true;
        } 
        if(events.size()==0 ) 
        {
            evnts=false;
        }
        else
        {
            evnts=true;
        } 
        if(cases.size()==0 )
        {
            cses=false;
        }
        else
        {
            cses=true;
        } 
        
        if(OpportunityContactRoles.size()==0 )
        {
            oppconrole=false;
        }
        else
        {
            oppconrole=true;
        } 
        
        if(opportunityProducts.size()==0 ) 
        {
            oppprod=false;
        }
        else
        {
            oppprod=true;
        } 
        
        showId=true;
    }
 // End Related 
    
    public void createRecord()
    {
        pbid=false;
        create=true;
    }
    
    // this function is gets called when click on cancel button
    public void cancelCreate()
    {
        System.debug('cancel');
        create=false;
        pbid=true;
        
    }
    public void cancelContactCreate()
    {
        System.debug('cancel');
      showCreateContact=false;    
    }
     public void cancelOpportunityCreate()
    {
        System.debug('cancel');
      showCreateOpportunity=false;    
    }
     public void cancelCaseCreate()
    {
        System.debug('cancel');
      showCreateCase=false;    
    }
     public void cancelTaskCreate()
    {
        System.debug('cancel');
      showCreateTask=false;    
    }
     public void cancelEventCreate()
    {
        System.debug('cancel');
      showCreateEvent=false;    
    }
     public void cancelOpportunityContactRoleCreate()
    {
        System.debug('cancel');
      showCreateOpportunityContactRole=false;    
    }
    
     public void cancelOpportunityProductCreate()
    {
        System.debug('cancel');
      showCreateOpportunityProduct=false;    
    }
    
    
    public PageReference saveRecord() 
    {
         create=false;
       // I can do custom logic here before I save the record.
       ApexPages.StandardController controller = new ApexPages.StandardController( accStr);
       
       try {
           controller.save();
       }
       catch(Exception e) {
           return null;
       }
       return null;
        
       
       
    }
        
    // This function create a contact record for parent Account when user click save button
         public void saveContact() 
    {

        try {
            if(accId!=null)
            {
                childContact.AccountId=accId;
            insert childContact;
                // after insert a new record we clear ContactWrapperRecordList, and do a fresh query and
                //  assign the records to ContactWrapperRecordList so that after creating the record they
                //  will be reflected to UI
                ContactWrapperRecordList.clear();
                 contacts=[select id,firstname,lastname from contact where accountId=:accId ];  
            if(contacts.size()>0)
              {
                for (contact con : contacts)
                 {
                    if(mapHoldingSelectedContactRecords != null && mapHoldingSelectedContactRecords.containsKey(con.id))
                    {
                        ContactWrapperRecordList.add(mapHoldingSelectedContactRecords.get(con.id));
                    }
                    else
                    {
                        ContactWrapperRecordList.add(new ContactWrapperClass(con, false));
                        
                    }
                 }  
              }
                showCreateContact=false;
            }
        }
        catch(Exception e) {
            showCreateContact=false; 
        } 
        
        // after inserting record do the field null so that at UI inputFields will be Blank after click on save button
         childContact.AccountId=null;
         childContact.firstName=null;
         childContact.LastName=null;
    }  
    
    // This function create a Opportunity record for parent Account when user click save button
     public void saveOpportunity() 
    {
        try {
            if(accId!=null)
            {  
                childOpportunity.AccountId=accId;
                insert childOpportunity;
                // after insert a new record , clear OpportunityWrapperRecordList, and do a fresh query and
                //  assign the records to ContactWrapperRecordList so that after creating the record they
                //  will be reflected to UI
                OpportunityWrapperRecordList.clear();
                opportunities=[select id,name,stagename from opportunity where accountId=:accId ];  
                    if(opportunities.size()>0)
                    {
                        for (Opportunity o : opportunities)
                        {
                            if(mapHoldingSelectedOpportunityRecords != null && mapHoldingSelectedOpportunityRecords.containsKey(o.id))
                            {
                                OpportunityWrapperRecordList.add(mapHoldingSelectedOpportunityRecords.get(o.id));
                            }
                            else
                            {
                                OpportunityWrapperRecordList.add(new OpportunityWrapperClass(o, false));    
                            }
                        }  
                    }
                showCreateOpportunity=false;
            }
        }
        catch(Exception e) {
            System.debug('createOpportunityException');
            showCreateOpportunity=false;     
        }
        // after inserting record do the field null so that at UI inputFields will be Blank after click on save button
         childOpportunity.AccountId=null;
         childOpportunity.Name=null;
         childOpportunity.stagename=null;
         childOpportunity.CloseDate=null;
    }
    
    // This function create a case record for parent Account when user click save button
     public void saveCase() 
    {
        try {
            if(accId!=null)
            {

                childCase.AccountId=accId;
                insert childCase;
                // after insert a new record , clear CaseWrapperRecordList, and do a fresh query and
                //  assign the records to ContactWrapperRecordList so that after creating the record they
                //  will be reflected to UI
                CaseWrapperRecordList.clear();
                cases=[select id,CaseNumber,Priority,Subject from case where accountId=:accId ];  
                    if(cases.size()>0)
                    {
                        for (Case c : cases)
                        {
                            if(mapHoldingSelectedCaseRecords != null && mapHoldingSelectedCaseRecords.containsKey(c.id))
                            {
                                CaseWrapperRecordList.add(mapHoldingSelectedCaseRecords.get(c.id));
                            }
                            else
                            {
                                CaseWrapperRecordList.add(new CaseWrapperClass(c, false));    
                            }
                        }  
                    }
                showCreateCase=false;
               
            }
        }
        catch(Exception e) {
            system.debug(e);
            showCreateCase=false; 
        } 
          // after inserting record do the field null so that at UI inputFields will be Blank after click on save button
      childCase.AccountId=null;
      childCase.ContactId=null;
      childCase.Status=null;
      childCase.Subject=null;
    }
    
    // This function create a Task record for parent Account when user click save button
     public void saveTask() 
    {
        system.debug(accId);
        try {
            if(accId!=null)
            {
                childTask.WhatId=accId;
                insert childTask;
                // after insert a new record  clear TaskWrapperRecordList, and do a fresh query and
                //  assign the records to ContactWrapperRecordList so that after creating the record they
                //  will be reflected to UI
                TaskWrapperRecordList.clear();
                tasks=[select id,Description,ActivityDate,Status,Subject from Task where accountId=:accId ];  
                    if(tasks.size()>0)
                    {
                        for (Task t : tasks)
                        {
                            if(mapHoldingSelectedTaskRecords != null && mapHoldingSelectedTaskRecords.containsKey(t.id))
                            {
                                TaskWrapperRecordList.add(mapHoldingSelectedTaskRecords.get(t.id));
                            }
                            else
                            {
                                TaskWrapperRecordList.add(new TaskWrapperClass(t, false));    
                            }
                        }  
                    }
                showCreateTask=false;
            }
        }
        catch(Exception e) {
            showCreateTask=false;    
        } 
        
          // after inserting record do the field null so that at UI inputFields will be Blank after click on save button
                     childTask.WhatId=null;
                     childTask.OwnerId=null;
                     childTask.Subject=null;
                     childTask.Status=null;
                     childTask.Description=null;
                     childTask.ActivityDate=null;
                     childTask.Priority=null;
    }
    
     public void saveEvent() 
    {

        try {
            if(accId!=null)
            {
                childEvent.WhatId=accId;
                insert childEvent;
                // after insert a new record , clear EventWrapperRecordList, and do a fresh query and
                //  assign the records to ContactWrapperRecordList so that after creating the record they
                //  will be reflected to UI
                EventWrapperRecordList.clear();
                events=[select id,IsAllDayEvent,ActivityDate,Description,Subject  from Event where accountId=:accId ];  
                     if(events.size()>0)
                    {
                        for (Event e : events)
                        {
                            if(mapHoldingSelectedEventRecords != null && mapHoldingSelectedEventRecords.containsKey(e.id))
                            {
                                EventWrapperRecordList.add(mapHoldingSelectedEventRecords.get(e.id));
                            }
                            else
                            {
                                EventWrapperRecordList.add(new EventWrapperClass(e, false));    
                            }
                        }  
                    }
                showCreateEvent=false;
            }
        }
        catch(Exception e) {
            system.debug(e);
            showCreateEvent=false; 
        } 
        
          // after inserting record do the field null so that at UI inputFields will be Blank after click on save button
        childEvent.WhatId=null;
        childEvent.OwnerID=null;
        childEvent.Subject=null;
        childEvent.Location =null;
        childEvent.StartDateTime=null;
        childEvent.EndDateTime=null;
        childEvent.DurationInMinutes=null;
    }
    
     public void saveOpportunityContactRole() 
    {
        try {
            if(accId!=null)
            {
                childOpportunityContactRole.OpportunityId='0067F0000088xvr';   //enter opportunity id
                insert childOpportunityContactRole;
                // after insert a new record , clear EventWrapperRecordList, and do a fresh query and
                //  assign the records to ContactWrapperRecordList so that after creating the record they
                //  will be reflected to UI
                opportunityContactRoleWrapperRecordList.clear();
                opportunityContactRoles=[select id,IsPrimary,ContactId,Role from opportunityContactRole where OpportunityId='0067F0000088xvr' ]; 
        if(opportunityContactRoles.size()>0)
        {
            for (OpportunityContactRole ocr : opportunityContactRoles)
            {
                if(mapHoldingSelectedOpportunityContactRoleRecords != null && mapHoldingSelectedOpportunityContactRoleRecords.containsKey(ocr.id))
                {
                    OpportunityContactRoleWrapperRecordList.add(mapHoldingSelectedOpportunityContactRoleRecords.get(ocr.id));
                }
                else
                {
                    try{
                    OpportunityContactRoleWrapperRecordList.add(new OpportunityContactRoleWrapperClass(ocr, false));
                         }
                    catch(exception e)
                    {
                        system.debug(e);
                    }
                }
            }  
        }
                showCreateOpportunityContactRole=false;
            }
        }
        catch(Exception e) {
            system.debug(e);
            showCreateOpportunityContactRole=false; 
        } 
        
          // after inserting record do the field null so that at UI inputFields will be Blank after click on save button
        childOpportunityContactRole.IsPrimary=null;
        childOpportunityContactRole.ContactId=null;
        childOpportunityContactRole.Role=null;
      
    }
    
      public void saveOpportunityProduct() 
    {
        try {
            if(accId!=null)
            {
                childOpportunityProduct.OpportunityId='0067F0000088xvr';   //enter opportunity id
                insert childOpportunityProduct;
                // after insert a new record , clear EventWrapperRecordList, and do a fresh query and
                //  assign the records to ContactWrapperRecordList so that after creating the record they
                //  will be reflected to UI
                opportunityProductWrapperRecordList.clear();
                opportunityProducts=[select Id from OpportunityLineItem where OpportunityId='0067F0000088xvr' ]; 
                    if(opportunityProducts.size()>0)
                    {
                        for (OpportunityLineItem oli : opportunityProducts)
                        {
                            if(mapHoldingSelectedopportunityProductRecords != null && mapHoldingSelectedopportunityProductRecords.containsKey(oli.id))
                            {
                                opportunityProductWrapperRecordList.add(mapHoldingSelectedOpportunityProductRecords.get(oli.id));
                            }
                            else
                            {
                                try{
                                opportunityProductWrapperRecordList.add(new opportunityProductWrapperClass(oli, false));
                                     }
                                catch(exception e)
                                {
                                    system.debug(e);
                                }
                            }
                        }  
                    } 
       
                showCreateOpportunityProduct=false;
            }
        }
        catch(Exception e) {
            system.debug(e);
            showCreateOpportunityProduct=false; 
        } 
        
          // after inserting record do the field null so that at UI inputFields will be Blank after click on save button
           childOpportunityProduct.Quantity=null;
        childOpportunityProduct.UnitPrice=null;
    }
    
    
    public void showPicklist()
    { 
        showPicklist=true;  
    }
    
    public void exit()
    {
        showPicklist=false; 
    }
    
    
    
    //wrapper class being used for checkbox showing.
    public class WrapperClass
    {
        public Boolean isSelected {get;set;}
        public Account accountRecord {get;set;}
        public WrapperClass(Account accountRecord, Boolean isSelected) {
            this.accountRecord = accountRecord;
            this.isSelected = isSelected;
        }
    }
    
    
     public class OpportunityContactRoleWrapperClass
    {
        public Boolean isSelected {get;set;}
        public OpportunityContactRole OpportunityContactRoleRecord {get;set;}
        public OpportunityContactRoleWrapperClass(OpportunityContactRole OpportunityContactRoleRecord, Boolean isSelected) {
            this.OpportunityContactRoleRecord = OpportunityContactRoleRecord;
            this.isSelected = isSelected;
        }
    }
    public class ContactWrapperClass 
    {
        public Boolean isSelected {get;set;}
        public Contact contactRecord {get;set;}
        public ContactWrapperClass(Contact contactRecord, Boolean isSelected) {
            this.contactRecord = contactRecord;
            this.isSelected = isSelected;
        }
    }
        public class OpportunityWrapperClass 
    {
        public Boolean isSelected {get;set;}
        public Opportunity opportunityRecord {get;set;}
        public OpportunityWrapperClass(Opportunity opportunityRecord, Boolean isSelected) {
            this.opportunityRecord = opportunityRecord;
            this.isSelected = isSelected;
        }
    }

        public class CaseWrapperClass 
    {
        public Boolean isSelected {get;set;}
        public Case caseRecord {get;set;}
        public CaseWrapperClass(Case caseRecord, Boolean isSelected) {
            this.caseRecord = caseRecord;
            this.isSelected = isSelected;
        }
    }

        public class TaskWrapperClass 
    {
        public Boolean isSelected {get;set;}
        public Task taskRecord {get;set;}
        public TaskWrapperClass(Task taskRecord, Boolean isSelected) {
            this.taskRecord = taskRecord;
            this.isSelected = isSelected;
        }
    }
        public class EventWrapperClass 
    {
        public Boolean isSelected {get;set;}
        public Event eventRecord {get;set;}
        public EventWrapperClass(Event eventRecord, Boolean isSelected) {
            this.eventRecord = eventRecord;
            this.isSelected = isSelected;
        }
    }  
    
     public class OpportunityProductWrapperClass 
    {
        public Boolean isSelected {get;set;}
        public OpportunityLineItem OpportunityProductRecord {get;set;}
        public OpportunityProductWrapperClass(OpportunityLineItem OpportunityProductRecord, Boolean isSelected) {
            this.OpportunityProductRecord = OpportunityProductRecord;
            this.isSelected = isSelected;
        }
    }  
}