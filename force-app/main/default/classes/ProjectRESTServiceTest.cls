@isTest
private class ProjectRESTServiceTest {
      @testSetup static void testSetupdata(){
		//create the opportunity record
        Opportunity opp1 = new Opportunity();
        opp1.Name = 'ABC Corp1';
        opp1.Type = 'New Project';
        opp1.Amount = 1000;
        opp1.CloseDate = Date.today();
        opp1.StageName = 'Submitted Project';
        insert opp1;
		//create the opportunity record
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'ABC Corp2';
        opp2.Type = 'New Project';
        opp2.Amount = 1000;
        opp2.CloseDate = Date.today();
        opp2.StageName = 'Resubmit Project';
        insert opp2;
        //create the Custom Settings
        ServiceTokens__c servToken = new ServiceTokens__c();
        servToken.Name = 'ProjectServiceToken';
        servToken.Token__c = 'shgglskgblsbglbdsflgbldmfbgldb';
        insert servToken;
          
        Project__c p = new Project__c(ProjectRef__c = '123', Opportunity__c = opp1.Id);
        insert p;
    }
  //Implement Apex REST service tests here
  @isTest
    public static void Testa(){
        
        //As Per Best Practice it is important to instantiate the Rest Context
        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/Something'; //Request URL
        req.httpMethod = 'POST';
    
        RestContext.request = req;
        RestContext.response= res;
    
        Opportunity opp = [SELECT id FROM Opportunity LIMIT 1];
        Test.startTest();
            ProjectRESTService.postProjectData('123', 
                                               'Test', 
                                               opp.Id, 
                                               Date.today(), 
                                               Date.today(), 
                                               1, 
                                               'Running');
        
        ProjectRESTService.postProjectData(null, 
                                               'Test', 
                                               opp.Id, 
                                               Date.today(), 
                                               Date.today(), 
                                               1, 
                                               'Running');
        Test.stopTest();
    
        //System.assertEquals('expected value', actual, 'Value is incorrect');
    }
}