public class AccountSelector {
    public static List<Account> RetornaTodas(){
        return [select  id,
                        Name 
                from Account];
    }
}