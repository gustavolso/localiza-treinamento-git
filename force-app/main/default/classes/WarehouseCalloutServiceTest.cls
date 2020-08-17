@IsTest
private class WarehouseCalloutServiceTest {
    @isTest
    public static void Testa(){
    	Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
        Test.startTest();
        WarehouseCalloutService.runWarehouseEquipmentSync();
        Test.stopTest();
        System.assertEquals(1, [select id from product2].size());
    }
     


}