trigger triiggerOnAccount on Account (after insert,before update,before insert,after update) {
    if(trigger.isinsert ){
    if(trigger.isafter){
   // taskhandler.createrelatedcon(trigger.new);
   
    }
    else if(trigger.isbefore)
        {
           // taskhandler.copbiltoshipping(trigger.new,null);
            taskhandler.popurating(trigger.new,null);
        }
    }
    if (trigger.isupdate)
    {
        if(trigger.isbefore){
           // taskhandler.updatephoneDescr(trigger.new,trigger.oldmap);
            //taskhandler.copbiltoshipping(trigger.new,trigger.oldmap);
             //taskhandler.popurating(trigger.new,trigger.oldmap);
        }
        else if(trigger.isafter)
        {
           // taskhandler.updatedrelatedconphonefield(trigger.new,trigger.oldmap);
         // taskhandler.updatedrelatedconmailingaddress(trigger.new,trigger.oldmap);
           taskhandler.oppclosedlost(trigger.new,trigger.oldmap);
        }
    }
}