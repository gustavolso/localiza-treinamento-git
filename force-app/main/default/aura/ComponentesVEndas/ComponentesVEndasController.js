({
	doInit : function(component, event, helper) {
		var action = component.get('c.GetAccountById');
        action.setParams({
            contaId: component.get('v.recordId')
        });
        action.setCallback(this, function (response) {
            var state = response.getState();
            var retorno = response.getReturnValue();
            console.log('state: ' + state);

            if (state === 'SUCCESS') {
                component.set('v.conta', retorno);
                console.log('retorno');

                console.log(retorno);

            } else {
                console.log('deu ruim: ' + retorno);
            }

        });
        $A.enqueueAction(action);
	},
    Salvar : function(component, event, helper) {
        var conta = component.get('v.conta');
        conta.Site = 'Testando 2';
        var action = component.get('c.salvar');
        action.setParams({
            conta: conta
        });
        
        $A.enqueueAction(action);
    }
})