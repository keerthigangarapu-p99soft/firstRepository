trigger triggerOnOpportunity on Opportunity (before insert,before update,after update) {
    if(trigger.isbefore){
    if(trigger.isinsert)
{
    taskhandler.updateoppdesbasedonstage(trigger.new,null);
}
    
        else if(trigger.isupdate)
        {
          taskhandler.updateoppdesbasedonstage(trigger.new,trigger.oldmap);  
        }
    }
        if(trigger.isafter)
        {
            if(trigger.isupdate){
                taskhandler.createtaskwhenstageischanged(trigger.new,trigger.oldmap);
            }
        }

}