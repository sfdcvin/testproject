({
    doInit: function(component,  event, helper) {
        
            var action = component.get("c.actioname");
              
            action.setCallback(this, function(response){
                
                var state = response.getState();
                    if (state == "SUCCESS") {
                        var errors = response.getError();   
                       component.set("v.showError",true);
                            component.set("v.errorMessage","Error is Here");
                    }
                else if(state == "ERROR"){
                        var errors = response.getError();                       
                            component.set("v.showError",true);
                            component.set("v.errorMessage","Error is Here");
                           
                    }
            });            
            $A.enqueueAction(action);      
        
    },
    disableUtilityPopOut : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.disableUtilityPopOut({
            disabled: true,
            disabledText: "Pop-out is disabled"
        });
    },
     openUtilityBar : function(component, event, helper) {
        var utilityAPI = component.find("utilitybar");
        utilityAPI.openUtility();
    },

    openTab: function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.openTab({
            pageReference: {
                "type": "standard__recordPage",
                "attributes": {
                    "recordId":"0017F00000t4m2XQAQ",
                    "actionName":"view"
                },
                "state": {}
            },
            focus: true
        }).then(function(response) {
            workspaceAPI.getTabInfo({
            tabId: response
        }).then(function(tabInfo) {
            console.log("The recordId for this tab is: " + tabInfo.recordId);
        });
        }).catch(function(error) {
            console.log(error);
        });
    },

    focusNavigationItem : function(component, event, helper) {
        var navigationItemAPI = component.find("navigationItem");
        navigationItemAPI.focusNavigationItem().then(function(response) {
            console.log(response);
        })
        .catch(function(error) {
            console.log(error);
        });
    } ,
     doAction : function(component, event) {
        var inputCmp = component.find("inputCmp");
        var value = inputCmp.get("v.value");
            var inputCmp1 = component.find("inputCmp1");
        var value1 = inputCmp1.get("v.value");

        // is input numeric?
        if (isNaN(value) || isNaN(value1) ) {
            inputCmp.set("v.errors", [{message:"Input not a number: " + value}]);
            inputCmp1.set("v.errors", [{message:"Input not a number: " + value1}]);
        } else {
            inputCmp.set("v.errors", null);
             inputCmp1.set("v.errors", null);
        }
    },

    handleError: function(component, event){
        /* do any custom error handling
         * logic desired here */
        // get v.errors, which is an Object[]
        var errorsArr  = event.getParam("errors");
        for (var i = 0; i < errorsArr.length; i++) {
            console.log("error " + i + ": " + JSON.stringify(errorsArr[i]));
        }
    },

    handleClearError: function(component, event) {
        /* do any custom error handling
         * logic desired here */
    },
    throwError : function(component, event){
        throw new Error("I can’t go on. This is the end.");
    }
})