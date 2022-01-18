public class EmailManagerClass {
    public static void emailSend(List<ID> ides, list<String> dname){


        messaging.SingleEmailMessage correo = new messaging.SingleEmailMessage();
        
        List<EmailTemplate> mail = [SELECT Id,  Subject, Body FROM EmailTemplate WHERE DeveloperName = :dname];
        
        List<Contact> cont = [SELECT ID, Account.id, Name, email FROM Contact WHERE ID = :ides ];
        
        if(cont.size() == 0 ){
            System.debug('No existen datos o son incorrectos');
        }else{
        	correo.setTemplateID(mail[0].Id);
            correo.setWhatId(cont[0].Account.Id);
            correo.toAddresses = new String[] { cont[0].email};
            correo.targetobjectid = cont[0].id;
            messaging.SingleEmailMessage[] envio = new List<messaging.SingleEmailMessage> {correo};
            
            messaging.SendEmailResult[] resultado = messaging.sendEmail(envio);
            
            if (resultado[0].success) 
                 {
                   System.debug('Email exitoso.');
                 } else {
                   System.debug('Fallo.'+ resultado[0].errors[0].message);
                 }
    }
}
}