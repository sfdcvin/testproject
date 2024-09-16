@RestResource(urlMapping='/case/*')
global class Case_webservice {
    
    
    @HttpGet
    global static Case getcaseById()
    {
        RestRequest request=RestContext.request;
        String caseId=request.requestUri.subString(request.requestUri.lastIndexOf('/')+1);
        Case result=[select CaseNumber,status,subject from Case where id=:caseId];
        return result;
    }

    
         
    @HttpPost
    global static id createReord(string subject,String status,String origin,String priority)
    {
        case record=new Case(Subject=subject,Status=status,Origin=origin,Priority=priority);
        insert record;
       
        return record.Id;
    }
    
    @HttpDelete
    global static void DeleteCase()
    {
        RestRequest request=RestContext.request;
    string caseid=request.requestURI.subString(request.requestURI.lastIndexOf('/')+1);
        case Record=[select subject from Case where id=:caseid];
        delete Record;
       
        }
    
    @HttpPATCH
    global static id upIn(string subject,String status,String origin,String priority,String id)
    {
        case record =new Case(Id=id,Subject=subject,Status=status,Origin=origin,Priority=priority);
        update record;
        return record.id;
        
        
    }
    

}