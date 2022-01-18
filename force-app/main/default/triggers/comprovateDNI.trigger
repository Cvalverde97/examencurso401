/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-18-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger comprovateDNI on Account (before Update) {

    for(Account acc : Trigger.New) {
        
        contact cont = [SELECT Id,DNI__C 
                             FROM contact WHERE AccountId=:acc.Id limit 1];
        if (acc.DNI__C != cont.DNI__C) {
            acc.addError('El DNI no coincide');
        }else {
            Update acc ;
        }
      
    }

}