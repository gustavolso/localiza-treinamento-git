@isTest
public class LeadProcessorTest {
	@testSetup
    public static void MakeData(){
        List<Lead> listLeadToInsert = new List<Lead>();
        for(Integer i = 0; i< 201; i++){
           listLeadToInsert.add(new Lead(LeadSource = 'teste',LastName = '123', Company = '321'));
        }
        insert listLeadToInsert;
    }
    @isTest
    public static void LeadProcessorTest(){
        Test.startTest();
        DataBase.executeBatch(new LeadProcessor(),200);
        Test.stopTest();
        
        System.assertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce']);
    }
}