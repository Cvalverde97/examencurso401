/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-18-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger ComercialIsues on Account (before Update) {

    for (account acc : Trigger.New ) {
       
            case onb = [SELECT Id, Status 
            FROM case WHERE AccountId=:acc.Id limit 1];
        if (onb.Status == 'Closed') {
            acc.addError('Cancelacion, por motivos comerciales.');
        }else{
            Update acc;
        }

        
    }

}