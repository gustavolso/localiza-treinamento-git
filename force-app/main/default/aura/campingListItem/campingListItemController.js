({
    handleClick: function(component, event, helper) {
        var btnClicked = event.getSource();         // the button
        var btnMessage = btnClicked.get("v.label"); // the button's label
        console.log(btnMessage);
        component.set("v.message", btnMessage);     // update our message
        
        
        
        var contador = component.get('v.numero');
        contador = contador + 1;
        component.set("v.numero", contador);
    },
    funcao2: function(component, event, helper) {
    	
	}
})