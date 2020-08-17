public with sharing class MaintenanceRequestHelper {
    
    public static void updateWorkOrders() {
        Map<Id, Case> mapOld = (Map<Id, Case>)Trigger.OldMap;
        List<Case> listCaseBd = [SELECT id,
                                 		Status,
                                 		Vehicle__c,
                                 		Equipment__c,
                                 		Type,
                                 		Subject,
                                 		Date_Reported__c,
                                 		Date_Due__c,
                                 		Equipment__r.Maintenance_Cycle__c
                                FROM Case 
                                WHERE id in :Trigger.New];
        
        
        List<Case> listCaseToCreate = new List<Case>();
        Case newCaseAux = new Case();
        for(Case item : listCaseBd){
            if(item.Type == 'Repair' || item.Type == 'Routine Maintenance'){
                if(item.Status == 'Closed' && mapOld.get(item.Id).Status != 'Closed'){
					newCaseAux = new Case();
                    newCaseAux.Vehicle__c = item.Vehicle__c;
                    newCaseAux.Equipment__c = item.Equipment__c;
                    newCaseAux.Type = 'Routine Maintenance';
                    newCaseAux.Subject = 'Subject';
                    newCaseAux.Date_Reported__c = Date.today();
                    newCaseAux.Date_Due__c=Date.today().addDays(Integer.valueOf(
                        item.Equipment__r.Maintenance_Cycle__c));
                    listCaseToCreate.add(newCaseAux);
                }  
            }
        }
        insert listCaseToCreate;
    }
    
}