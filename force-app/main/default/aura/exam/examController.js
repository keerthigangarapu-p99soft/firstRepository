({
	doInit : function(component, event, helper) {
	 
        var data={'name':'test name',
                  'email':'emailsjh@gmail.com'};
        component.set("v.jsobject",data);
        component.set("v.userdata",
                      {
                          'mystring':'keerthi',
                          'myinteger':'2023'
                      }
                     )
	},
    clickfun:function(component, event, helper) {
    component.set("v.message1","buttonclicked")
}
})