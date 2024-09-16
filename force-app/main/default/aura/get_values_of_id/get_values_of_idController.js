({
	call : function(component) {
        var first=component.find("fname").get("v.value");
                var last=component.find("lname").get("v.value");
        var name=first+" "+last;
        
        component.find("myname").set("v.value",name);

		
	}
})