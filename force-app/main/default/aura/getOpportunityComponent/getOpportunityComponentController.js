({
   doInit : function(component, event, helper) {

        var action = component.get('c.getOpportunity');
         
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS"){
                component.set("v.searchResult",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
        
    }
})