public without sharing class CadastroLeadController {
    public String idParceiro {get;set;}
    public String parceiroImagem {get;set;}
    public Lead lead{get;set;}
    public CadastroLeadController(){
        idParceiro = Apexpages.currentpage().getparameters().get('idParceiro');
        if(VerificaExistenciaParceiro(idParceiro)){
        	parceiroImagem = idParceiro;    
        }else{
            parceiroImagem = 'default';
        }
        
        /*if(idParceiroAux != null){
         	idParceiro = Integer.valueOf(idParceiroAux);
        }*/
    }
    
    public Boolean VerificaExistenciaParceiro(String idParceiro){
        idParceiro = 'parceiro_' + idParceiro;
        List<StaticResource> listaResource = [SELECT Id, name, SystemModStamp FROM StaticResource where name = :idParceiro];
        return listaResource.size() > 0;
    }
    
    public void Salvar(){
        
    }
}