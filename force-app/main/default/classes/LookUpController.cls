public class LookUpController {
    public String fName{get;set;}
    public String lName{get;set;}
    public String accName{get;set;}
    public Id AccId{get;set;}
    public List<Account> accList {get;set;}   
    public PageReference callLookup(){
        accList = [Select id,Name from Account];
        PageReference pr = new PageReference('/apex/customLookUp_LookUpVf');
        pr.setRedirect(false);
        return pr;
    }
    
    public PageReference goBack(){
        accName = ApexPages.currentPage().getParameters().get('AccName');
        AccId = ApexPages.currentPage().getParameters().get('AccId');
        PageReference pr = new PageReference('/apex/CustomLookUpMainVf');
        pr.setRedirect(false);
        return pr;
    }
    
    public PageReference save(){
        if(lName == null || lName == ''){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Last Name is Required!'));
            return null;
        }
        else{
            Contact con = new Contact();
            con.FirstName = fName;
            con.LastName = lName;
            con.AccountId = AccId;
            insert con;            
            PageReference pr = new PageReference('/'+con.Id);
            pr.setRedirect(false);
            return pr;
        }
    }
}