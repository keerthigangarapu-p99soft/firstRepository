({
		
    handleChange : function(component, event, helper) {
        var selectedOptionValue = event.getParam("value");
     alert("Option selected with value: '"+ selectedOptionValue + "'");

 

       component.set("v.Gender",selectedOptionValue);
	},
    doInit : function(component, event, helper) {
        // Initialize the student object
        var newStudent = component.get("v.newStudent");
        newStudent.Name = ''; // Set default values as needed
        // Set other default values as needed
        component.set("v.newStudent", newStudent);
    },
      saveStudent : function(component, event, helper) {
        var newStudent = component.get("v.newStudent");
        
        // Call the Apex controller to insert the student record
        var action = component.get("c.insertStudent");
        action.setParams({
            "student": newStudent
        });
            action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var studentId = response.getReturnValue();
                // Navigate to the newly created student record's detail page
                var navEvt = $A.get("e.force:navigateToSObject");
                navEvt.setParams({
                    "recordId": studentId,
                    "slideDevName": "detail"
                });
                navEvt.fire();
            } else {
                // Handle error if needed
            }
        });
        $A.enqueueAction(action);
      }
    
})