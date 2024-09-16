public class oppSLAMatrixCalcController {
    
    @AuraEnabled
    public static list<WrapperClass> fetchMatrix(String oppId){
        
        List<Opportunity> oppLst= new List<Opportunity>();
        Set<String> stageName = new Set<String>();
        Opportunity oppObj;
        String id;
        oppLst = [SELECT Id,StageName,Name,createdDate FROM Opportunity WHERE Id =: oppId];
        List<WrapperClass> wrapClassLst=new List<WrapperClass>();
        for(Opportunity sla : oppLst){
            WrapperClass wrap = new WrapperClass();
            wrap.stageName = sla.StageName;
            wrap.Name = sla.Name;
            wrapClassLst.add(wrap);            
        }
        system.debug(wrapClassLst);
        return wrapClassLst;
    }
    public class WrapperClass{
        @AuraEnabled
        public String stageName{get;set;}
        @AuraEnabled
        public String Name{get;set;}   
    }   
  
}