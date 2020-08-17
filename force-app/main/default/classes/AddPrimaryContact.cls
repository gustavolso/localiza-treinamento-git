public class AddPrimaryContact implements Queueable {
    public Contact contato;
    public String stateAbbreviation;
    public AddPrimaryContact(Contact contato, String stateAbbreviation){
        this.contato = contato;
        this.stateAbbreviation = stateAbbreviation;
    }
                                                     
    public void execute(QueueableContext context){
        List<Account> listaConta = [SELECT  id,
                                    		BillingState
                                    FROM Account
                                   	WHERE BillingState = :stateAbbreviation
                                    LIMIT 200];
        List<Contact> listToInsert = new List<Contact>();
        Contact contatoAux;
        for(Account item : listaConta){
            contatoAux = contato.Clone(false, false, false, false);
            contatoAux.AccountId = item.Id;
            listToInsert.add(contatoAux);
        }
        insert listToInsert;
    }
}