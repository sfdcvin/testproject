public with sharing class MainController{
    
    // My Variables
    
    public Map<String,schema.SObjectType> allobj{get;set;}
    
    Public Map<String,schema.SObjectField> selobjmap{get;set;}
    
    public List<String> objnames{get;set;}
    
    public List<string> fieldnames{get;set;}
    
    Public List<selectoption> options{get;set;}
    
    Public List<selectoption> objfieldoptions{get;set;}
    
    Public String selectedobj{get;set;}
    
    public List<String> selectedfield{get{
        System.debug('Chance-1');
        return selectedfield;
    }set;}
    
    public List<selectoption> selectedfields{get; set;}
    
    private static String query;
    
    public List<String> objsupported = new List<String>{'Account'.toLowerCase(), 'Asset'.toLowerCase(),
                                                        'Campaign'.toLowerCase(), 'Case'.toLowerCase(),
                                                        'Contact'.toLowerCase(), 'Contract'.toLowerCase(),
                                                        'Idea'.toLowerCase(), 'Lead'.toLowerCase(),
                                                        'Opportunity'.toLowerCase(), 'Order'.toLowerCase(),
                                                        'Product2'.toLowerCase(), 'Solution'.toLowerCase(),
                                                        'User'.toLowerCase()};
            
    private Boolean RenderComponent;
    
    public SelectOption[] leftOptions { get; set; }
    public SelectOption[] rightOptions { get; set; }
    
    public SelectOption[] selectedContacts { get; set; }
    public SelectOption[] allContacts { get; set; }
    
    public String message { get; set; }
    
    // #################################################################################################################################
    
    //variables used in page.
    Public Integer size{get;set;}
    Public Integer noOfRecords{get; set;}
    public List<SelectOption> paginationSizeOptions{get;set;}
    public static final Integer QUERY_LIMIT = 10000;
    public  Integer PAGE_SIZE {set;get;}
    public string searchByString {set;get;}
    public List <WrapperClass> wrapperRecordList{get;set;}
    public List <ContactWrapperClass> contactWrapperRecordList{get;set;}
    Map<Id, WrapperClass> mapHoldingSelectedRecords{get;set;}
    Map<Id, ContactWrapperClass> mapHoldingSelectedContactRecords{get;set;}
    
    // For Related
    public list<Contact> contacts{get;set;}
    public list<Opportunity> Opportunities{get;set;}
    public list<Case> cases{get;set;}
    public list<Task> tasks{get;set;}
    public list<Event> events{get;set;}
    public Task myTask {get;set;}
    public Event myEvent {get;set;}
    public string   accId{get;set;}
    public static Id   IId{get;set;}
    private string  name;
    
    public Boolean showContacts{get;set;}
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
    public Boolean  show{get;set;}
    public boolean  pbId {get;set;}
    // End Related
    public Boolean create  {get;set;}
    public Boolean showTask  {get;set;}
    public Boolean showEvent  {get;set;}
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
    public MainController()
    {
        System.debug('Constructor: Default');
    }
    
    //constructor calling init method
    public  MainController(ApexPages.StandardController controller)
    {         
        System.debug('Constructor: Parameterized');
        objSupported.addAll(getAllCustomSObjects());
        selectedfields = new List<SelectOption>();
        System.debug('Chance-4');
        selectedfield = new List<String>();
        leftoptions = new List<SelectOption>();
        rightoptions = new List<SelectOption>();
        allobj=schema.getGlobalDescribe();
        objnames= new List<string>();
        options=new List<selectoption>();
        objnames.addAll(allobj.keySet());
        objnames.sort();
        for(string s:objnames)
        {
            if(objsupported.contains(s))
                options.add(new selectoption(s,allobj.get(s).getDescribe().getLabel()));
        }
        options = selectOptionSortByLabel(options);
        options.add(0, new SelectOption('', 'None'));
        
        // ###########################################################################################################################
        
        this.accStr = (Account)Controller.getRecord();
        PAGE_SIZE = 10; //default records per page
        mapHoldingSelectedRecords = new Map<Id, WrapperClass>();
        mapHoldingSelectedContactRecords=new Map<Id, ContactWrapperClass>();
        SelectedCount=0;
        init();
        
        ContactWrapperRecordList = new List <ContactWrapperClass>(); 
        myTask=new Task();
        myEvent=new Event();
        // this code For Related
        contacts=new list<contact>();
        Opportunities=new list<opportunity>();
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
	
	// My Methods
    public void getSelObjFields()
    {
        System.debug('Function: getSelObjFields');
        System.debug('Chance-2');
        selectedfield.clear();
        rightOptions.clear();
        selectedfields.clear();
        if (selectedobj != null){
            Schema.DescribeSObjectResult  dfr = allobj.get(selectedobj).getDescribe();
            selobjmap =dfr.fields.getMap();
            fieldnames= new List<string>();
            objfieldoptions=new List<selectoption>();
            fieldnames.addAll(selobjmap.keySet());
            fieldnames.sort();
            for(string s1:fieldnames)
            {
                objfieldoptions.add(new selectoption(s1, selobjmap.get(s1).getDescribe().getLabel()));
            }
            objfieldoptions = selectOptionSortByLabel(objfieldoptions);
        }
    }
    
    public static List<String> getAllCustomSObjects()
    {
        System.debug('Function: getAllCustomSObjects');
        List<String> sObjectList = new List<String>();
        for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().Values())
        {
            Schema.DescribeSObjectResult describeSObjectResultObj = objTyp.getDescribe();
            if(describeSObjectResultObj.isCustom())
            {
                String name = objTyp.getDescribe().getName();
                // Exclude all the unwanted Sobjects e.g. History, Share etc..
                if(!name.containsignorecase('history') && !name.containsignorecase('tag')&&
                   !name.containsignorecase('share') && !name.containsignorecase('feed'))
                {
                    SobjectList.add(name);
                }
            }
        }
        return sObjectList;
    }
    
    public String getquery(){
        
        System.debug('Function: getquery');
        
        if(selectedfield != null){
            
            query = 'SELECT ';
            
            query += String.join(selectedfield, ',');
            
            query += ' FROM ';
            
            query += selectedobj;
        }
        
        System.debug('GetQuery: ' + query);
        
        return query;
        
    }
    
    
    public List<sObject> getsList(){
        
        System.debug('Function: getsList');
        
        String query = 'SELECT ';
        
        query += String.join(selectedfield, ',');
        
        query += ' FROM ';
        
        query += selectedobj;
        
        Schema.SObjectType sObjType = Schema.getGlobalDescribe().get(selectedobj);
        
        List<sObject> sList = new List<sObject>();
        
        try{
            sList = Database.query(query);
            System.debug('Right Query: ' + query);
        }catch(Exception e){
            System.debug('Wrong Query: ' + query);
        }
        
        List<sObject> castRecords = new List<Account>();
        
        if (sObjType != null)
        {
            String listType = 'List<' + sObjType + '>';
            castRecords = (List<SObject>)Type.forName(listType).newInstance();
            castRecords.addAll(sList);
        }
        
        System.debug('CastRecords: ' + castRecords);
        
        return castRecords;
    }
    
    public List<selectOption> selectOptionSortByLabel(List<selectOption>
                                                      selectOptionsToSort) {
                                                          System.debug('Function: selectOptionSortByLabel');
                                                          if(selectOptionsToSort == null || selectOptionsToSort.size() <= 1){
                                                              return selectOptionsToSort;
                                                          }
                                                          List<SelectOption> lessSelectOption = new List<SelectOption>();
                                                          List<SelectOption> greaterSelectOption = new List<SelectOption>();
                                                          integer pivot = selectOptionsToSort.size() / 2;
                                                          
                                                          //save the pivot and remove it from the selectOption list
                                                          SelectOption pivotValue = selectOptionsToSort[pivot];
                                                          selectOptionsToSort.remove(pivot);
                                                          for(selectOption SO : selectOptionsToSort){
                                                              if(SO.getLabel() <= pivotValue.getLabel()){
                                                                  lessSelectOption.add(SO);
                                                              }else if(SO.getLabel() > pivotValue.getLabel()){
                                                                  greaterSelectOption.add(SO);   
                                                              }
                                                          }
                                                          list<selectOption> sortedSelectOptions = new list<selectOption>(); 
                                                          sortedSelectOptions.addAll(selectOptionSortByLabel(lessSelectOption));
                                                          sortedSelectOptions.add(pivotValue);
                                                          sortedSelectOptions.addAll(selectOptionSortByLabel(greaterSelectOption));
                                                          return SortedSelectOptions;
                                                      }
    
    public List<selectOption> selectOptionSortByValue(List<selectOption>
                                                      selectOptionsToSort){
                                                          System.debug('Function: selectOptionSortByValue');
                                                          if(selectOptionsToSort == null || selectOptionsToSort.size() <= 1){
                                                              return selectOptionsToSort;
                                                          }       
                                                          List<SelectOption> lessSelectOption = new List<SelectOption>();
                                                          List<SelectOption> greaterSelectOption = new List<SelectOption>();
                                                          integer pivot = selectOptionsToSort.size() / 2;
                                                          
                                                          //save the pivot and remove it from the selectOption list
                                                          SelectOption pivotValue = selectOptionsToSort[pivot]; 
                                                          selectOptionsToSort.remove(pivot);
                                                          for(selectOption SO : selectOptionsToSort){
                                                              if(SO.getValue() <= pivotValue.getValue()){
                                                                  lessSelectOption.add(SO);
                                                              }else if(SO.getValue() > pivotValue.getValue()){
                                                                  greaterSelectOption.add(SO);   
                                                              }
                                                          }
                                                          list<selectOption> SortedSelectOptions = new list<selectOption>(); 
                                                          SortedSelectOptions.addAll(selectOptionSortByValue(lessSelectOption));
                                                          SortedSelectOptions.add(pivotValue);
                                                          SortedSelectOptions.addAll(selectOptionSortByValue(greaterSelectOption));
                                                          return SortedSelectOptions;
                                                      }
    
    public Boolean getRenderComponent(){
        System.debug('Function: getRenderComponent');
        if(selectedobj == null || selectedobj == '' || selectedobj == 'None'){
            return false;
        }else{
            return true;
        }
    }
    
    public PageReference cancelPopup() {
        System.debug('Function: CancelPopup');
        return null;
    }
    
    public PageReference SavePopup() {
        System.debug('Function: SavePopup');
        System.debug('Chance-3');
        selectedfield.clear();
        for(SelectOption so: selectedfields){
            selectedfield.add(so.getValue());
        }
        System.debug('SelectedField: ' + selectedfield);
        init();
        return null;
    }
    
    public boolean checkBoxVal{get;set;}
    public boolean displayPopup{get;set;}
    
    public pageReference method(){
        
        System.debug('Function: method');
        displayPopup = true;
        return null;
    }
    
    private void setOptions(SelectOption[] options, String value) {
        System.debug('Function: setOptions');
        options.clear();
        String[] parts = value.split('&');
        for (Integer i=0; i<parts.size()/2; i++) {
            options.add(new SelectOption(EncodingUtil.urlDecode(parts[i*2], 'UTF-8'), 
                                         EncodingUtil.urlDecode(parts[(i*2)+1], 'UTF-8')));
        }
    }
    
    // Backing for hidden text field containing the options from the
    // left list
    public String leftOptionsHidden { get{
        System.debug('SF1: ' + selectedfield);
        System.debug('Variable-Get: leftOpitonsHidden');
        return leftOptionsHidden;
    } set {
        System.debug('SF2: ' + selectedfield);
        System.debug('Variable-Set: leftOpitonsHidden');
        leftOptionsHidden = value;
        setOptions(leftOptions, value);
    }
                                    }
    
    // Backing for hidden text field containing the options from the
    // right list
    public String rightOptionsHidden { get{
        System.debug('SF3: ' + selectedfield);
        System.debug('Variable-Get: rightOptionsHidden');
        return rightOptionsHidden;
    } set {
        System.debug('SF4: ' + selectedfield);
        System.debug('Variable-Set: rightOpitonsHidden');
        rightOptionsHidden = value;
        setOptions(rightOptions, value);
    }
                                     }

    
	//##################################################################################################################################
	    
    //Init method which queries the records from standard set controller.
    public void init()
    {
        wrapperRecordList = new List<WrapperClass>(); 
        for (Account cont : (List<Account>)setRecord.getRecords())
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
    public ApexPages.StandardSetController setRecord {
        get {
            try{
                if( setRecord==null )
                {
                    
                    setRecord = new ApexPages.StandardSetController(Database.getQueryLocator(getquery() + ' ORDER BY Name ASC LIMIT ' + QUERY_LIMIT));   
                    // sets the number of records to show in each page view
                    setRecord.setPageSize(PAGE_SIZE);     
                }
                if( setRecord!=null )
                { 
                    if( selectedname!=null && selectedname!='' )
                    {
                        
                        System.debug('if 1');
                        setRecord=null;
                        if((dateFormat=='' || dateFormat==null) && searchByString!=null)
                        {
                            if(searchByString=='')
                            {
                                setRecord = new ApexPages.StandardSetController(Database.getQueryLocator(getquery() + ' WHERE Industry = \'' + selectedname + '\' ORDER BY Name ASC LIMIT ' + QUERY_LIMIT));  
                                setRecord.setPageSize(PAGE_SIZE);
                            }
                            else
                            {
                                system.debug('Hi,vin');
                                setRecord = new ApexPages.StandardSetController(Database.getQueryLocator(getquery() + ' WHERE Name LIKE \'' + name + '\'AND Industry = \'' + selectedname + '\' ORDER BY Name ASC LIMIT ' + QUERY_LIMIT)); 
                                setRecord.setPageSize(PAGE_SIZE);
                            }
                        }
                        
                        else if(dateFormat=='AllTime' )
                        {
                            
                            setRecord = new ApexPages.StandardSetController(Database.getQueryLocator(getquery() + ' WHERE Industry = \'' + selectedname + ' ORDER BY Name ASC LIMIT ' + QUERY_LIMIT));
                            setRecord.setPageSize(PAGE_SIZE);
                        }
                        else if(dateFormat=='<' && dat!=null )
                        {
                            System.debug('error');
                            setRecord = new ApexPages.StandardSetController(Database.getQueryLocator(getquery() + ' WHERE Industry = \'' + selectedname + ' AND CreatedDate < ' + dat + ' ORDER BY Name ASC LIMIT ' + QUERY_LIMIT));
                            setRecord.setPageSize(PAGE_SIZE);
                        }
                        else if(dateFormat=='<=' && dat!=null )
                        {
                            setRecord = new ApexPages.StandardSetController(Database.getQueryLocator(getquery() + ' WHERE Industry = \'' + selectedname + ' AND CreatedDate <= ' + dat + ' ORDER BY Name ASC LIMIT ' + QUERY_LIMIT ));
                            setRecord.setPageSize(PAGE_SIZE);
                        }
                        else if(dateFormat=='>' && dat!=null )
                        {
                            setRecord = new ApexPages.StandardSetController(Database.getQueryLocator(getquery() + ' WHERE Industry = \'' + selectedname + ' AND CreatedDate > ' + dat + ' ORDER BY Name ASC LIMIT ' + QUERY_LIMIT));
                            setRecord.setPageSize(PAGE_SIZE);
                        }
                        else if(dateFormat=='>=' && dat!=null )
                        {
                            setRecord = new ApexPages.StandardSetController(Database.getQueryLocator(getquery() + ' WHERE Industry = \'' + selectedname + ' AND CreatedDate >= ' + dat + ' ORDER BY Name ASC LIMIT ' + QUERY_LIMIT));
                            setRecord.setPageSize(PAGE_SIZE);
                        }
                        else
                        {   if(dateFormat!='' && dateFormat!=null )
                        {
                            setRecord = new ApexPages.StandardSetController(Database.getQueryLocator(getquery() + ' WHERE Industry = \''+ selectedname + '\' AND CreatedDate = '+ dateFormat+ ' order by name ASC LIMIT '+ QUERY_LIMIT ));
                            setRecord.setPageSize(PAGE_SIZE);
                        }
                        }
                        
                        
                        
                    }  
                    
                    /* if(setRecord != null  && selectedname!=null && selectedname=='All' && dateFormat==null)
                    {
                        setRecord=null;
                        setRecord = new ApexPages.StandardSetController(Database.getQueryLocator([SELECT Id,Name,industry,Phone FROM Account   order by name ASC LIMIT : QUERY_LIMIT ]));
                        // sets the number of records to show in each page view
                        setRecord.setPageSize(PAGE_SIZE);
                    }  */
                    
                    if( dateFormat!=null && dateFormat!=''  && selectedname==null  && searchByString==null )
                    {  
                        setRecord=null;
                        System.debug(dat);
                        if(dateFormat=='AllTime')
                        {
                            setRecord = new ApexPages.StandardSetController(Database.getQueryLocator(getquery() + ' ORDER BY Name ASC LIMIT ' + QUERY_LIMIT));
                            // sets the number of records to show in each page view
                            setRecord.setPageSize(PAGE_SIZE);
                            
                        }
                        if(dateFormat=='>=' && dat!=null)
                        {
                            setRecord = new ApexPages.StandardSetController(Database.getQueryLocator(getquery() + ' WHERE  CreatedDate >= ' + dat + ' ORDER BY Name ASC LIMIT ' + QUERY_LIMIT));
                            // sets the number of records to show in each page view
                            setRecord.setPageSize(PAGE_SIZE);
                            
                        }
                        if(dateFormat=='<=' && dat!=null)
                        {
                            
                            setRecord = new ApexPages.StandardSetController(Database.getQueryLocator(getquery() + ' WHERE  CreatedDate <= ' + dat + ' ORDER BY Name ASC LIMIT ' + QUERY_LIMIT));
                            // sets the number of records to show in each page view
                            setRecord.setPageSize(PAGE_SIZE);
                            
                        }
                        if(dateFormat=='<' && dat!=null)
                        {
                            
                            System.debug(searchByString);
                            setRecord = new ApexPages.StandardSetController(Database.getQueryLocator(getquery() + ' WHERE  CreatedDate < ' + dat + ' ORDER BY Name ASC LIMIT ' + QUERY_LIMIT));
                            // sets the number of records to show in each page view
                            setRecord.setPageSize(PAGE_SIZE);
                            
                        }
                        if(dateFormat=='>' && dat!=null)
                        {
                            setRecord = new ApexPages.StandardSetController(Database.getQueryLocator(getquery() + ' WHERE  CreatedDate > ' + dat + ' ORDER BY Name ASC LIMIT ' + QUERY_LIMIT));
                            // sets the number of records to show in each page view
                            setRecord.setPageSize(PAGE_SIZE);
                            
                        }
                        if(dateFormat!='<='  && dateFormat!='>=' && dateFormat!='>' && dateFormat!='<' && dateFormat!='AllTime')
                        {
                            system.debug('Yesterday');
                            setRecord = new ApexPages.StandardSetController(Database.getQueryLocator(getquery() + ' WHERE createdDate = ' + dateFormat+ ' ORDER BY Name ASC LIMIT '+ QUERY_LIMIT ));
                            // sets the number of records to show in each page view
                            setRecord.setPageSize(PAGE_SIZE);
                        }
                        
                    }
                    
                    if( searchByString!=null && searchByString!='' && selectedName==null)
                    {
                        setRecord = null;
                        name=searchByString+'%';
                        system.debug('String is ' + name);
                        setRecord = new ApexPages.StandardSetController(Database.getQueryLocator(getquery() + ' WHERE Name LIKE \''+ name + '\' ORDER BY Name ASC LIMIT ' + QUERY_LIMIT));
                        // sets the number of records to show in each page view
                        setRecord.setPageSize(PAGE_SIZE);
                    }
                    
                } 
                
                return setRecord;
                
            }catch(Exception e){
                return new ApexPages.StandardSetController(new List<Account>());
            }
        }
        set;
    }
    public void showTaskMethod()
    {
        system.debug('createtask');
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
        setRecord=null;
        searchByString=null;
        dateFormat=null;
        selectedname=null;
        init();
    }
    
    /** indicates whether there are more records after the current page set.*/
    public Boolean hasNext {
        get {
            return setRecord.getHasNext();
        }
        set;
    }
    
    /** indicates whether there are more records before the current page set.*/
    public Boolean hasPrevious {
        get {
            
            return setRecord.getHasPrevious();
        }
        set;
    }
    
    /** returns the page number of the current page set*/
    public Integer pageNumber {
        get {
            return setRecord.getPageNumber();
        }
        set;
    }
    
    /** return total number of pages for page set*/
    Public Integer getTotalPages()
    {
        Decimal totalSize = setRecord.getResultSize();
        Decimal pageSize = setRecord.getPageSize();
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
    
    // This function will adjust the query string
    public String adjustquery(String text){
        
        System.debug('Function: adjustquery');
        
        System.debug( 'escaping sosl term: ' + text );
        
        String escapedText;
        
        if ( String.isBlank( text ) ) {
            
            escapedText = null;
            
        } else {
            
            // Escaping characters is a bit annoying because
            // we are having to plan for multiple levels of evaluation of the escaped characters:
            //  1. Apex   -- this code requires double slahes (\\) to equate to a single slash (\) in the string literal
            //  2. Regex  -- when the replaceAll method parses the input sequence the apex \\ is read as a single \, so have to double up again in Apex to get \\ in regex land
            //  3. SOSL   -- when Search.query() method parses the query string it expects valid apex string literal, so any \ must be escaped as \\
            
            // In addition to my below logic, you can check out some other solutions here:
            // http://salesforce.stackexchange.com/questions/64757/function-to-properly-escape-dynamic-sosl-input
            
            // escape single quotes
            // we do not handle the single quote escaping in the matcher.replaceAll method along with the other escaping because we would end up with incorrect number of slashes
            escapedText = String.escapeSingleQuotes( text ) ;
            
            // remove special logical operators from the term (case insensitive)
            // these are keywords for SOSL, can't escape them so we exclude them from the search term
            escapedText = escapedText.replaceAll( '(?i)( AND NOT | AND | OR )', ' ' );
            
            // escape reserved characters
            // note, we handled single quotes above already
            // note, we do not handle \, it ends up being overly escaped
            // ? & | ! { } [ ] ( ) ^ ~ * : \ " ' + -
            Pattern myPattern = Pattern.compile( '(\\?|\\&|\\||\\!|\\{|\\}|\\[|\\]|\\(|\\)|\\^|\\~|\\*|\\:|\\"|\\+|\\-)' );
            Matcher myMatcher = myPattern.matcher( escapedText );
            
            // remember all the notes above about the 7 circles of hell of escaping text for apex, regex, sosl??
            // so all that comes into play here when we now perform the escaping of the matched special characters
            // we need 8 slashes (\\\\\\\\)
            //      ...in apex that translates into a string literal of just 4 (\\\\)
            //      ...once the replaceAll method runs it parses the input as regex, and regex like apex needs slashes escaped so the 4 (\\\\) it received is interpreted as regex literal of 2 (\\)
            //      ...we return the apex literal string with each special character now prefixed with 2 slashes (\\)
            //      ...when Search.query() method parses the escaped string literal we return from here those 2 slashes (\\) get interpreted as 1 slash (\)
            escapedText = myMatcher.replaceAll( '\\\\\\\\$1' );
            
            // collapse repeated whitespace
            escapedText = escapedText.replaceAll( '( )+', ' ' ).trim();
            
        }
        
        System.debug( 'escaped sosl term: ' + escapedText );
        if(escapedText == null){
            return '';
        }else{
            return escapedText;
        }
        
    }
    
    // This function gets called when user search a record by a Name
    public void searchRecords()  
    {
        system.debug('I am here');
        dateFormat=null;
        dat=null;
        wrapperRecordList.clear();
        if(setRecord.getRecords().size()>0) 
        {
            for (sObject rec : (List<sObject>)setRecord.getRecords()) 
            {
                
                if(mapHoldingSelectedRecords != null && mapHoldingSelectedRecords.containsKey(rec.id))
                {
                    wrapperRecordList.add(mapHoldingSelectedRecords.get(rec.id));
                    searchByString=null;
                }
                else
                {
                    wrapperRecordList.add(new WrapperClass(rec, false));
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
        system.debug('I am here');
        wrapperRecordList.clear();
        searchByString=null;
        selectedname=null;
        
        if(setRecord.getRecords().size()>0) 
        {
            for (sObject rec : (List<sObject>)setRecord.getRecords()) 
            {
                
                if(mapHoldingSelectedRecords != null && mapHoldingSelectedRecords.containsKey(rec.id))
                {
                    wrapperRecordList.add(mapHoldingSelectedRecords.get(rec.id));
                    //  dateFormat=null;
                    // dat=null;
                }
                else
                {
                    wrapperRecordList.add(new WrapperClass(rec, false));
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
    
    public void refresh()
    {
        /*  pbid=true;
        system.debug('I am here');
        wrapperRecordList.clear();
        setRecord=null;
        selectedname=null;
        searchByString=null;
        mapHoldingSelectedRecords=null;
        PAGE_SIZE=10;
        
        if(setRecord.getRecords().size()>0) 
        {
            for (sObject rec : (List<sObject>)setRecord.getRecords()) 
            {
                
                if(mapHoldingSelectedRecords != null && mapHoldingSelectedRecords.containsKey(rec.id))
                {
                    wrapperRecordList.add(mapHoldingSelectedRecords.get(rec.id));
                    searchByString=null;
                }
                else
                {
                    wrapperRecordList.add(new WrapperClass(rec, false));
                    
                }
            }
        }   */
        
    }
    public void findBySelected()
    {
        //  searchByString=null;
        if(selectedname!='exit' )
        {
            system.debug('I am here');
            wrapperRecordList.clear();
            // setRecord=null;
            if(setRecord.getRecords().size()>0) 
            {
                for (sObject rec : (List<sObject>)setRecord.getRecords()) 
                {
                    
                    if(mapHoldingSelectedRecords != null && mapHoldingSelectedRecords.containsKey(rec.id))
                    {
                        wrapperRecordList.add(mapHoldingSelectedRecords.get(rec.id));
                        showPicklist();
                        selectedname=null;
                    }
                    else
                    {
                        wrapperRecordList.add(new WrapperClass(rec, false));
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
        setRecord.first();
        init();
    }   
    /** returns the last page of the page set*/
    public void last() 
    {
        // updateSearchItemsMap();
        setRecord.last();
        init();
    }  
    /** returns the previous page of the page set*/
    public void previous()
    {
        //updateSearchItemsMap();
        // setRecord.save();
        setRecord.previous();
        init();
    }
    
    /** returns the next page of the page set*/
    public void next()
    {
        // updateSearchItemsMap();
        //  setRecord.save();
        setRecord.next();
        init();
    }
    //This is the method which manages to remove the deselected records, and keep the records which are selected in map.
    public void updateSearchItemsMap()
    {
        mapHoldingSelectedRecords.clear();
        for(WrapperClass wrp : wrapperRecordList)
        {
            if(wrp.isSelected){
                mapHoldingSelectedRecords.put(wrp.record.id, wrp);
            }
            if(wrp.isSelected == false && mapHoldingSelectedRecords.containsKey(wrp.record.id)){
                mapHoldingSelectedRecords.remove(wrp.record.id);
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
                mapHoldingSelectedContactRecords.remove(conWrp.contactRecord.id);
            } 
        }
    }
    // This is the method which gets called whenever a record deleted
    public void deleteRecord()
    {
        if(mapHoldingSelectedRecords != null)
        {
            set<id> ids=new set<id>();
            ids=  mapHoldingSelectedRecords.keySet();
            list<sObject> records = Database.query('SELECT ID FROM ' + selectedObj + 'WHERE Id IN ' + ids);
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
                delete records;
            }
            else {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Error:  Insufficient Privileges'));
            }
            mapHoldingSelectedRecords.clear();
        }  
    } 
    public void deleteContactRecord()
    {
        System.debug('Delete');
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
    
    // This Method gets called whenever a record updated
    public void updateRecord()
    {
        if(mapHoldingSelectedRecords != null)
        {
            list<WrapperClass> wrps=  mapHoldingSelectedRecords.values();
            list<sObject> accs=new list<sObject>();
            for(WrapperClass wc:wrps)
            {
                accs.add(wc.record);
            }
            update accs;
            mapHoldingSelectedRecords.clear();
        }
    }
    // For Related   
    public void hide()
    {
        show=false;
        //showId=false;
        // showRelated=false;
    }
    public void relatedList()
    {
        contacts=[select id,firstname,lastname from contact where accountId=:accId ];  
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
        opportunities=[select id,name,stagename from opportunity where accountId=:accId ];  
        showOpportunities=opportunities.size()>0?true:false;
        cases=[select id,CaseNumber,Priority,Subject from case where accountId=:accId ];  
        showCases=cases.size()>0?true:false;
        tasks=[select id,Description,ActivityDate,Status,Subject     from Task where accountId=:accId ];  
        showTasks=tasks.size()>0?true:false;
        events=[select id,IsAllDayEvent,ActivityDate,Description,Subject     from Event where accountId=:accId ];  
        showTasks=tasks.size()>0?true:false;
        
        if(contacts.size()==0 && opportunities.size()==0 && cases.size()==0 && tasks.size()==0 && events.size()==0)
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
        
        showId=true;
    }
    // End Related    
    public void createRecord()
    {
        pbid=false;
        create=true;
    }
    public void cancelCreate()
    {
        create=false;
        pbid=true;
        
    }
    public ApexPages.PageReference saveRecord() 
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
        public sObject record {get;set;}
        public WrapperClass(sObject record, Boolean isSelected) {
            this.record = record;
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
    
}