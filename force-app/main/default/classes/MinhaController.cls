public class MinhaController {
    @AuraEnabled
    public static Account GetAccountById(String contaId){
        return [select id, Site from account where Id =:contaId];
    }
    @AuraEnabled
    public static void salvar(Account conta){
        update conta;
    }
}