({
	doInit : function(component, event, helper) {
		var oppId = component.get("v.recordId");
        //alert('-----oppId-----'+oppId);
        var action = component.get("c.fetchMatrix");
        action.setParams({"oppId" : "0067F00000OCPpPQAX"
        });
        
        action.setCallback(this,function(response){
            //debugger;
            var state=response.getState();
            if(state=="SUCCESS"){
               var result=response.getReturnValue();
               // alert('------result------'+result);
                component.set("v.slaData",result);
            }
                });
        
         $A.enqueueAction(action);  
      
	},
    
})