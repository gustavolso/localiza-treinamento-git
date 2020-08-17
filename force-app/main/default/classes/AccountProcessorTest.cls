@isTest
public class AccountProcessorTest {
    @testSetup
    public static void MakeData(){
        Account conta = new Account(Name = 'teste');
        insert conta;
        
        Contact contato = new Contact(FirstName = 'Teste', LastName = 'Teste2', AccountId = conta.Id);
        insert contato;
    }
    @isTest
    public static void countContactsTest(){
        Map<String, Account> mapAccounts = new Map<String, Account>([select id from Account]);
        Test.startTest();
        AccountProcessor.countContacts(mapAccounts.keySet());
        Test.stopTest();
    }
}