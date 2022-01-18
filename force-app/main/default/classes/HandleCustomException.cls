/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 01-13-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public  class HandleCustomException extends Exception {
    public static void ErrorLog(Exception e) {
       
		    String stackTrace = e.getStackTraceString().substringBefore('\n');
            System.debug('stackTrace  ' + stackTrace);
		    String className = stackTrace.substringAfter('.').substringBefore('.');	
            System.debug('className  ' + className);
            


            Error_Log__c exc = new Error_Log__c();
            
            exc.Class__c = className;
            exc.Line_number__c = e.getLineNumber();
            exc.Error__c = e.getMessage();
            exc.Tipe__c = e.getTypeName();
			exc.Causante__c = String.valueOf(e.getCause());
			exc.Usuario__c = UserInfo.getUserId();
            
            
            System.debug('stackTrace  ' + e.getStackTraceString());
            System.debug('exc  ' + exc);
            try {
                database.insert(exc);
            } catch (Exception er) {
                System.debug('er ' + er);
            }
            
    }
}