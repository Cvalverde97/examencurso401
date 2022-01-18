/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-18-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest 
public with sharing class postCallTest {
    @isTest static void TrueCallTest() {
        String phone = '123456789';
        Task tarea = new Task();
        tarea.Phone__c = phone;
        Test.startTest();
        postCall.Calling(tarea);
        Test.stopTest();
    }
    @isTest static void emptyCallTest() {
        String phone = '';
        Task tarea = new Task();
        tarea.Phone__c = phone;
        Test.startTest();
        postCall.Calling(tarea);
        Test.stopTest();
    }
    @isTest static void NullCallTest() {
        String phone = null;
        Task tarea = new Task();
        tarea.Phone__c = phone;
        Test.startTest();
        postCall.Calling(tarea);
        Test.stopTest();
    }

}
