({
	show : function(component) {
        var aval=component.get("v.aval");
        var bval=component.get("v.bval");
        var cval=aval+bval;
        component.set("v.cval",cval);
        
		
	}
})