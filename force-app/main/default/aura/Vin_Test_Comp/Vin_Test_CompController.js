({
        
        doInit : function(component, event, helper) {
            
            
            // component.set("v.details",component.get("v.name")+' '+component.get("v.phone")); 
            
            var action = component.get("c.callAction");
            // Add callback behavior for when response is received
            action.setParams({  "name" : component.get("v.name"), "phone" : component.get("v.phone") });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    
                    component.set("v.isFirstLogin", response.getReturnValue());
                    
                }
                else {
                    component.set("v.details", 'Error');
                    console.log("Failed with state: " + state);
                }
            });
            // Send action off to be executed
            $A.enqueueAction(action);
        },
        
        handleClick : function(component, event, helper) {
            
            
            component.set("v.details",component.get("v.name")+' '+component.get("v.phone")); 
            var action = component.get("c.callAction");
            // Add callback behavior for when response is received
            action.setParams({  "name" : component.get("v.name"), "phone" : component.get("v.phone") });
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    console.log(response.getReturnValue());
                    console.log("vineet");
                    component.set("v.isFirstLogin", response.getReturnValue());
                }
                else {
                    component.set("v.details", 'Error');
                    console.log("Failed with state: " + state);
                }
            });
            // Send action off to be executed
            $A.enqueueAction(action);
        },
        submitDetails: function(component, event, helper) {
            // Set isModalOpen attribute to false
            //Add your code to call apex method or do some processing
            // component.set("v.isFirstLogin", false);
            window.open("https://www.w3schools.com");
        },
        
        closeModel: function(component, event, helper) {
            // Set isModalOpen attribute to false  
            component.set("v.isFirstLogin", false);
        },
        
 showInfoToast : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : 'Info Message',
            message: 'Mode is dismissible ,duration is 5sec and this is normal Message',
            messageTemplate: 'Record {0} created! See it {1}!',
            duration:' 5000',
            key: 'info_alt',
            type: 'info',
            mode: 'dismissible'
        });
        toastEvent.fire();
    },
    showSuccessToast : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : 'Success Message',
            message: 'Mode is pester ,duration is 5sec and this is normal Message',
            messageTemplate: 'Record {0} created! See it {1}!',
            duration:' 5000',
            key: 'info_alt',
            type: 'success',
            mode: 'pester'
        });
        toastEvent.fire();
    },
    showErrorToast : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : 'Error Message',
            message:'Mode is pester ,duration is 5sec and Message is not overrriden because messageTemplateData is not specified',
            messageTemplate: 'Mode is pester ,duration is 5sec and Message is overrriden',
            duration:' 5000',
            key: 'info_alt',
            type: 'error',
            mode: 'pester'
        });
        toastEvent.fire();
    },
    showWarningToast : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            title : 'Warning',
            message: 'Mode is pester ,duration is 5sec and normal message',
            messageTemplate: 'Mode is sticky ,duration is 5sec and Message is overrriden because messageTemplateData is {1}',
            messageTemplateData: ['Salesforce', {
                url: 'http://www.webkul.com/',
                label: 'Click Here',
            }],
            duration:' 5000',
            key: 'info_alt',
            type: 'warning',
            mode: 'sticky'
        });
        toastEvent.fire();
    },
        
    })