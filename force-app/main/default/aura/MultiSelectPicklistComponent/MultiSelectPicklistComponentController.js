({
    doInit : function(component, event, helper) {
        //  var parent=component.get("pVal");
        //  var childRef=component.get("cValRef");
        
        var parent=[
            {text:"India",value:"India"},
            {text:"Japan",value:"Japan"}
        ];
        var childRef={
            "India":[
                {text:"A",value:"A"}
            ],
            "Japan":[
                {text:"B",value:"B"}
            ]
        };
        
        component.set('v.pVal',parent);
        component.set('v.dValRef',childRef);
         component.set('v.Spinner',false);

    },
    
    fetchChildPicklist : function(component, event, helper) {
        
        var parent=component.find("parentPicklist").get("v.value");
       // var childRef=component.get("v.dValRef");
        if(parent=="India")
        {
                var action = component.get("c.getIndustry");
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
                component.set("v.dVal", a.getReturnValue());
       component.set('v.disabledPick',false);
            }
        });
        $A.enqueueAction(action);

        }
        }
      //  component.set('v.dVal',childRef[parent]);
      //  component.set('v.disabledPick',false);
       ,
    toggleSpinner  : function(component, event, helper) {
        component.set('v.Spinner',true);
                        var action = component.get("c.getIndustry");
        action.setCallback(this, function(a) {
            var state = a.getState();
            if (state === "SUCCESS"){
               component.set('v.Spinner',false);
            }
        });
        $A.enqueueAction(action);
         
            //    var spinner = component.find("mySpinner");
       // $A.util.toggleClass(spinner, "slds-hide");
    },
    
        showToast : function(component, event, helper) {
    var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
        "title": "Success!",
        "message": "The record has been updated successfully."
    });
    toastEvent.fire();
}
      
    
})