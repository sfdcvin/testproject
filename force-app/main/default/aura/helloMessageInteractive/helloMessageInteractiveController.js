({
	myAction : function(component, event, helper) {
		var btn=event.getSource();
        var btnlbl=btn.get("v.label");
        component.set("v.message",btnlbl);
	}
})