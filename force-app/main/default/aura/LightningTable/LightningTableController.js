({
    doInit : function(component, event, helper) {
     //   var recID = component.get("v.recordId");
        var action = component.get("c.ContactLists");

        action.setCallback(this, function(response){
            var data = response.getReturnValue();
            component.set("v.contactList", data);
        });
        $A.enqueueAction(action);
    }
})