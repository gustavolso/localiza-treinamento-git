@isTest
public class TestVerifyDate {
    @isTest
    public static void CheckDatesTest(){
        Date data1= Date.newInstance(2020,1,10);
        Date data2 = Date.newInstance(2020,1,11);
        Date dataRetono = VerifyDate.CheckDates(data1, data2);
        System.assertEquals(data2, dataRetono);
        
        
        data1= Date.newInstance(2020,1,10);
        data2 = Date.newInstance(2020,2,11);
        dataRetono = VerifyDate.CheckDates(data1, data2);
        Date ultimaDoMes = Date.newInstance(2020, 01, 31);
        System.assertEquals(ultimaDoMes, dataRetono);
        
        data1= Date.newInstance(2020,1,10);
        data2 = Date.newInstance(2020,1,9);
        dataRetono = VerifyDate.CheckDates(data1, data2);
        
        System.assertEquals(ultimaDoMes, dataRetono);
        
	}
}