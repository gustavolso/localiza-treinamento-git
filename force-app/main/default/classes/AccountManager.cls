@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager {
    @HttpGet
    global static Account getAccount(){
    	RestRequest request = RestContext.request;
    	String accountId = request.requestURI.substringBetween('/Accounts/', '/contacts');
        return [select Id, Name, (select Id, Name from Contacts) from Account where id = :accountId];
    }
}