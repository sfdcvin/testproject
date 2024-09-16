({
	getacc : function(component) {
        var name=component.get("v.name");
        
        
        var action=component.get("c.getData");
        action.setParams({ "name1" :name});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS")
            {
                component.set("v.accounts",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
        
                           }	
	
})