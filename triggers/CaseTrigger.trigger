trigger CaseTrigger on Case (before insert, before update) {
    
    for(Case c : Trigger.new){
        c.OwnerId = '00528000002PPek';
    }
}