public with sharing class AccountController {
     
    /*
    * CRM-101 changes begin
    */
    @AuraEnabled(cacheable=true)
    public static Account getSingleAccountByName(String nameOfAccount) {
        return [
            SELECT Id, Name, Phone, Type,OwnerId
            FROM Account
            WHERE Name =: nameOfAccount
            WITH SECURITY_ENFORCED
            LIMIT 1
        ];
    }
   /*
    * CRM-101 changes end
    */

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [
            SELECT Id, Name
            FROM Account
            WITH SECURITY_ENFORCED
            LIMIT 10
        ];
    }

    @AuraEnabled(cacheable=true)
    public static Account getSingleAccount() {
        return [
            SELECT Id, Name, Phone, Type
            FROM Account
            WITH SECURITY_ENFORCED
            LIMIT 1
        ];
    }

   /*
    * CRM-101 changes begin
    */
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountByIds(List<Id> setOfAccountId) {
        return [
            SELECT Id, Name, Phone, Type
            FROM Account
            WHERE Id in :setOfAccountId
            WITH SECURITY_ENFORCED
        ];  
    }
   /*
    * CRM-101 changes end
    */
}