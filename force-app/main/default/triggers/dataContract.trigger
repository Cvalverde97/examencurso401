/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-18-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger dataContract on case (before insert) {
    
    
    
    for (Case onb : Trigger.new ) {
        ONB_contract__c contr = new ONB_contract__c();
        contr.Onboarding__c = onb.id;
        contr.Tipe__c = 'Datos';

        if (contr != null) {
            insert contr;
        }
    }
}