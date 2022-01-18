/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-18-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

@RestResource(urlMapping='/valverdesl-dev-ed.lightning.force.com/services/data/v43.0/sobjects/Account/ONB_ID_SESSION__c/idSesion')

global class patchPersonalDates {

    
    
    @HttpPatch
    
    global static void patchPersonalDates( string DNI, String processType, String Paso, String landingVersion, String legalDocument , 
    String PersonalPhone, String IDE, String PersonEmail, boolean PrivacyPolicy, date PrivacyPolicyDate, boolean TransferData, date DateTransferData, 
    boolean NotAdvertisingShipping, date NotAdvertisingShippingDate, boolean NewConditions, date NewConditionsDate, boolean NoEntityInformation, 
    date NoEntityInformationDate, boolean DNIValidation, date DNIValidationDate, boolean EmailValidation) {
        
        RestResponse response = RestContext.response;
        if (response == null) {
            response = new RestResponse();
            RestContext.response = response;
        }

        try {

            Account newClient = new Account(); 
            newClient = [SELECT id, birthdate__c,  birthplace__c, Civil_Status__c, DNI__c ,DNI_Validation__c, DNI_Validation_date__c, Email__c,  Email_Validation__c, 
                        Fax, Fisrt_Name__c,  gender__c,New_Conditions_Data_Use_date__c, New_Conditions_Data_Use__c, I_Accept_the_Privacy_Policy__c, I_do_not_accept_advertising_shipping__c ,Last_Name__c,  Nacionalidad__c, 
                        No_Entity_Information_Sources__c ,No_Entity_Information_Sources_date__c, Privacy_Policy_Date__c, Transfer_of_data__c, Transfer_of_data_date__c,
                        Validate_Phone__c, Advertising_shipping_date__c FROM account WHERE DNI__c = :dni];
            
            Contact oldContact = new Contact();
            oldContact = [SELECT id, Birthdate, birthplace__c, Civil_Status__c, DNI__c ,  
                            Fax, FirstName, gender__c, LastName, Nacionality__c FROM Contact WHERE DNI__c = :dni];
            
            case oldOnboard = new Case();
            oldOnboard = [SELECT Id, AccountId, DNI__c , Landing_Version__c, Legal_Documents_Version__c, ONB_Analytics_ID__c, ONB_Google_Analytics_Link__c, 
            ONB_ID_Session__c, ONB_utm_campaign__c, ONB_utm_content__c, ONB_utm_medium__c, ONB_utm_source__c, ONB_utm_term__c, Pasos__c, 
            Process_Type__c, Product__c FROM case WHERE AccountId = :newClient.ID limit 1];
            
            case newOnboard = new Case();

            ONB_phone__c telefono = new ONB_phone__c();

            ONB_identificacion__c inentificador = new ONB_identificacion__c();

            if (newClient != null) {
                try {

                    newClient.Email__c =PersonEmail;
                    newClient.I_Accept_the_Privacy_Policy__c = PrivacyPolicy;
                    newClient.Privacy_Policy_Date__c = PrivacyPolicyDate;
                    newClient.Transfer_of_data__c = TransferData;
                    newClient.Transfer_of_data_date__c = DateTransferData;
                    newClient.I_do_not_accept_advertising_shipping__c = NotAdvertisingShipping;
                    newClient.Advertising_shipping_date__c = NotAdvertisingShippingDate;
                    newClient.New_Conditions_Data_Use__c = NewConditions;
                    newClient.New_Conditions_Data_Use_date__c = NewConditionsDate;
                    newClient.No_Entity_Information_Sources__c = NoEntityInformation;
                    newClient.No_Entity_Information_Sources_date__c = NoEntityInformationDate;
                    newClient.DNI_Validation__c = DNIValidation;
                    newClient.DNI_Validation_date__c = DNIValidationDate;
                    newClient.Email_Validation__c = EmailValidation;
                    


                    if (oldContact != null && oldContact.DNI__c !=  dni) {
                        try {

                               
                                    newClient.Fisrt_Name__c = oldContact.FirstName;
                                    newClient.birthdate__c = oldContact.Birthdate;
                                    newClient.birthplace__c = oldContact.birthplace__c;
                                    newClient.Civil_Status__c = oldContact.Civil_Status__c;
                                    newClient.Fax = oldContact.Fax;
                                    newClient.Nacionalidad__c = oldContact.Nacionality__c;
                                    newClient.gender__c = oldContact.gender__c;
                          
                            
                        } catch (Exception e) {
                            response.addHeader( 'KO','');
                response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                response.statusCode = 400;
                            HandleCustomException.ErrorLog(e);
                        }
                    }
                    if (oldOnboard != null && oldOnboard.DNI__c !=  dni) {
                        try {
                            newOnboard.ONB_Analytics_ID__c = oldOnboard.ONB_Analytics_ID__c;
                            newOnboard.ONB_Google_Analytics_Link__c = oldOnboard.ONB_Google_Analytics_Link__c;
                            newOnboard.ONB_ID_Session__c = oldOnboard.ONB_ID_Session__c;
                            newOnboard.ONB_utm_campaign__c = oldOnboard.ONB_utm_campaign__c;
                            newOnboard.ONB_utm_content__c = oldOnboard.ONB_utm_content__c;
                            newOnboard.ONB_utm_medium__c = oldOnboard.ONB_utm_medium__c;
                            newOnboard.ONB_utm_source__c = oldOnboard.ONB_utm_source__c;
                            newOnboard.ONB_utm_term__c = oldOnboard.ONB_utm_term__c;
                            newOnboard.Product__c = oldOnboard.Product__c;
                            

                            
                            
                        } catch (Exception e) {
                            response.addHeader( 'KO','');
                            response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                            response.statusCode = 400;
                            HandleCustomException.ErrorLog(e);
                        }
                    }else {
                        try {
                           

                        } catch (Exception e) {
                            response.addHeader( 'KO','');
                response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                response.statusCode = 400;
                            HandleCustomException.ErrorLog(e);
                        }
                    }


                    newOnboard.AccountId = newClient.ID;
                    newOnboard.Process_Type__c = processType;
                    newOnboard.Pasos__c = Paso;
                    newOnboard.Landing_Version__c = landingVersion;
                    newOnboard.Legal_Documents_Version__c = legalDocument;

                    
                    


                    telefono.AccountId__C = newClient.ID;
                    telefono.Personal_phone__c = PersonalPhone;

                    database.update(newClient);
                    database.insert(newOnboard);
                    

                    database.insert(telefono);

                        inentificador.Onboarding__c = newOnboard.ID;
                        System.debug('newOnboard.ID  '+newOnboard.ID);
                        inentificador.id__c = IDE;
                        database.insert(telefono);

                    response.addHeader( 'OK','Created');
                    response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                    response.statusCode = 200;
                    
                } catch (DMLException e ) {
                    response.addHeader( 'KO','');
                response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                response.statusCode = 400;
                    HandleCustomException.ErrorLog(e);
                    
                }

                
            }else {
                response.addHeader( 'KO','');
                response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                response.statusCode = 400;
                
            }

            
        } catch (Exception e) {
            response.addHeader( 'KO','');
                response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                response.statusCode = 400;
            HandleCustomException.ErrorLog(e);
            
        }
    }
}