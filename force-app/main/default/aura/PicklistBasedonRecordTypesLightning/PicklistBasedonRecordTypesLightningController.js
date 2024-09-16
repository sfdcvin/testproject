({
    doInit : function(component, event, helper) {
        helper.getPicklistValuesBasednRecordType(component);
    },
    gotoURL : function(component, event, helper) {
         window.open(window.location.origin + '/apex/List_Example?id=0667F000007gsz0', '_self');
    },
})