public class NewCaseListController {

    
    public  List<Case> getNewCases()
    {
        return [select id,casenumber from case where status=:'new'];
    }
}