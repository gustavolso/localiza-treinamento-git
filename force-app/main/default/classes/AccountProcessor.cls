public class AccountProcessor {
    @future
    public static void countContacts(Set<String> listAccountId){
        List<Account> lista =  [SELECT  id, 
                                		name, 
                                		Number_of_Contacts__c, 
                                		(select id FROM Contacts) 
                                FROM Account 
                                WHERE id in :listAccountId];
         for(Account item : lista){
         	item.Number_of_Contacts__c = item.contacts.size();
          }
          update lista;
	}
}