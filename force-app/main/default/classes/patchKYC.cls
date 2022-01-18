/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-14-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

@RestResource(urlMapping='/Contact/ONB_ID_Session__c/idSesion/')

global  class patchKYC {
    @HttpPatch
    global static void patchKYC(id onboardID, String processType, String Paso, String landingVersion, String legalDocument,String CivilStatus,String OptInCode) {
        //Nombre, Apellidos, Sexo, Nacionalidad, País/Lugar de nacimiento, Fecha de nacimiento
        RestResponse response = RestContext.response;
        if (response == null) {
            response = new RestResponse();
            RestContext.response = response;
        }
        
        if (onboardID != null) {
            try {
                String tipo = 'KYC';
                case datosCliente = new case();
                datosCliente = [SELECT ID,	AccountId, account.Fisrt_Name__c, account.Last_Name__c, account.gender__c, account.Nacionalidad__c, 
                    account.birthplace__c, account.birthdate__c, account.Civil_Status__c FROM case WHERE ID = :onboardID];

                if (datosCliente != null ) {
                    try {
                        ONB_contract__c KYC = new ONB_contract__c();
                        KYC.Process_Type__c = processType;
                        KYC.Pasos__c = Paso;
                        KYC.Landing_Version__c = landingVersion;
                        KYC.Legal_Documents_Version__c = legalDocument;
                        if (datosCliente.account.Civil_Status__c == CivilStatus) {
                            KYC.Civil_Status__c = CivilStatus;
                        }else {
                            KYC.Civil_Status__c = datosCliente.account.Civil_Status__c;
                        }
                        KYC.Fisrt_Name__c = datosCliente.account.Fisrt_Name__c;
                        KYC.Last_Name__c = datosCliente.account.Last_Name__c;
                        KYC.gender__c = datosCliente.account.gender__c;
                        KYC.Nacionalidad__c = datosCliente.account.Nacionalidad__c;
                        KYC.birthplace__c = datosCliente.account.birthplace__c;
                        KYC.birthdate__c = datosCliente.account.birthdate__c;
                        KYC.Tipe__c =  tipo;

                        if (KYC != null) {
                            try {
                                database.insert(KYC);
                                response.addHeader( 'OK','Created');
                                response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                                response.statusCode = 200;
                            } catch (DMLException e) {
                                
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
        }else {
            response.addHeader( 'KO','');
                response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                response.statusCode = 400;
        }
        

    }
}