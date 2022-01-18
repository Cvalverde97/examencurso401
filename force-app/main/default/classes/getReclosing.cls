/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-15-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

@RestResource(urlMapping='/pantalla001?dni=(numDNI)?Origen=(valorOrigen)')

global class getReclosing {

    
    @HttpGet
    global static Contact Reclosing() {
        String dni = '';
        String Origen = '';
        RestRequest restReq = RestContext.request;
        RestResponse response = RestContext.response;
       
        if (response == null) {
            response = new RestResponse();
            RestContext.response = response;
        }


        dni = restReq.requestURI.substring(restReq.requestURI.lastIndexOf('/')+1);
        Origen = restReq.requestURI.substring(restReq.requestURI.lastIndexOf('/')+1);

        Contact cont =  [SELECT id, Phone, Validate_Phone__c, DNI__c FROM contact WHERE DNI__c = :dni limit 1];

        Case Orig = [SELECT id, Origin, DNI__c FROM Case WHERE DNI__c = :dni limit 1];

        
        if(cont.Validate_Phone__c = true){
           
            if( Orig.Origin == Origen ){
                try {
                    response.addHeader( 'OK','');
                    response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                    response.statusCode = 200;
                    return cont;
                } catch (Exception e) {
                    
                    response.addHeader( 'KO','');
                    response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                    response.statusCode = 400;
                    return null;
                }
                
            }else{
                
                response.addHeader( 'Ko','');
                response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                response.statusCode = 400;
                
                
                return null;
                
                
            }
        }else{
            response.addHeader( 'Ko','');
                    response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                    response.statusCode = 400;
            
            return null;
        }

    }
}