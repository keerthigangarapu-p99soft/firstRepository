({
	/*doclick : function(component, event, helper) {

        alert(component.getName());
        alert(component.get('v.whom'));
        component.set('v.whom','wwelocome back');
        var ageco= component.find("testinput");
        alert(ageco.get('v.value'));
        ageco.set('v.value',1000);
	}*/
    doinit : function(component, event, helper) {
        var action = component.get('c.getcontactlist');
        //optional
       action.setParams({
           accountId:component.get('v.recordId'),
        });
        action.setCallback(this,function(response){ 
            var responseValue= response.getReturnValue();
            console.log('responseValue',responseValue);
            component.set('v.contactlist',responseValue);
            
        });
        $A.enqueueAction(action,false);
    },
    doredirect:function(component, event, helper){
        var eventSource= event.getSource();
        var id=eventSource.get('v.name');
        
        var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      "recordId": id,
      "slideDevName": "detail"
    });
    navEvt.fire();
        
    }
    
})