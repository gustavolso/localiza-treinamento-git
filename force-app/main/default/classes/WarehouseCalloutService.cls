public with sharing class WarehouseCalloutService {

    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    @future(callout=true)
    public static void runWarehouseEquipmentSync() {
        //ToDo: complete this method to make the callout (using @future) to the
        //      REST endpoint and update equipment on hand.

        HttpRequest request = new HttpRequest();
        request.setEndPoint(WAREHOUSE_URL);
        request.setMethod('GET');        
        HttpResponse response = new Http().send(request);
        System.debug(response);
        System.debug(response.getBody());
        
        List<Product2> equipmentlist=new List<Product2>();
        List<Object> externalEquipment = (List<Object>) JSON.deserializeUntyped(response.getBody());
        Product2 equipment;
        for(Object item : externalEquipment){
            Map<String,Object> data = (Map<String,Object>)item;
            equipment=new Product2();
            equipment.Cost__c=(Integer)data.get('cost');
            equipment.Lifespan_Months__c =(Integer)data.get('lifespan');
            equipment.Maintenance_Cycle__c =(Integer)data.get('maintenanceperiod');
            equipment.Name =(String)data.get('name');
            equipment.Current_Inventory__c =(Integer)data.get('quantity');
            equipment.Replacement_Part__c =(Boolean)data.get('replacement');
            equipment.Warehouse_SKU__c=(String)data.get('sku');
            equipmentlist.add(equipment);
        }
        upsert equipmentlist;
    }
}