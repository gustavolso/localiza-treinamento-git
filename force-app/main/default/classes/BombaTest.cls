@isTest
public class BombaTest {

    public static testmethod void TestandoBomba()
    {
        Profile p = [SELECT Id FROM Profile WHERE Name='Administrador do Sistema']; 
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com', 
            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='User1@teste.com.sdygfystarf', Consultor__c = true);
        
        
        User u2 = new User(Alias = 'standt2', Email='standarduser2@testorg.com', 
            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='User2@teste.com.sdygfystarf',  Consultor__c = true);
        
       insert u;
       insert u2;
        
        
        Ano__c ano = new Ano__c();
        insert ano;
        
        Bomba__c b1 = new Bomba__c(Name= 'Bomba 1', Ano_de_Fabricacao__c = ano.Id);       
   		Bomba__c b2 = new Bomba__c(Name= 'Bomba 2', Ano_de_Fabricacao__c = ano.Id);
        Bomba__c b3 = new Bomba__c(Name= 'Bomba 3', Ano_de_Fabricacao__c = ano.Id);
        Bomba__c b4 = new Bomba__c(Name= 'Bomba 4', Ano_de_Fabricacao__c = ano.Id);
        Bomba__c b5 = new Bomba__c(Name= 'Bomba 5', Ano_de_Fabricacao__c = ano.Id);
        
        
        List<Bomba__c> listBomb = new List<Bomba__c>();
    	listBomb.add(b1);
    	listBomb.add(b2);
        listBomb.add(b3);
        listBomb.add(b4);
        listBomb.add(b5);
        
        System.runAs(u)
        {
        	Test.startTest();
        insert listBomb;
       
		String aux = u2.Id;
        aux = aux.substring(0, 15);
         System.debug('u2 :' + aux);
        listBomb = [Select Id, Name From Bomba__c Where idProprietario__c = :aux];
        //System.assert(listBomb.size() < 4);
        //System.assert(listBomb.size() > 1);
        
        System.debug('U2' + ' ' + listBomb.size());
    
        String aux1 = u.Id;
        aux1 = aux1.substring(0, 15);
         System.debug(aux1);
        
        listBomb = [Select Id, Name From Bomba__c Where idProprietario__c = :aux1];
        
         System.debug('U' + ' ' + listBomb.size());
        //System.assert(listBomb.size() < 4);
        //System.assert(listBomb.size() > 1);
        
         listBomb = [Select Id, Name, idProprietario__c From Bomba__c ];
        
        for(Bomba__c bAux : listBomb)
        {
            System.debug(bAux.idProprietario__c);
        }
        
         Test.stopTest();    
        }
        
    }
    
    
}