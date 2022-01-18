/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-17-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/


@RestResource(urlMapping='/https/valverdesl-dev-ed.lightning.force.com/services/data/v43.0/sobjects/Account')

global class postNewClient {

    @HttpPost
    global static void postClient(String DNI ,String lastName, String processType, String Paso, String landingVersion, String legalDocument, String ONButmContent,
    String ONButmSource, String ONButmMedium, String ONButmTerm, String ONButmCampaign, String ONBAnalyticsID, String ONBIDSession, String ONBGoogleLink){
        RestResponse response = RestContext.response;
        if (response == null) {
            response = new RestResponse();
            RestContext.response = response;
        }
        try {

           
            System.debug('DNI  ' + DNI);
            Account Cliente = new Account();
            System.debug('Cliente  ' +Cliente);
            Cliente.DNI__c = DNI;
            System.debug('Cliente.DNI__c  '+ Cliente.DNI__c);
            Cliente.Name = lastName;
            Cliente.Last_Name__c = lastName;
            System.debug('Cliente.Last_Name__c  '+  Cliente.Last_Name__c);
            System.debug('Cliente   '+ Cliente);
            
            try {
                database.insert(Cliente);
                
            } catch (DMLException e) {
                System.debug( 'e' + e.getMessage());
                System.debug( 'e' + e);
                response.addHeader( 'OK','');
                response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                response.statusCode = 400;
                HandleCustomException.ErrorLog(e);
            }
                                                                         


            
            System.debug('Cliente id  ' +Cliente.id);
            if (Cliente != null) {
                Case Onboard = new Case();
                Onboard.accountid = Cliente.id;
              if (Onboard.accountid != null) {
                  try {
                    Onboard.Process_Type__c = processType;
                    Onboard.Pasos__c = Paso;
                    Onboard.Landing_Version__c = landingVersion;
                    Onboard.Legal_Documents_Version__c = legalDocument;
                    Onboard.ONB_utm_content__c = ONButmContent;
                    Onboard.ONB_utm_source__c = ONButmSource;
                    Onboard.ONB_utm_medium__c = ONButmMedium;
                    Onboard.ONB_utm_term__c = ONButmTerm;
                    Onboard.ONB_utm_campaign__c = ONButmCampaign;
                    Onboard.ONB_Analytics_ID__c = ONBAnalyticsID;
                    Onboard.ONB_ID_Session__c = ONBIDSession;
                    Onboard.ONB_Google_Analytics_Link__c = ONBGoogleLink;
                    System.debug( 'Onboard  ' +Onboard);
                    database.insert(Onboard);
                    response.addHeader( 'OK','Created');
                    response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                    response.statusCode = 200;
    
                  } catch (Exception e) {
                    System.debug( 'e 2' + e);
                    HandleCustomException.ErrorLog(e);
                  }
              }else {
                response.addHeader( 'KO','');
                response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                response.statusCode = 400;
              }
                

            }else {
                response.addHeader( 'KO','');
                response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                response.statusCode = 400;
            }


        } catch (Exception e) {
            System.debug( 'e 3' + e);
            HandleCustomException.ErrorLog(e);
        }

    


    }
}