/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-17-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/


@RestResource(urlMapping='/Task/')
global class postWelcome {
    @AuraEnabled(cacheable=true)
    @HttpPost
    global static String postNumber(String phone) {
        RestResponse response = RestContext.response;
        if (response == null) {
            response = new RestResponse();
            RestContext.response = response;
        }
        try {

           
            
            if( phone != null && phone != '' ){
                try {
                    Task llamada = new Task();
    
                String type = 'Onboarding';
                String sub = 'Call';


               
                     
                      
                llamada.Phone__c= phone; 
                llamada.subject = sub;
                llamada.Process_Type__c =  type;
                        
    
                System.debug('llamada  '+ llamada);
            
                
                database.insert(llamada);
                   
               System.debug( 'response 1 ' + response);
               
               
               
               response.addHeader( 'OK','Created'); 
               
                    System.debug( 'response 2 ' + response);
                response.responseBody = Blob.valueOf(JSON.serialize('Created'));
                    System.debug( 'response 3 ' + response);
                    response.statusCode = 201;
                    
                    System.debug( 'response 4 ' + response);
                    return type; 
             
                
                
    
    
                } catch (Exception e) {
                    System.debug('e  1'+ e);
                    HandleCustomException.ErrorLog(e);
                    response.addHeader( 'OK','Created');
                    response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                    response.statusCode = 400;
                    
                   return null;
                    
                   
               } 
            } 
            response.addHeader( 'OK','Created');
                    response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                    response.statusCode = 400;
        } catch (Exception e) {
            System.debug('e  2'+ e);
            
               HandleCustomException.ErrorLog(e); 
            response.addHeader( 'OK','Created');
            response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
            response.statusCode = 400;
            return null;    
                    
                    
        }
        return null; 
    }  

    }