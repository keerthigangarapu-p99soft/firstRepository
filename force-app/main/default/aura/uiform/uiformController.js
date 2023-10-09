({

	
    handleChange : function(component, event, helper) {
        var selectedOptionValue = event.getParam("value");
     alert("Option selected with value: '" + selectedOptionValue + "'");

 

       component.set("v.Gender",selectedOptionValue);

 

    },
    handleClick : function(component, event, helper) {
        var action =  component.get("c.exampleControllerMethod");
        action.setParams({
            'parameters':{
                'Name' : component.find("Name").get("v.value"),
                'Gender':component.get("v.Gender"),
                'Phone': component.find("Phone").get("v.value"),
                'Address':component.find("Address").get("v.value")
            }
        });

 

        action.setCallback(this,function(response){
            var state = response.getState();
            if(component.isValid() && state === "SUCCESS"){
                var result = response.getReturnValue();
                component.set("v.studentvar",result);
                console.log(result);

 

            }
        });
        $A.enqueueAction(action);
    }
})