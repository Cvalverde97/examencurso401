/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-18-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger Pasos on Case (before Update) {
    for (Case onb : Trigger.new ) {
        case oldONB = [SELECT pasos__c FROM case WHERE ID = :onb.Id limit 1];

        if(oldONB.pasos__c != onb.pasos__c){
            Update  onb;
        }else {
            break;
        }
    }
}