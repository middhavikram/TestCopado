trigger OpportunityTrigger on Opportunity (before update, after update) {
    new OpportunityTriggerHandler().run();
}