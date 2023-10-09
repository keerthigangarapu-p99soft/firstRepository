({
	doinit : function(component, event, helper) {
		//declare the action
		var action = component.get("c.getcontactlist");
        //step2:declare parameters
        //action.setParams({firstname:component.get("v.firstname")})
        //step3 define the callbackfunction
        action.setCallback(this,function(response){
                           var state =response.getState();
            
        if(state=="SUCCESS")
        {
           // alert("this is server::"+response.getReturnvalue());
           var response=response.getReturnValue();
            component.set("v.contactlist",response);
        }
        else if(state=="INCOMPLETE")
        {
            //do something
        }
            else if(state=="ERROR")
            {
                var error=response.getError();
                if(error)
                {
                    console.log("error"+errors);
                }
            }
        
                           });
    //step4 eque the action
    $A.enqueueAction(action);
	}
})