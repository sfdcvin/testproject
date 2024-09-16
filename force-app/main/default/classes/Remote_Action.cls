public class Remote_Action {
    
    /* RemoteAction : 
 * If you want to invoke the apex class directly in the javascript then we use Remote Action
 * Every remote action method should be defined with @RemoteAction
 * Every remote action method should be defined as static 
 * Every remote action can have parameters and return type
 */
    @RemoteAction
    public static string remote(string str){
        
        return str+'  sfdcDeveloper';
        
        
        
    }

}