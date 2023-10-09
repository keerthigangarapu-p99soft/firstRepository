({
	add : function(component, event, helper) {
        alert("client side controller called")
        var total = component.get("v.firstnumber")+component.get("v.secoundnumber");
        component.set("v.total",total);
	},
    sub : function(component, event, helper) {
        alert("client side controller called")
        var total = component.get("v.firstnumber")-component.get("v.secoundnumber");
        component.set("v.total",total);
    },
    multipy:function(component, event, helper) {
        alert("client side controller called")
        var total = component.get("v.firstnumber")*component.get("v.secoundnumber");
        component.set("v.total",total);
    },
    div:function(component, event, helper) {
        alert("client side controller called")
        var total = component.get("v.firstnumber") / component.get("v.secoundnumber");
        component.set("v.total",total);
    },
    mod:function(component, event, helper) {
        alert("client side controller called")
        var total = component.get("v.firstnumber") % component.get("v.secoundnumber");
        component.set("v.total",total);
    },
    doinit:function(component, event, helper){
        component.set("v.var1","demo value fromcontoller")
    }
    
    
})