({
        doInit: function(component, event, helper) {
        var action = component.get("c.getIndustry");
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                component.set("v.CountryPicklist", a.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    
        }
    
    ,
	submitForm : function(component, event, helper) {
        console.log("******* " + JSON.stringify(component.get("v.developer")));
     //   var dev = component.get("v.developer");
        var action = component.get("c.saveDeveloper");
        
            action.setParams({  "dev" : component.get("v.developer")});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
               // component.set("v.isFirstLogin", response.getReturnValue());
                
            }
            else {
              //  component.set("v.details", 'Error');
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
		
	}
})