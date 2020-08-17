@isTest
public class AddPrimaryContactTest {
	@testSetup
    public static void MakeData(){
        List<Account> listAccount = new List<Account>();
        Account accountAux;
        for(Integer i = 0; i < 100; i++){
            accountAux = new Account(Name = 'Name test ' + i);
            if(i < 50){
                accountAux.BillingState = 'NY';
            }else{
                accountAux.BillingState = 'CA';
            }
            listAccount.add(accountAux);
        }
        insert listAccount;
    }
    @isTest
    public static void test(){
        Test.startTest();
        AddPrimaryContact addPrimary = new AddPrimaryContact(
            								new Contact(FirstName = 'Test', LastName = 'Test 2'), 
            								'CA');
        System.enqueueJob(addPrimary);
        Test.stopTest();
        
        for(Account item : [select id, (select ID from Contacts) from Account where BillingState = 'CA']){
            System.assertEquals(1,item.Contacts.size());
        }
    }
}