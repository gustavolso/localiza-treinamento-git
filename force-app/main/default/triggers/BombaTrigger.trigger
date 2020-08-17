trigger BombaTrigger on Bomba__c (before insert) {

    List<User> listUser = [Select Id, Name, Carteira_Cliente__c from User Where Consultor__c = true Order By Carteira_Cliente__c ];
    Integer indexUsuarioAtual = 0;
	Integer indexUsuarioFuturo = 1;
    if (listUser != null){
         For(Bomba__c b: Trigger.New)
  		  {
                b.idProprietario__c =  listUser[indexUsuarioAtual].Id;
              	b.idProprietario__c = b.idProprietario__c.substring(0, 15);
		        listUser[indexUsuarioAtual].Carteira_Cliente__c ++;
              system.debug('carteira atual ' + listUser[indexUsuarioAtual].Carteira_Cliente__c + ' index: ' + indexUsuarioAtual);
              system.debug('carteira futura ' + listUser[indexUsuarioFuturo].Carteira_Cliente__c + ' index: ' + indexUsuarioFuturo);
              if (listUser.size() > 1)
              {
                  	  if(listUser[indexUsuarioAtual].Carteira_Cliente__c >= listUser[indexUsuarioFuturo].Carteira_Cliente__c)
                      {
                          indexUsuarioAtual++;
                          indexUsuarioFuturo++;
                      }
                  
             		  if(indexUsuarioAtual == listUser.size() -1)
                      {
                         indexUsuarioAtual = 0;
                      }
                  	  if(indexUsuarioFuturo == listUser.size() - 1)
                      {
                         indexUsuarioFuturo = 0;
                      }
              }
          }
        
        update listuser;
    
    }
    
   
}