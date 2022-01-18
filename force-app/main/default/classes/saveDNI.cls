/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-17-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class saveDNI {
    public static void DNI( string id) {
        
        Account acc = new Account();
        acc = [SELECT DNI__c FROM Account WHERE ID = :id];
         acc.dni;
    }
}
