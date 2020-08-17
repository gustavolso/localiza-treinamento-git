@isTest
public class AccountSelectorTest {
    @testSetup
    public static void CriarDados(){
        Account conta = new Account();
        conta.Name = 'testando';
        insert conta;
    }
    
    
    @isTest
    public static void RetornaTodasTest(){
        List<Account> lista = AccountSelector.RetornaTodas();
        System.assertEquals(1, lista.size());
        
    }
    
}