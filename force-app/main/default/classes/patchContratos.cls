/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-14-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@RestResource(urlMapping='/Contact/ONB_ID_Session__c/idSesion/*')

global class patchContratos {
    @HttpPatch
    global static void patchContratos(id onboardID, String processType, String Paso, String landingVersion, String legalDocument,boolean ContractDownloaded,Date ContractDownDate,boolean acept) {
        string tipo = 'GDPR';
        RestResponse response = RestContext.response;
        if (response == null) {
            response = new RestResponse();
            RestContext.response = response;
        }
        if(onboardID != null){
            try {
                ONB_contract__c contrato = new ONB_contract__c();
                contrato.Onboarding__c = onboardID;
                contrato.Process_Type__c= processType;
                contrato.Pasos__c = Paso;
                contrato.Landing_Version__c = landingVersion;
                contrato.Legal_Documents_Version__c = legalDocument;
                contrato.Contract_downloaded__c = ContractDownloaded;
                contrato.Contract_down_date__c = ContractDownDate;
                contrato.Iaccepttheinformationpriorofcontracting__c = acept;
                contrato.tipe__c= tipo;
                if (contrato != null) {
                    try {
                        database.insert(contrato);
                        response.addHeader( 'OK','Created');
                    response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                    response.statusCode = 200;

                    } catch (Exception e) {
                        response.addHeader( 'KO','');
                response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                response.statusCode = 400;
                HandleCustomException.ErrorLog(e);
                    }
                }else {
                    
                }
            } catch (Exception e) {
                System.debug( 'e  ' + e);
                response.addHeader( 'KO','');
                response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                response.statusCode = 400;
                HandleCustomException.ErrorLog(e);
            }
        }else {
            
        }




    }
}