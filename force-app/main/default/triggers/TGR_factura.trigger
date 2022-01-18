/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-02-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger TGR_factura on Factura__c (before insert) {

    for (Factura__c f : trigger.new) {
        f.Enviar_factura__c = true;
    }

}