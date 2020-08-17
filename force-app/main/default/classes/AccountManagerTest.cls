@isTest
public class AccountManagerTest {
    @testSetup
    static void MakeData(){
        Account conta = new Account(Name = 'Test');
        insert conta;
        Contact contato = new Contact(FirstName = 'Name', LastName = 'LastName', AccountId = conta.Id);
        insert contato;
    }
	@isTest
    public static void Testa(){
        Account conta = [select id from Account limit 1];
        RestRequest request = new RestRequest();
        request.requestURI = 'https://test.salesforce.com/Accounts/' + conta.Id + '/contacts';
        RestContext.request = request;
        Account accountReturn = AccountManager.getAccount();
        System.assertEquals(1, accountReturn.contacts.size());
    }
}