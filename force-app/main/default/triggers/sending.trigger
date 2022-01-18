trigger sending on Contact ( after update) {
    Contact a = Trigger.New[0];
    String plantilla = 'Spam';
   
    if (a.toSend__c == true){
        

         EmailManagerClass.emailSend(a.Id, plantilla);

    }else{
        system.debug('error');
    }
}