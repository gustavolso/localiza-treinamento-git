global class LeadProcessor implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('select id, LeadSource from Lead limit 200');
    }
    global void execute(Database.BatchableContext bc, List<Lead> records){
        List<Lead> listToUpdate = new List<Lead>();
        for(Lead item : records){
            item.LeadSource = 'Dreamforce';
            listToUpdate.add(item);
        }
        update listToUpdate;
    }    
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
}