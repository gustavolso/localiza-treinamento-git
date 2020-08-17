public class StringArrayTest {
    public static List<String> generateStringArray (Integer quantidadeVezes){
 		List<String> listRetorno = new List<String>();
		for(Integer index = 0; index < quantidadeVezes; index++){
            listRetorno.add('Test ' + index);
        }
        return listRetorno;
    }
}