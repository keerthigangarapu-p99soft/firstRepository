trigger triggerOnCase on Case (after insert) {
taskhandler.latestcasenumber(trigger.new);
}