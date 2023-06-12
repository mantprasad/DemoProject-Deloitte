public with sharing class AccountController {
    
    @AuraEnabled(cacheable=true)
    public static Account getAccountByName(String nameOfAccount) {
        return [
            SELECT Id, Name 
            FROM Account
            WHERE Name =: nameOfAccount
            WITH SECURITY_ENFORCED 
            LIMIT 1
        ]; 
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [
            SELECT Id, Name, website, OwnerId
            FROM Account 
            WITH SECURITY_ENFORCED 
            LIMIT 10
        ]; 
    }

    @AuraEnabled(cacheable=true)
    public static Account getSingleAccount() {
        return [
            SELECT Id, Name, Phone, Type,
                website, OwnerId, AnnualRevenue
            FROM Account
            WITH SECURITY_ENFORCED
            LIMIT 1
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountById(Set<Id> setOfAccountId) {
        return [
            SELECT Id, Name, Phone, Type
            FROM Account
            WHERE Id in : setOfAccountId
            WITH SECURITY_ENFORCED
        ];
    }

}