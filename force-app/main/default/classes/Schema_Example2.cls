/* getDescribe() : 
 * 1. This method will return you description about the given sobject.
 * 2. This method will return you Schema.DescribeSobjectResult 
 * 3. Schema.DescribeSobjectResult: 
 * 	 1. This is a predefined apex class .
 * 	 2. This class contain all the methods required to retrive the metadata information 
 */
public class Schema_Example2 {
    public  Map<string,object> resMap {set;get;}
  
    
    public Schema_Example2()
    {
        
       resMap=new Map<string,object>();
        Schema.DescribeSObjectResult result=Lead.SObjectType.getDescribe();
        resMap.put('Label',result.getLabel());
        resMap.put('Name',result.getName());
        resMap.put('PuralLabel',result.getLabelPlural());
        resMap.put('Custom',result.isCustom());	
        resMap.put('CustomSetting',result.isCustomSetting());
        resMap.put('Read',result.isAccessible());
        resMap.put('Edit',result.isUpdateable());
        resMap.put('Delete',result.isDeletable());
        resMap.put('Undelete',result.isUndeletable());
        resMap.put('Query',result.isQueryable());
        resMap.put('Merge',result.isMergeable());
        
    }
    

}