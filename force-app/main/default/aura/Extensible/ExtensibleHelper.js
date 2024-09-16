({
	helperMethod : function(component,event) {
		var action=component.get("c.myName");
        action.setCallback(this,function(response){
          component.set("v.Phone1",response.getReturnValue())  ;
          component.set("v.flag",true)  ;
            
        });
        $A.enqueueAction(action);
	}
})