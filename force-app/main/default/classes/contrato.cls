/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-17-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class contrato {

    private final ONB_contract__c contract;

    public contrato() {
        contract = [SELECT Id, Contract_down_date__c, Contract_downloaded__c, Fisrt_Name__c, Landing_Version__c, Last_Name__c, Legal_Documents_Version__c, 
                    Owner.Name, Onboarding__r.DNI__c, Iaccepttheinformationpriorofcontracting__c, Process_Type__c, Pasos__c FROM ONB_contract__c 
                    WHERE Id = :ApexPages.currentPage().getParameters().get('id')];
    }
   
    public ONB_contract__c getContract() {
        return contract;
    }

}