({
    saveContactRecord : function(component, event, helper) {
       var firstname = component.find("firstname");
        var lastname = component.find("lastname");
        
        // Required Field Message    
        // Is input numeric?
        if(firstname.get("v.validity").valid && lastname.get("v.validity").valid )  {
            // continue processing
        } else {
            firstname.showHelpMessageIfInvalid();
            lastname.showHelpMessageIfInvalid();
        }
        var cont=component.get("v.objContact");
        var isValid = true;
        console.log(cont);
        console.log("Test");
        if(component.get("v.selectedLookUpRecord").Id != undefined){
            component.set("v.flag",false);
            cont.AccountId=component.get("v.selectedLookUpRecord").Id;
        }
        else{
            component.set("v.flag",true);
            return false;
            isValid = false;
        }
        if(isValid)
        {

            var lastPart=window.location.href.split("=").pop()
            console.log("Last Part"+lastPart);
            var action = component.get('c.callMe');
            action.setParams({
                'accountId' : lastPart
                
            }); 
            /*    action.setParams({
                'con': cont
            })   */
        
     //        var action = component.get('c.callMe');
      //      action.setParams({"accountId": component.get("v.recordId")});
       //      console.log("AccountId"+action.setParams({"accountId": component.get("v.recordId")}));
            action.setCallback(this, function(response) {
                var state = response.getState();
                console.log("Test123");
                if (state === "SUCCESS"){
                    console.log("Test123");
                       var url = window.location.origin + '/' + response.getReturnValue();
                      window.open(url, '_SELF');
                }
                
            });
            $A.enqueueAction(action);
        }
    
    }
    
})