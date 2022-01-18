/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-18-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

@RestResource(urlMapping='/Task/*')
global with sharing class postCall {
    @AuraEnabled(cacheable=true)
    @HttpPost
    global static Void Calling(Task llamada ) {
        System.debug('llamada  '+ llamada);
        RestResponse response = RestContext.response;
        if (response == null) {
            response = new RestResponse();
            RestContext.response = response;
        }
        try {
                   
            if( llamada.Phone__c != null && llamada.Phone__c != '' ){
                try {
               
                String type = 'Onboarding';
                String subj = 'Call';


               
                     
                      
 
                llamada.subject = subj;
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
                    
             
                
                
    
    
                } catch (Exception e) {
                    System.debug('e  1'+ e);
                    HandleCustomException.ErrorLog(e);
                    response.addHeader( 'OK','Created');
                    response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                    response.statusCode = 400;
                    
                   
                    
                   
               } 
            }  
            response.addHeader( 'OK','Created');
                    response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
                    response.statusCode = 400;
        } catch (Exception e) {
            System.debug('e  2'+ e);
            
               HandleCustomException.ErrorLog(e); 
            response.addHeader( 'Ko','');
            response.responseBody = Blob.valueOf(JSON.serialize('prueba'));
            response.statusCode = 400;       
        }
    }  
}