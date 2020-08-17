@isTest
public class teste {
    @isTest
    public static void Testa(){
       fflib_ApexMocks mocks = new fflib_ApexMocks();
       fflib_ISObjectUnitOfWork uowHock = new fflib_SObjectMocks.SObjectUnitOfWork(mocks);
        
       Opportunity opp = new Opportunity(
           Id =  fflib_IDGenerator.generate(Opportunity.SObjectType),
           Name = 'Test Opportunity',
           StageName = 'Open',
           Amount = 1000,
           CloseDate = System.today());
        List<Opportunity> testOppsList = new List<Opportunity>{opp};
		Decimal discountPercent = 10;
		//fflib_SObjectUnitOfWork.setMock(uowHock);
    }
}