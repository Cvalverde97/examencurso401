@RestResource(urlMapping='/Test_CV/*')

global class test_listas {
    @HttpPost
    global static void postNumber(list<String> phone) {

        
        if(!phone.isEmpty()){
            
        				    //Task recover = new task();
            List<string> llamada = new List<string>();
       						//for (Task recover : llamada){ 
            String type = 'Onboarding';
            String sub = 'Call';
            System.debug( phone.size() ); //quitar
            
            
            for (integer i = 0 ; phone.size() > i  ; i++){
                 
                
                  System.debug('i: '+ i); //quitar
                					//  System.debug( 'for recover ' + recover); //quitar
                  // System.debug( 'lista completa llamada: ' + llamada);  //quitar
                   
                    	// llamada[i] = phone[i]; 
                    	// recover.subject = sub;
                    	// recover.Process_Type__c =  type;
                    llamada.add(i, phone[i]);
                  		// System.debug( 'add recover' +recover);
                  System.debug( 'lista completa llamada: ' + llamada);
                } 
            // }
            

            System.debug('lista completa llamada: ' + llamada);

            //database.insert(llamada);
            

        }else{
            Exception e;
        }

    }
}