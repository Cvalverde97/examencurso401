@Restresource (urlmapping= '/restemail/*')
global class Restsendemail {
  
    @httppost global static void putcorreo(List<ID> ides, list<String> dname){
       
        EmailManagerClass.emailSend(ides, dname);
 
    }
 
}