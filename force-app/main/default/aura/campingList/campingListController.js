({
    clickCreateItem: function(component, event, helper) {
        var validItem = component.find('Campingform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validItem){
            
      /*      
            
            // Create the new expense
            var TheItems = component.get("v.items");
           // console.log("Create expense: " + JSON.stringify(newItem));
            
            // var NewItem = component.get("v.newItem");
            var TheNewItem = JSON.parse(JSON.stringify(component.get("v.newItem")));
            
 
        // Copy the expense to a new object
        // THIS IS A DISGUSTING, TEMPORARY HACK
       // var ThenewItem = JSON.parse(JSON.stringify(newItem));
 
        TheItems.push(TheNewItem);
        component.set("v.items", TheItems);
        
     */
            var newItem = component.get("v.newItem");
            helper.createItem(component,newItem);
            
            
          component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c', 'Name': '', 'Quantity__c': 0, 'Price__c': 0, 'Packed__c': false }); 
            
  
            
        }
    },
    
    doInit: function(component, event, helper) {
        // Create the action
        var action = component.get("c.getItems");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    }
})