@isTest
public class DailyLeadProcessorTest {
	@testSetup
    public static void MakeData(){
        List<Lead> listLead = new List<Lead>();
        for(Integer i = 0; i < 200; i++){
            listLead.add(new Lead(LastName = 'test', Company = 'test', LeadSource = ''));
        }
        insert listLead;
    }
    @isTest
    public static void Test(){
        Test.startTest();
        String CRON_EXP = '0 0 0 15 3 ? 2022';
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());   
        Test.stopTest();
        System.assertEquals(200, [select id from Lead where LeadSource = 'Dreamforce'].size());
    }
}