({
	creatcon : function(component, event, helper) {
		var action = component.get('c.createcontact');
        
        action.setParams({
            con:component.get('v.createcontact'),
            AccountId:component.get('v.accountId')
        });
        
        action.setCallback(this,function(response){
            
            var state = response.getState();
            
            alert(state);
            
            if(state==='SUCCESS' ||state==='DRAFT'){
            var responseValue = response.getReturnValue();
            }
            else if(state==='INCOMPLETE'){
                
                
            }
                else if(state==='ERROR'){
                    
                    var errors=response.getError();
                    
                    console.log('error',errors);
                    
                    if(errors||errors[0].message){
                        
                        
                        
                    }
                }
            
            
        },'ALL');
        
        $A.enqueueAction(action);
	}
})