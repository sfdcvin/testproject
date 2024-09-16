({
    
	abb : function(cmp,event,helper) {
        console.log('cming');
        var action = cmp.get("c.serverEcho");
       // action.setParams({ "FirstName" : cmp.get("v.FirstName") });

       
        action.setCallback(this, function(response) {
            var state = response.getState();
         	console.log('cming 2');  
            if (state === "SUCCESS") 
              {
                 cmp.set("v.Accounts",response.getReturnValue());
                  console.log('cming 3 ' + response.getReturnValue());
              }
});
          
             $A.enqueueAction(action);
}    
})