({
	//conList : function(component, event, helper) {
		 conList: function(component){
        debugger;
        var action = component.get("c.returnWrapper");
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state ==="SUCCESS"){
                alert("This are list of contacts from apex Class");
                var result = response.getReturnValue();
                
                component.set("v.wrapperSample",result);
                component.set("v.AccountVar",result.Accounts);
                component.set("v.contactsvar",result.Contacts);
                component.set("v.oppvar",result.Opportunities);
                
                
                
             
            }else if(state === "INCOMPLETE"){
                alert("The state is incomplete");
            }else if(state === "ERROR"){
                var error = response.getError();
                if(error){
                    console.log("Error"+errors);
                }
            }
        })
        $A.enqueueAction(action);
    }
})